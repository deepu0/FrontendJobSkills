# Frontend Job Skills

**Open-source AI skills for frontend developers who are job hunting.**

Install once in ChatGPT, Cursor, Claude Code, Codex, or Windsurf. Ask normal questions — the agent follows workflows that score your resume, judge a JD, tailor bullets, prep interviews, and send you to **live pages on [OnlyFrontendJobs](https://onlyfrontendjobs.com)**.

Not a generic resume pack. Not auto-apply. Not employer Greenhouse/Lever links.

Inspired by [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) — same `npx skills` install pattern, but **frontend-only**, rubric-synced to OnlyFrontendJobs, with live job cards when the public API is up.

## What this is

| | |
|---|---|
| **For** | Frontend / React / TypeScript developers searching remote roles |
| **Format** | 11 `SKILL.md` workflows + a packable ChatGPT plugin (`v1.1.0`) |
| **Brain** | Your AI agent (skills teach it *how* to help) |
| **Data** | [OnlyFrontendJobs](https://onlyfrontendjobs.com) — rubric, salary ladder, job listings |
| **Login** | None required in the plugin. Official resume scan on OFJ may ask for account. |

## What you can do

| You say | Skill |
|---------|--------|
| "Score my frontend resume" | `frontend-resume-scorer` → rubric /100, rewrite, `/resume-score` |
| "Should I apply?" + JD + resume | `frontend-job-analyzer` → match %, red flags, live jobs |
| "Tailor my resume to this JD" | `frontend-resume-tailor` → reorder truthfully, no fake stack |
| "Find React jobs this week" | `remote-job-strategy` → live cards or OFJ hubs |
| "What salary should I ask?" | `salary-calculator` → OFJ ladder → `/salary-calculator` |
| "Plan my remote search" | `remote-job-strategy` → 5–10 tailored apps/week |

Copy-paste prompts: [examples/expected-prompts.md](examples/expected-prompts.md)

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

## Skills by category

### Resume

| Skill | What it does |
|-------|----------------|
| [frontend-resume-scorer](skills/frontend-resume-scorer) | Score /100 with OFJ rubric v1.1.0, full rewrite in chat |
| [frontend-resume-tailor](skills/frontend-resume-tailor) | Tailor one resume to one JD — no fake tech |
| [frontend-bullet-writer](skills/frontend-bullet-writer) | Weak bullets → action + tech + a real metric |

### Job search

| Skill | What it does |
|-------|----------------|
| [frontend-job-analyzer](skills/frontend-job-analyzer) | Stack fit, real seniority, red flags, similar live jobs |
| [remote-job-strategy](skills/remote-job-strategy) | Weekly plan: 5–10 tailored apps on OFJ |

### Online presence

| Skill | What it does |
|-------|----------------|
| [frontend-linkedin-optimizer](skills/frontend-linkedin-optimizer) | Headline, About, Featured, Open to Work |
| [portfolio-reviewer](skills/portfolio-reviewer) | Review a live portfolio or repo (fetch first) |
| [github-profile-optimizer](skills/github-profile-optimizer) | README, pins, recruiter-ready profile |

### Interview & compensation

| Skill | What it does |
|-------|----------------|
| [frontend-interview-prep](skills/frontend-interview-prep) | JS / React / system design from the actual JD |
| [salary-calculator](skills/salary-calculator) | Estimate pay with OFJ 2025–26 tiers |
| [frontend-cover-letter](skills/frontend-cover-letter) | Short letter when the form requires one |

## Supported agents

Works with any tool that loads `SKILL.md` files, including:

- **ChatGPT** — skills plugin upload ([release zip](https://github.com/deepu0/FrontendJobSkills/releases/latest))
- **Cursor** · **Claude Code** · **Codex** · **Windsurf** · **Gemini CLI** · **OpenCode**
- **30+ agents** via `npx skills add` (same installer as [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills))

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

### Uninstall

```bash
npx skills remove frontend-resume-scorer
npx skills remove frontend-job-analyzer
# … or remove the whole install directory for your agent, e.g.:
# rm -rf ~/.cursor/skills/frontend-*
```

## Try it with sample files

| File | Use |
|------|-----|
| [examples/sample-resume-react-mid.md](examples/sample-resume-react-mid.md) | Scorer + tailor demos |
| [examples/sample-jd-react-senior.md](examples/sample-jd-react-senior.md) | Job analyzer demos |
| [examples/expected-prompts.md](examples/expected-prompts.md) | Copy-paste test prompts |

## Example session

```
User: Here's my resume [paste examples/sample-resume-react-mid.md]. React + TypeScript, 3 years, Bengaluru.

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
