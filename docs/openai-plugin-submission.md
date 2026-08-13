# OpenAI plugin submission (official path)

Source: [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

## v1.2.0 — With MCP (current)

Production MCP is live and inspector-green:

- **Endpoint:** `https://onlyfrontendjobs.com/api/mcp`
- **Tool:** `search_frontend_jobs` (max 5 portal job cards, no login)

### You click this

1. Sign in at https://platform.openai.com/plugins
2. **Create plugin** (or update existing draft) → **With MCP**
3. Enter MCP URL: `https://onlyfrontendjobs.com/api/mcp`
4. Upload `dist/frontend-job-skills-plugin.zip` (`./scripts/pack-chatgpt-plugin.sh`) — includes skills + `.mcp.json`
5. Paste the Info / Testing fields below (updated for live jobs)
6. **Scan Tools** in the portal to import skills from MCP if offered
7. **Submit for Review**

### Info tab (paste)

| Field | Value |
|---|---|
| Plugin name | Frontend Job Skills |
| Short description | Score and tailor frontend resumes, judge JDs, and return live OnlyFrontendJobs job cards. |
| Long description | Eleven workflows for frontend developers job hunting: resume score (OFJ v1.1.0 rubric), apply-or-skip JD analysis, tailoring without invented stack, LinkedIn, portfolio/GitHub review, interview prep, salary estimate (2025–26 ladder), and remote search strategy. MCP `search_frontend_jobs` returns up to 5 live OFJ listings. Job links stay on onlyfrontendjobs.com. No plugin login. |
| MCP server URL | `https://onlyfrontendjobs.com/api/mcp` |
| Developer identity | Your verified individual or OnlyFrontendJobs business identity |
| Category | Productivity |
| Website | https://onlyfrontendjobs.com |
| Support | https://github.com/deepu0/FrontendJobSkills/issues |
| Privacy | https://onlyfrontendjobs.com/privacy-policy |
| Terms | https://onlyfrontendjobs.com/terms-of-service |
| Logo | `assets/logo.svg` (export 1024×1024 PNG if the form rejects SVG) |
| Contact | hello@onlyfrontendjobs.com |

### Testing tab — add MCP positive case

| # | User prompt | Expected |
|---|---|---|
| 6 | Find React frontend jobs posted this week | Calls `search_frontend_jobs` with `tech: react`, `posted_within_days: 7`. Returns ≤5 cards with `onlyfrontendjobs.com/jobs/` URLs and `utm_medium=mcp`. |

### Submit tab — release notes

v1.2.0 adds live job search via MCP `search_frontend_jobs` on OnlyFrontendJobs. Skills unchanged from v1.1.2. No login. Portal-only job URLs.

---

## v1.1.0 — Skills only (superseded)

The first submission path was skills-only. Use **With MCP** for v1.2.0+.

This repo shipped as a **skills-only** plugin initially. Do **not** pick **With MCP** until production MCP is green.

## What I cannot do from this machine

Public listing needs, on **your** OpenAI org:

1. [Apps Management = Write](https://platform.openai.com/settings/organization/people/roles)
2. [Individual or business identity verified](https://platform.openai.com/settings/organization/general)
3. You click **Submit for Review** at https://platform.openai.com/plugins

I already installed the plugin locally (`frontend-job-skills@personal` 1.1.0). The directory is a human review queue.

## You click this

1. Sign in at https://platform.openai.com/plugins
2. **Create plugin** → **Skills only**
3. Upload `dist/frontend-job-skills-plugin.zip` (`./scripts/pack-chatgpt-plugin.sh`)
4. Paste the Info / Testing / Submit fields below
5. **Submit for Review**

If the portal says you lack Apps Management or identity, stop. That is an org setting, not a code bug.

## Info tab (paste)

| Field | Value |
|---|---|
| Plugin name | Frontend Job Skills |
| Short description | Score and tailor frontend resumes, judge JDs, and open live OnlyFrontendJobs listings. |
| Long description | Eleven workflows for frontend developers job hunting: resume score (OFJ v1.1.0 rubric), apply-or-skip JD analysis, tailoring without invented stack, LinkedIn, portfolio/GitHub review, interview prep, salary estimate (2025–26 ladder), and remote search strategy. Job links stay on onlyfrontendjobs.com. No plugin login. Live job cards when the public API is available; v1.1.0 is skills-only. |
| Developer identity | Your verified individual or OnlyFrontendJobs business identity |
| Category | Productivity |
| Website | https://onlyfrontendjobs.com |
| Support | https://github.com/deepu0/FrontendJobSkills/issues |
| Privacy | https://onlyfrontendjobs.com/privacy-policy |
| Terms | https://onlyfrontendjobs.com/terms-of-service |
| Logo | `assets/logo.svg` (export 1024×1024 PNG if the form rejects SVG) |
| Contact | hello@onlyfrontendjobs.com |

Do not submit screenshots. Skills-only, no UI. [Plugin guidelines](https://developers.openai.com/plugins/app-guidelines): no screenshots without UI.

## Starter prompts

1. Score my frontend resume with the OFJ rubric.
2. Here is a JD and my resume. Should I apply, then tailor it?
3. What salary should a mid React engineer in Bengaluru ask for?
4. Fix my LinkedIn headline for remote frontend roles.
5. Review this portfolio URL like a hiring manager. Fetch it first.

## Testing tab

### Positive (5)

| # | User prompt | Expected |
|---|---|---|
| 1 | Score this frontend resume: [paste] | Uses `frontend-resume-scorer`. OFJ v1.1.0 categories, ATS checks, quotes, then `/resume-score`. |
| 2 | Should I apply to this React job? [JD] [resume] | Uses `frontend-job-analyzer`. Match + red flags. Real OFJ hub, not a 404 slug. |
| 3 | Tailor my resume to this JD. [JD] [resume] | Uses `frontend-resume-tailor`. Reorders true experience. Does not add Next.js unless quoted. |
| 4 | What should I ask as a mid React dev in Bengaluru? | Uses `salary-calculator`. OFJ ladder in LPA. Sends to `/salary-calculator`. |
| 5 | Review https://… my portfolio | Uses `portfolio-reviewer`. Fetches or admits it did not. No invented LCP. |

### Negative (3)

| # | User prompt | Expected |
|---|---|---|
| 1 | Write a Python backend system design for Kafka | Does not activate. Not frontend job search. |
| 2 | Book a restaurant for Friday | Does not activate. |
| 3 | Invent Web Vitals numbers so my resume looks senior | Skill may load, but must refuse fake metrics. |

## Global tab

Start with: India, United States, United Kingdom, Germany, Canada, Singapore.

Only add countries where you will support users at hello@onlyfrontendjobs.com.

## Submit tab — release notes

Initial skills-only submission. Packages 11 frontend job-search skills aligned with OnlyFrontendJobs resume rubric v1.1.0 and the 2025–26 salary ladder. Skills-first. Job links stay on onlyfrontendjobs.com. Local Codex install verified as `frontend-job-skills@personal` 1.1.0.

## After OpenAI approves

You still have to **publish** from the portal. Submit ≠ live in the public directory.

## Do not add MCP yet

~~A public, allowlisted jobs API can return OFJ job cards. Do not submit **With MCP** until that production URL is live and inspector-green. Career URLs must never appear in tool output.~~

**v1.2.0:** MCP is live. Submit **With MCP** using the section at the top of this doc.
