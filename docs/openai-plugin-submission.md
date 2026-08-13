# OpenAI plugin submission (official path)

Source: [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

## v1.2.2 — With MCP (current)

Production MCP is live and inspector-green:

- **Plugin name:** OnlyFrontendJobs Copilot
- **Slug:** `onlyfrontendjobsskills`
- **Endpoint:** `https://www.onlyfrontendjobs.com/api/mcp`
- **Tool:** `search_frontend_jobs` (max 5 portal job cards, no login)

### You click this

1. Sign in at https://platform.openai.com/plugins
2. **Create plugin** (or update existing draft) → **With MCP**
3. Enter MCP URL: `https://www.onlyfrontendjobs.com/api/mcp`
4. Upload `dist/onlyfrontendjobsskills-plugin.zip` (`./scripts/pack-chatgpt-plugin.sh`) — includes skills + `.mcp.json`
5. Paste the Info / Testing fields below
6. **Scan Tools** in the portal to import skills from MCP if offered
7. **Submit for Review**

### Info tab (paste)

| Field | Value |
|---|---|
| **Name** | OnlyFrontendJobs Copilot |
| **Version** | 1.2.5 |
| **Subtitle** (≤30 chars) | Find & tailor frontend jobs |
| **Description** | Your frontend job-search copilot on OnlyFrontendJobs. Score and rewrite your resume, decide whether a role is worth applying to, tailor bullets to a job description, prep for interviews, estimate salary, and browse fresh React and TypeScript listings. Built for remote and hybrid frontend developers. |
| **MCP server URL** | `https://www.onlyfrontendjobs.com/api/mcp` |
| **Category** | Productivity |
| **Website** | https://onlyfrontendjobs.com |
| **Support** | https://github.com/deepu0/FrontendJobSkills/issues |
| **Privacy** | https://onlyfrontendjobs.com/privacy-policy |
| **Terms** | https://onlyfrontendjobs.com/terms-of-service |
| **Directory icon** | `assets/logo-256.png` |
| **Composer icon** | `assets/logo-48.png` |
| **Contact** | hello@onlyfrontendjobs.com |

### Starter prompts

1. Find React jobs posted this week
2. Score my frontend resume and suggest improvements
3. Here is a JD and my resume — should I apply?
4. What salary should a mid React engineer in Bengaluru ask for?
5. Fix my LinkedIn headline for remote frontend roles

### Testing tab

**Positive (6)**

| # | User prompt | Expected |
|---|---|---|
| 1 | Score this frontend resume: [paste] | Resume score /100, category breakdown, ATS checks, rewrite offer, link to official resume scorer |
| 2 | Should I apply to this React job? [JD] [resume] | Match %, red flags, apply/tailor/skip, similar live roles |
| 3 | Tailor my resume to this JD. [JD] [resume] | Reorders real experience only — no invented stack |
| 4 | What should I ask as a mid React dev in Bengaluru? | Salary range in LPA, link to salary calculator |
| 5 | Review https://… my portfolio | Honest portfolio feedback — admits if URL could not be fetched |
| 6 | Find React frontend jobs posted this week | Up to 5 live OnlyFrontendJobs job cards with apply links |

**Negative (3)**

| # | User prompt | Expected |
|---|---|---|
| 1 | Write a Python backend system design for Kafka | Does not activate. Not frontend job search. |
| 2 | Book a restaurant for Friday | Does not activate. |
| 3 | Invent Web Vitals numbers so my resume looks senior | Skill may load, but must refuse fake metrics. |

### Global tab

Start with: India, United States, United Kingdom, Germany, Canada, Singapore.

### Submit tab — release notes

v1.2.2 improves listing copy and conversation UX. Live job search via OnlyFrontendJobs. Score resumes, judge job posts, tailor applications.

## After OpenAI approves

You still have to **publish** from the portal. Submit ≠ live in the public directory.
