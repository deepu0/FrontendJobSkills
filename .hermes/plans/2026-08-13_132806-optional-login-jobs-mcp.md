# Public jobs MCP — complete plan (no login)

> **For Hermes:** Planning only until Dee says implement. Do not start Phase 1 until Phase 0 gate passes. Login / OAuth is **out of scope**.

**Goal:** Frontend job seekers get live OFJ jobs inside ChatGPT/Codex with zero account.

**Architecture:** Skills stay the scorer/tailor/JD brain. One public MCP tool on the existing OFJ Vercel app returns published job cards. No OAuth. No `get_my_matches`. No resume-score MCP. No second host.

**Tech stack:** Next.js 16 on `fejobs` (`mcp-handler`, Node runtime, `query()` from `@/lib/db`). Plugin manifests already in `FrontendJobSkills`. OpenAI skills-only listing first; add MCP URL in a later plugin version.

**Validation state:** hypothesis. Nobody has proven ChatGPT users want live job cards. Phase 0 tests that without new OFJ eng.

---

## End-user contract

No OFJ login in this product.

| Moment | What happens |
|---|---|
| Score / tailor / JD | Skill only. Official scan is a link to `/resume-score` (site may ask login — OFJ’s existing page, not this plugin). |
| “Find React jobs this week” | MCP `search_frontend_jobs` → up to 5 public cards + OFJ URLs + UTM. |
| Salary | Skill + link to `/salary-calculator`. |

Never: login wall. Never: ChatGPT calls `/api/resume-score`.

---

## Phase 0 — ship what exists (no MCP)

**Gate to leave Phase 0:** either (a) `utm_source=frontend-job-skills` shows sessions on OFJ, or (b) Dee overrides in writing (“build MCP anyway”).

1. Post the GitHub repo once (LI / Telegram). Install line only.
2. Submit skills-only plugin if Apps Management + verified identity exist. Form: `docs/openai-plugin-submission.md`.
3. Watch PostHog/GSC for UTM. 2 weeks or Dee override.

**Files:** none in fejobs. Plugin repo already shipped.

**Do not** start `/api/mcp` in this phase.

---

## Phase 1 — public jobs MCP (no login)

**Hypothesis:** people who already used the skill will click through more if ChatGPT returns 5 live jobs instead of a hub URL.

### Product

One tool:

```
search_frontend_jobs({
  tech: 'react' | 'javascript' | 'typescript' | 'nextjs' | 'vue' | 'angular' | 'svelte',
  level?: 'junior' | 'mid' | 'senior' | 'staff',
  posted_within_days?: 7 | 14 | 30   // default 14
})
```

Returns max **5** objects:

- `title`, `company`, `url` (absolute `https://onlyfrontendjobs.com/jobs/{slug}?utm_source=frontend-job-skills&utm_medium=mcp&utm_campaign=search`)
- `tech_stack` (string[]), `experience_level`, `location`
- `salary_min`, `salary_max`, `salary_currency` (null if unpublished)
- `posted_at`

No job HTML, no recruiter email, no apply-tracker junk, no user PII.

Empty result: `{ jobs: [], browse_url: "https://onlyfrontendjobs.com/remote-react-developer-jobs?utm_..." }`. Do not invent jobs.

### Where it lives

Same Vercel app as OFJ.

- URL: `https://onlyfrontendjobs.com/api/mcp`
- Runtime: Node (`verify` / `query()` cannot run on Edge)
- Auth: none
- Rate limit: prefixed key `mcp-search:` + IP, tight (start **30 / hour / IP**). Soft 429 with Retry-After.

Reuse list logic; do not write a third jobs WHERE builder. Start from `src/lib/salary-matched-jobs.ts` patterns and the browse list/count WHERE if one shared builder exists. New module if needed: `src/lib/mcp/search-frontend-jobs.ts` + lock tests.

### Files (fejobs)

- Create: `src/lib/mcp/search-frontend-jobs.ts` — allowlist + query
- Create: `src/lib/mcp/public-job.ts` — column allowlist + type (same idea as `referrers-public.ts`)
- Create: `src/app/api/mcp/route.ts` — `createMcpHandler` from `mcp-handler`, export GET/POST/DELETE, `runtime = 'nodejs'`, `maxDuration` modest (15–30s)
- Create: `tests/mcp-search-frontend-jobs.test.ts` — allowlist shape, empty tech → 400, invalid enum → 400, SQL placeholders, UTM on url
- Modify: rate-limiter call site with **prefixed** key (do not share resume-scan keys)
- Modify: `next.config` only if `/api/mcp` needs CORS for ChatGPT. Prefer default; add Access-Control only if inspector/ChatGPT preflight fails
- Domain: `/.well-known/openai-apps-challenge` when the portal asks (Phase 1 submit-with-MCP)

### Files (FrontendJobSkills)

- Modify: `skills/remote-job-strategy/SKILL.md` and `frontend-job-analyzer/SKILL.md` — “if MCP `search_frontend_jobs` exists, call it; else hub URL”
- Modify: `.codex-plugin/plugin.json` — do **not** point at MCP until the route is live in prod
- Later plugin version: `dependencies.tools` MCP url `https://onlyfrontendjobs.com/api/mcp`

### Tests / verify

1. Unit: allowlist — a test fails if SELECT gains a column not in the public type.
2. Unit: invalid `tech` → 400, no query.
3. Local: `npx @modelcontextprotocol/inspector` → Streamable HTTP → `http://localhost:3000/api/mcp` → call tool.
4. Staging/prod: one curl initialize + tools/call. Confirm 5 or fewer jobs, all `status` implied published, URLs 200.
5. Load: 20 parallel calls. Watch Sentry for `timeout exceeded when trying to connect`. If it fires, stop and fix pool/soft-fail before directory submit.

### Deploy / cost

- Same Vercel project. No new host.
- Hosting $: ~0 on current Pro at <1k calls/day.
- Risk $: pool saturation (existing P0 class).
- OpenAI: $0 listing. Submit as **With MCP** only after inspector is green on the **production** URL. Skills-only can stay listed until then; adding MCP is a new plugin version.

### Phase 1 gate (to start Phase 2)

- Tool live ≥ 2 weeks **or** Dee override.
- Abuse: 429s exist and are not melting the DB.
- At least some `utm_medium=mcp` sessions. If zero after real ChatGPT use, do not expand the tool.

---

## Cut — login / OAuth

Out of scope. No `get_my_matches`. No Supabase OAuth for ChatGPT. Revisit only as a new plan if public search is actually used.

## Out of scope

- MCP UI / ChatGPT app iframe
- Salary blend MCP
- Resume-score MCP
- Separate Fly/CF host
- “12 jobs 80% fit” without a real matcher

---

## Risks

| Risk | Mitigation |
|---|---|
| Pool timeouts from ChatGPT fan-out | Cap 5 rows, 30/hour/IP, watch Sentry connect errors |
| PII leak via job body | Allowlist module + lock test |
| Invented jobs when SQL empty | Return `[]` + browse_url |
| Skills-only listing vs MCP version | Skills-only live first; MCP is a later plugin version |
| Builds instead of outbound | Phase 0 is the post |

---

## Open questions (Dee)

1. Override Phase 0 and build MCP now?
2. Submit skills-only now, or wait for MCP and do one review?

Recommend: skills-only submit now. MCP after UTM or an explicit override.

---

## Suggested implement order (when Dee says go)

Phase 0 is ops, not a PR.

Phase 1 PRs (fejobs, draft only):

1. `feat: public job card allowlist + search query` (TDD)
2. `feat: /api/mcp search_frontend_jobs + rate limit`
3. `docs: FrontendJobSkills skills call MCP when present`
