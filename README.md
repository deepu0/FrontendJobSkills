# Frontend Job Skills

AI agent skills for **frontend** job search. Install them in Cursor, Claude Code, Gemini CLI, Windsurf, Codex, and other agents that read `SKILL.md`.

They use the same resume rubric and salary ladder as [OnlyFrontendJobs](https://onlyfrontendjobs.com). After a local pass, they send you to the live tools on the site.

This is not a generic resume pack. Scoring is frontend-specific. Job links are real OFJ hubs, not invented slugs.

Layout follows [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) so `npx skills add` works the same way. The skill list does not. We skip academic CVs, executive resumes, and other non-frontend files.

## What are skills?

Markdown files that teach an agent a workflow. After install, you talk normally. The agent should pick the matching file.

## Skills

| Skill | What it does |
|-------|----------------|
| [frontend-resume-scorer](/skills/frontend-resume-scorer) | Score /100 with OFJ rubric v1.1.0, then open `/resume-score` |
| [frontend-job-analyzer](/skills/frontend-job-analyzer) | Stack match, real seniority, red flags, similar OFJ hubs |
| [frontend-resume-tailor](/skills/frontend-resume-tailor) | Reorder a real resume for one JD. No invented stack. |
| [frontend-bullet-writer](/skills/frontend-bullet-writer) | Weak bullets → action + tech + a real number |
| [frontend-cover-letter](/skills/frontend-cover-letter) | Short letter only when the form asks |
| [frontend-linkedin-optimizer](/skills/frontend-linkedin-optimizer) | Headline, About, Featured, Open to Work |
| [portfolio-reviewer](/skills/portfolio-reviewer) | Review a live site or repo. Fetch first. No invented LCP. |
| [github-profile-optimizer](/skills/github-profile-optimizer) | README, pins, top-repo quality |
| [frontend-interview-prep](/skills/frontend-interview-prep) | JS / React / system design / take-home against the actual JD |
| [salary-calculator](/skills/salary-calculator) | Estimate with the OFJ 2025–26 tier ladder, then open `/salary-calculator` |
| [remote-job-strategy](/skills/remote-job-strategy) | 5–10 tailored apps a week. OFJ as the primary board. |

## Install

```bash
# All skills, global
npx skills add deepu0/FrontendJobSkills -g -y

# This project only
npx skills add deepu0/FrontendJobSkills -y

npx skills list
npx skills list --global
```

Manual (same as ResumeSkills):

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
mkdir -p ~/.cursor/skills
cp -r FrontendJobSkills/skills/* ~/.cursor/skills/
```

Copies also live under `.cursor/skills`, `.claude/skills`, `.codex/skills`, `.gemini/skills`, `.agents/skills`, `.opencode/skills`, and `.windsurf/skills`. After you edit `skills/`, run `./scripts/sync-agent-copies.sh`.

## ChatGPT plugin

This is a **skills-only** plugin (2026 OpenAI format). Not the old 2023 plugin store.

```bash
./scripts/pack-chatgpt-plugin.sh
```

Then in ChatGPT: [Skills](https://chatgpt.com/skills) → Create → Upload → `dist/frontend-job-skills-plugin.zip`.

Full steps: [docs/chatgpt.md](docs/chatgpt.md).

```bash
npx skills remove frontend-resume-scorer
```

## Use

```
"Score my resume" → frontend-resume-scorer
"Should I apply?" + paste JD → frontend-job-analyzer
"Tailor my resume to this JD" → frontend-resume-tailor
"Rewrite my bullets" → frontend-bullet-writer
"Write a cover letter" → frontend-cover-letter
"Fix my LinkedIn" → frontend-linkedin-optimizer
"Review my portfolio" + URL → portfolio-reviewer
"Prep me for a React interview at [company]" → frontend-interview-prep
"What salary should I ask?" → salary-calculator
"Fix my GitHub" → github-profile-optimizer
"Plan my remote search" → remote-job-strategy
```

## Examples

### 1. Score, then apply

```
User: Here's my resume [paste]. I'm a React + TypeScript dev in Bengaluru.

The agent should:
1. Score with OFJ rubric v1.1.0 (evidence quotes, ATS checks)
2. List the three cheapest point gains
3. Send you to https://onlyfrontendjobs.com/resume-score
4. Open https://onlyfrontendjobs.com/remote-react-developer-jobs
```

### 2. One job, end to end

```
User: Here's a JD [paste] and my resume [paste]. Should I apply?

The agent should:
1. Extract the real stack and seniority
2. Say apply / tailor / skip
3. Tailor summary + skills order + lead bullets (no new tech)
4. Link a matching OFJ hub that exists
```

### 3. Interview this week

```
User: React interview at [company] on Thursday. JD: [paste]

The agent should:
1. Build a 3-day list from that JD
2. Give live-coding tasks in their stack
3. Pull STAR stories from the resume (perf, a11y, migration)
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
