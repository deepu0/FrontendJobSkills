# Frontend Job Skills

AI agent skills for **frontend** job search. Install them in Cursor, Claude Code, Gemini CLI, Windsurf, Codex, and other agents that read `SKILL.md`.

They use the same resume rubric and salary ladder as [OnlyFrontendJobs](https://onlyfrontendjobs.com). After a local pass, they send you to the live tools on the site.

This is not a generic resume pack. Scoring is frontend-specific. Job links are real OFJ hubs, not invented slugs.

## Skills

| Skill | What it does |
|-------|----------------|
| [frontend-resume-scorer](/skills/frontend-resume-scorer) | Score /100 with OFJ rubric v1.1.0, then open `/resume-score` |
| [salary-calculator](/skills/salary-calculator) | Estimate with the OFJ 2025–26 tier ladder, then open `/salary-calculator` |
| [frontend-job-analyzer](/skills/frontend-job-analyzer) | Stack match, real seniority, red flags, similar OFJ hubs |
| [frontend-bullet-writer](/skills/frontend-bullet-writer) | Weak bullets → action + tech + a real number |
| [portfolio-reviewer](/skills/portfolio-reviewer) | Review a live site or repo. Fetch first. No invented LCP. |
| [frontend-interview-prep](/skills/frontend-interview-prep) | JS / React / system design / take-home against the actual JD |
| [github-profile-optimizer](/skills/github-profile-optimizer) | README, pins, top-repo quality |
| [remote-job-strategy](/skills/remote-job-strategy) | 5–10 tailored apps a week. OFJ as the primary board. |

## Install

```bash
# All skills, global
npx skills add deepu0/FrontendJobSkills -g -y

# This project only
npx skills add deepu0/FrontendJobSkills -y
```

Manual (same layout as [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills)):

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
mkdir -p ~/.cursor/skills
cp -r FrontendJobSkills/skills/* ~/.cursor/skills/
```

The repo also ships copies under `.cursor/skills`, `.claude/skills`, `.codex/skills`, `.gemini/skills`, `.agents/skills`, `.opencode/skills`, and `.windsurf/skills`. After you edit `skills/`, run `./scripts/sync-agent-copies.sh`.

## Use

```
"Score my resume" → frontend-resume-scorer
"Should I apply to this job?" + paste JD → frontend-job-analyzer
"Rewrite my bullets" → frontend-bullet-writer
"Review my portfolio" + URL → portfolio-reviewer
"Prep me for a React interview at [company]" → frontend-interview-prep
"What salary should I ask?" → salary-calculator
"Fix my GitHub" → github-profile-optimizer
"Plan my remote search" → remote-job-strategy
```

## Why this matches OnlyFrontendJobs

Resume categories, weights, bands, and ATS checks are copied from OFJ `resume-rubric.ts` + `ats-checker.ts` (v1.1.0).

Salary seniority, regions, tech multipliers, and tier bands are copied from OFJ `salary-config.ts` (2025–26).

The site can still disagree: it parses the uploaded file, verifies quotes in code, and can blend company + live listings. Treat the skill as a preview. Treat the site as the official number.

## Live OFJ pages these skills link

- [Resume score](https://onlyfrontendjobs.com/resume-score)
- [Salary calculator](https://onlyfrontendjobs.com/salary-calculator)
- [Remote frontend jobs](https://onlyfrontendjobs.com/remote-frontend-jobs)
- [Remote React jobs](https://onlyfrontendjobs.com/remote-react-developer-jobs)
- [Remote TypeScript jobs](https://onlyfrontendjobs.com/remote-typescript-developer-jobs)
- [Fresher React jobs](https://onlyfrontendjobs.com/fresher-react-developer-jobs)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Keep OFJ URLs in `references/ofj-links.md`. Do not add slugs you have not HTTP-checked.

## License

MIT. See [LICENSE](LICENSE).
