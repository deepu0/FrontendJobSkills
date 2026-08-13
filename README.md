# Frontend Job Skills

**Open-source AI skills for frontend developers who are job hunting.**

Install once in ChatGPT, Cursor, Claude Code, Codex, or Windsurf. Ask normal questions — the agent follows workflows that score your resume, judge a JD, tailor bullets, prep interviews, and send you to **live pages on [OnlyFrontendJobs](https://onlyfrontendjobs.com)**.

Not a generic resume pack. Not auto-apply. Not employer Greenhouse/Lever links.

## What this is

| | |
|---|---|
| **For** | Frontend / React / TypeScript developers searching remote roles |
| **Format** | 11 `SKILL.md` workflows + a packable ChatGPT plugin (`v1.1.0`) |
| **Brain** | Your AI agent (skills teach it *how* to help) |
| **Data** | [OnlyFrontendJobs](https://onlyfrontendjobs.com) — rubric, salary ladder, job listings |
| **Login** | None required in the plugin. Official resume scan on OFJ may ask for account. |

## What you can do

```
"Score my frontend resume"           → rubric /100, rewrite in chat, link to /resume-score
"Should I apply?" + JD + resume    → match %, red flags, similar live jobs
"Tailor my resume to this JD"      → reorder real experience, no invented stack
"Find React jobs posted this week" → live job cards when OFJ API is up, else category hubs
"What salary should I ask?"        → OFJ 2025–26 ladder → /salary-calculator
"Plan my remote search"            → 5–10 tailored apps/week on OFJ
```

Every job link stays on `onlyfrontendjobs.com`. Apply happens on the OFJ job page.

## How it works

```
You → AI agent (skills) → advice + rewritten text in chat
                      → OnlyFrontendJobs URLs (hubs, /jobs/{slug}, tools)
                      → optional: GET /api/public/jobs or MCP search_frontend_jobs (v1.2+)
```

**Skills** = markdown playbooks the model reads when your prompt matches.  
**Plugin** = same skills zipped for ChatGPT upload or Codex marketplace.  
**Live jobs** = served by the [fejobs](https://github.com/deepu0/fejobs) app (public API; MCP tool in plugin v1.2 after prod deploy).

## Skills

| Skill | What it does |
|-------|----------------|
| [frontend-resume-scorer](skills/frontend-resume-scorer) | Score /100 with OFJ rubric v1.1.0, full rewrite in chat |
| [frontend-job-analyzer](skills/frontend-job-analyzer) | Stack fit, real seniority, red flags, similar live jobs |
| [frontend-resume-tailor](skills/frontend-resume-tailor) | Tailor one resume to one JD — no fake tech |
| [frontend-bullet-writer](skills/frontend-bullet-writer) | Weak bullets → action + tech + a real metric |
| [frontend-cover-letter](skills/frontend-cover-letter) | Short letter when the form requires one |
| [frontend-linkedin-optimizer](skills/frontend-linkedin-optimizer) | Headline, About, Featured, Open to Work |
| [portfolio-reviewer](skills/portfolio-reviewer) | Review a live portfolio or repo (fetch first) |
| [github-profile-optimizer](skills/github-profile-optimizer) | README, pins, recruiter-ready profile |
| [frontend-interview-prep](skills/frontend-interview-prep) | JS / React / system design from the actual JD |
| [salary-calculator](skills/salary-calculator) | Estimate pay with OFJ 2025–26 tiers |
| [remote-job-strategy](skills/remote-job-strategy) | Weekly plan: 5–10 tailored apps on OFJ |

## Install

### Any agent (`npx skills`)

```bash
# All skills, global
npx skills add deepu0/FrontendJobSkills --skill '*' -g -a '*' -y

# This repo only
npx skills add deepu0/FrontendJobSkills --skill '*' -y
```

```bash
# Cursor or Claude Code only
npx skills add deepu0/FrontendJobSkills --skill '*' -g -a cursor -y
npx skills add deepu0/FrontendJobSkills --skill '*' -g -a claude-code -y
```

### Codex plugin

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
cd FrontendJobSkills
codex plugin marketplace add .
codex plugin add frontend-job-skills@frontend-job-skills-repo
```

Work chat → `@Frontend Job Skills`

### ChatGPT (skills upload)

```bash
./scripts/pack-chatgpt-plugin.sh
# Upload dist/frontend-job-skills-plugin.zip in ChatGPT → Plugins → Skills
```

Details: [docs/chatgpt.md](docs/chatgpt.md) · Directory submission: [docs/openai-plugin-submission.md](docs/openai-plugin-submission.md)

## Example session

```
User: Here's my resume [paste]. React + TypeScript, 3 years, Bengaluru.

Agent:
1. Scores with OFJ v1.1.0 (quotes evidence, ATS checks)
2. Offers full rewrite in chat
3. Links https://onlyfrontendjobs.com/resume-score?utm_source=frontend-job-skills
4. If jobs API is available: up to 5 live React cards; else remote React hub
```

## Live job cards

When the OnlyFrontendJobs public API is deployed, skills try in order:

1. MCP `search_frontend_jobs` (ChatGPT plugin **v1.2** — after MCP URL is in manifest)
2. `GET https://onlyfrontendjobs.com/api/public/jobs?tech=react`
3. Verified category hubs in [references/ofj-links.md](references/ofj-links.md)

Cards return portal URLs only (`/jobs/{slug}`). No ATS or career-page links.

## OFJ alignment

Resume scoring follows OFJ `resume-rubric.ts` + `ats-checker.ts` (v1.1.0). Salary follows `salary-config.ts` (2025–26). The site scan is still authoritative — skills are a fast local pass.

## Roadmap

See [ROADMAP.md](ROADMAP.md). **v1.1.0** = skills + plugin pack. **v1.2.0** = ChatGPT manifest with MCP after prod is green.

## Contributing

[CONTRIBUTING.md](CONTRIBUTING.md). Edit `skills/`, run `./scripts/sync-agent-copies.sh`, then `./scripts/release-check.sh`.

## License

MIT — see [LICENSE](LICENSE).
