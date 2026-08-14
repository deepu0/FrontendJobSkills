# OnlyFrontendJobs Copilot

[![CI](https://github.com/deepu0/FrontendJobSkills/actions/workflows/ci.yml/badge.svg)](https://github.com/deepu0/FrontendJobSkills/actions/workflows/ci.yml)
[![Version](https://img.shields.io/badge/version-1.2.5-4f46e5)](CHANGELOG.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-11-0ea5e9)](#skills)
[![OnlyFrontendJobs](https://img.shields.io/badge/powered%20by-OnlyFrontendJobs-ff6b35)](https://onlyfrontendjobs.com)

**The frontend job-search toolkit that lives inside your AI agent.**

Score your resume 0–100, judge any JD, tailor bullets, prep React interviews, estimate salary, and browse **live frontend listings** — without leaving ChatGPT, Cursor, Claude, or Codex.

> Built for **React / TypeScript / Next.js** and remote roles. Not a generic resume pack.

<p align="center">
  <img src="assets/logo.png" width="160" alt="OnlyFrontendJobs Copilot logo" />
</p>

Inspired by [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) — same `npx skills` install, synced to [OnlyFrontendJobs](https://onlyfrontendjobs.com) rubric v1.1.0.

---

## Why frontend devs star this

- **Live jobs, not stale dumps** — MCP at `onlyfrontendjobs.com/api/mcp` + REST fallback. No fake listings.
- **Evidence-based resume score** — 7 rubric categories + 6 ATS checks, each point needs a verbatim quote.
- **One prompt to value** — paste resume → get score + rewrite + matching jobs in one thread.
- **Frontend-only** — no backend/PM/data noise. Every example is React, JS, or UI.
- **30-second install** — works with `npx skills` on 30+ agents.

## What you can do

| You say | What happens |
|---------|----------------|
| "Score my frontend resume" | Score out of 100, ATS checks, full rewrite offer |
| "Should I apply?" + JD + resume | Match %, red flags, similar live roles |
| "Tailor my resume to this JD" | Reorder your real experience for the posting |
| "Give me frontend jobs" / "Find React jobs" | Up to 5 fresh listings from OnlyFrontendJobs |
| "What salary should I ask?" | Pay range estimate → official salary tool |
| "Plan my remote search" | Weekly plan: focused applies, not spray-and-pray |

Copy-paste test prompts: [examples/expected-prompts.md](examples/expected-prompts.md)

## 30-second demo

```text
You: Score my resume [paste]. 3 years React, Bengaluru, looking remote.

Copilot: Namaskaram 🙏 — Scored 64/100
  • ATS: 8/10 (single column ✓, keywords ✓, no tables)
  • Impact: 2/4 — "Built dashboard" → "Shipped React dashboard for 12k MAU, cut LCP 2.8→1.9s"
  • Top 3 gains: +6 pts add scope to 2 bullets, +4 pts move skills above projects
  Want (1) full resume rewrite, (2) jobs only, or (3) both?

You: 3

Copilot: [Full resume rewrite — same facts, stronger bullets] + 3 live React roles near your stack
```

> No invented metrics. No employer ATS links — every job opens on `onlyfrontendjobs.com`.

## Install

### Any agent (`npx skills`) — recommended

```bash
npx skills add deepu0/FrontendJobSkills --skill '*' -g -a '*' -y
```

Works on ChatGPT, Cursor, Claude Code, Codex, Windsurf, Gemini CLI, OpenCode, and 30+ agents.

### Codex plugin

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
cd FrontendJobSkills
codex plugin marketplace add .
codex plugin add onlyfrontendjobsskills@onlyfrontendjobsskills-repo
# then in Codex → Settings → Plugins → enable bundled "onlyfrontendjobs" MCP
```

Work chat → `@OnlyFrontendJobs Copilot` · Details: [docs/codex-local.md](docs/codex-local.md)

### ChatGPT

```bash
./scripts/pack-chatgpt-plugin.sh
# Upload dist/onlyfrontendjobsskills-plugin.zip → Plugins → Skills
```

[docs/chatgpt.md](docs/chatgpt.md) · [Directory submission](docs/openai-plugin-submission.md)

## Skills

### Resume

| Skill | What it does |
|-------|----------------|
| [frontend-resume-scorer](skills/frontend-resume-scorer) | Score /100, ATS checks, rewrite in chat |
| [frontend-resume-tailor](skills/frontend-resume-tailor) | Match one resume to one job posting |
| [frontend-bullet-writer](skills/frontend-bullet-writer) | Stronger bullets with real impact |

### Job search

| Skill | What it does |
|-------|----------------|
| [frontend-job-analyzer](skills/frontend-job-analyzer) | Should you apply? Stack fit, seniority, red flags |
| [remote-job-strategy](skills/remote-job-strategy) | Live listings or a weekly search plan |

### Presence & interview

| Skill | What it does |
|-------|----------------|
| [frontend-linkedin-optimizer](skills/frontend-linkedin-optimizer) | Headline, About, Featured |
| [portfolio-reviewer](skills/portfolio-reviewer) | Portfolio or repo review |
| [github-profile-optimizer](skills/github-profile-optimizer) | Recruiter-ready GitHub |
| [frontend-interview-prep](skills/frontend-interview-prep) | JS / React / system design prep |
| [salary-calculator](skills/salary-calculator) | Pay estimate for your market |
| [frontend-cover-letter](skills/frontend-cover-letter) | Short letter when the form requires it |

## Supported agents

ChatGPT · Cursor · Claude Code · Codex · Windsurf · Gemini CLI · OpenCode · 30+ via `npx skills`

## Quick win — 60 seconds

1. Copy `examples/sample-resume-react-mid.md`
2. In your agent: `Score my frontend resume` + paste
3. Get 0–100 + rewrite + 3 live React roles — no signup

> If you found it useful, ⭐ this repo — it helps other frontend devs discover it.

## For developers

- Live listings: MCP at `https://www.onlyfrontendjobs.com/api/mcp` + public API at `https://www.onlyfrontendjobs.com/api/public/jobs` (built in the private `fejobs` repo)
- Resume rubric aligned with OnlyFrontendJobs `resume-rubric.ts` (v1.1.0)
- Agent rules: [PLUGIN.md](PLUGIN.md) · [CONTRIBUTING.md](CONTRIBUTING.md)
- Release gate: `bash scripts/release-check.sh` (also runs in CI)

## Contributing

Frontend-only skills. Generic resume advice belongs in [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills).

1. Fork and branch
2. Edit `skills/<name>/SKILL.md`
3. Run `./scripts/sync-agent-copies.sh` and `bash scripts/release-check.sh`
4. Open PR — see [pull request template](.github/pull_request_template.md)

More: [CONTRIBUTING.md](CONTRIBUTING.md) · [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) · [SECURITY.md](SECURITY.md)

## License

MIT — see [LICENSE](LICENSE).
