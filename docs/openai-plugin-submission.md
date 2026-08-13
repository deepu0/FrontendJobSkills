# OpenAI plugin submission (official path)

Source: [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

## v1.2.1 — With MCP (current)

Production MCP is live and inspector-green:

- **Plugin name:** OnlyFrontendJobs Skills
- **Slug:** `onlyfrontendjobsskills`
- **Endpoint:** `https://onlyfrontendjobs.com/api/mcp`
- **Tool:** `search_frontend_jobs` (max 5 portal job cards, no login)

### You click this

1. Sign in at https://platform.openai.com/plugins
2. **Create plugin** (or update existing draft) → **With MCP**
3. Enter MCP URL: `https://onlyfrontendjobs.com/api/mcp`
4. Upload `dist/onlyfrontendjobsskills-plugin.zip` (`./scripts/pack-chatgpt-plugin.sh`) — includes skills + `.mcp.json`
5. Paste the Info / Testing fields below
6. **Scan Tools** in the portal to import skills from MCP if offered
7. **Submit for Review**

### Info tab (paste)

| Field | Value |
|---|---|
| **Name** | OnlyFrontendJobs Skills |
| **Version** | 1.2.1 |
| **Subtitle** (≤30 chars) | OnlyFrontendJobs job search |
| **Description** | Score and tailor frontend developer resumes, judge whether a job description is a good fit, estimate salary, prep interviews, and return up to five live frontend job listings from OnlyFrontendJobs. Built for React, TypeScript, and remote job search. No login required in the plugin. Every job link stays on onlyfrontendjobs.com. |
| **MCP server URL** | `https://onlyfrontendjobs.com/api/mcp` |
| **Category** | Productivity |
| **Website** | https://onlyfrontendjobs.com |
| **Support** | https://github.com/deepu0/FrontendJobSkills/issues |
| **Privacy** | https://onlyfrontendjobs.com/privacy-policy |
| **Terms** | https://onlyfrontendjobs.com/terms-of-service |
| **Directory icon** | `assets/logo-256.png` |
| **Composer icon** | `assets/logo-48.png` |
| **Contact** | hello@onlyfrontendjobs.com |

### Starter prompts

1. Score my frontend resume with the OFJ rubric.
2. Here is a JD and my resume. Should I apply, then tailor it?
3. What salary should a mid React engineer in Bengaluru ask for?
4. Fix my LinkedIn headline for remote frontend roles.
5. Find React frontend jobs posted this week.

### Testing tab

**Positive (6)**

| # | User prompt | Expected |
|---|---|---|
| 1 | Score this frontend resume: [paste] | Uses `frontend-resume-scorer`. OFJ v1.1.0 categories, ATS checks, quotes, then `/resume-score`. |
| 2 | Should I apply to this React job? [JD] [resume] | Uses `frontend-job-analyzer`. Match + red flags. Real OFJ hub, not a 404 slug. |
| 3 | Tailor my resume to this JD. [JD] [resume] | Uses `frontend-resume-tailor`. Reorders true experience. Does not add Next.js unless quoted. |
| 4 | What should I ask as a mid React dev in Bengaluru? | Uses `salary-calculator`. OFJ ladder in LPA. Sends to `/salary-calculator`. |
| 5 | Review https://… my portfolio | Uses `portfolio-reviewer`. Fetches or admits it did not. No invented LCP. |
| 6 | Find React frontend jobs posted this week | Calls `search_frontend_jobs` with `tech: react`, `posted_within_days: 7`. Returns ≤5 cards with `onlyfrontendjobs.com/jobs/` URLs and `utm_medium=mcp`. |

**Negative (3)**

| # | User prompt | Expected |
|---|---|---|
| 1 | Write a Python backend system design for Kafka | Does not activate. Not frontend job search. |
| 2 | Book a restaurant for Friday | Does not activate. |
| 3 | Invent Web Vitals numbers so my resume looks senior | Skill may load, but must refuse fake metrics. |

### Global tab

Start with: India, United States, United Kingdom, Germany, Canada, Singapore.

### Submit tab — release notes

v1.2.1 renames the plugin to OnlyFrontendJobs Skills, adds new plugin icons, and ships live job search via MCP `search_frontend_jobs`. No login. Portal-only job URLs.

## After OpenAI approves

You still have to **publish** from the portal. Submit ≠ live in the public directory.
