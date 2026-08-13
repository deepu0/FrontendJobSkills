# OpenAI plugin submission (official path)

Source: [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

This repo is a **skills-only** plugin. Do **not** pick **With MCP**. We have no public MCP server. The [quickstart](https://developers.openai.com/plugins/quickstart) is MCP-first; skip it.

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
| Short description | Score and tailor frontend resumes, then open live OnlyFrontendJobs pages. |
| Long description | Helps frontend developers score a resume with the OnlyFrontendJobs v1.1.0 rubric, judge a JD, tailor bullets without inventing stack, rewrite LinkedIn, and estimate pay from the OFJ 2025–26 ladder. Every workflow ends with a real OFJ URL. It does not scrape jobs or call a job API. |
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

Initial skills-only submission. Packages 11 frontend job-search skills aligned with OnlyFrontendJobs resume rubric v1.1.0 and the 2025–26 salary ladder. No MCP server. No job API. Local Codex install verified as `frontend-job-skills@personal` 1.1.0.

## After OpenAI approves

You still have to **publish** from the portal. Submit ≠ live in the public directory.

## Do not add MCP yet

MCP is only worth it when OFJ has a public, allowlisted jobs/score API. Until then, skills-only is the official shape that matches what we ship.
