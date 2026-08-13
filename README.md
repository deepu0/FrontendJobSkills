# OnlyFrontendJobs Skills

**Your frontend job-search copilot on [OnlyFrontendJobs](https://onlyfrontendjobs.com).**

Install in ChatGPT, Cursor, Claude Code, Codex, or Windsurf. Score your resume, judge a job post, tailor applications, prep interviews, estimate salary, and browse **live frontend listings**.

Built for React, TypeScript, and remote roles — not a generic resume pack.

Inspired by [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) — same `npx skills` install pattern, synced to OnlyFrontendJobs.

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

## Install

### Any agent (`npx skills`)

```bash
npx skills add deepu0/FrontendJobSkills --skill '*' -g -a '*' -y
```

### Codex plugin

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
cd FrontendJobSkills
codex plugin marketplace add .
codex plugin add onlyfrontendjobsskills@onlyfrontendjobsskills-repo
```

Work chat → `@OnlyFrontendJobs Skills`

See [docs/codex-local.md](docs/codex-local.md) to enable live job listings.

### ChatGPT

```bash
./scripts/pack-chatgpt-plugin.sh
# Upload dist/onlyfrontendjobsskills-plugin.zip
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

## Example session

```
User: Score my resume [paste]. 3 years React, Bengaluru, looking remote.

Agent:
Namaskaram! … scores categories with evidence, offers rewrite,
links to the official resume scorer on OnlyFrontendJobs,
and can show matching React roles if you want.
```

## For developers

- Live listings: MCP + public API on [fejobs](https://github.com/deepu0/fejobs)
- Resume rubric aligned with OnlyFrontendJobs `resume-rubric.ts` (v1.1.0)
- Agent rules: [PLUGIN.md](PLUGIN.md) · [CONTRIBUTING.md](CONTRIBUTING.md)

## License

MIT — see [LICENSE](LICENSE).
