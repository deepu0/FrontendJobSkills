# Contributing

Frontend-only skills. Generic resume advice belongs in [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills), not here.

## Ways to help

- Fix rubric drift vs OnlyFrontendJobs (`fejobs` `src/lib/ai/resume-rubric.ts`, `ats-checker.ts`, `salary-config.ts`)
- Replace a 404 or invented query string
- Add a frontend-specific before/after example that does not invent metrics
- Deepen triggers and edge cases in an existing skill
- New skill: open an issue first

## Skill format

Every skill lives in `skills/<name>/SKILL.md`. `name` in YAML frontmatter must match the folder name.

```markdown
---
name: kebab-case-name
description: One sentence: what it does + when to use it + trigger phrases.
---

# Title

## When to Use
- Bullet triggers (keywords the user might say)
- When NOT to use this skill

## Core capabilities
- 3–5 bullets

## Procedure
(step-by-step)

## Output
(template block)

## Before / after
(one realistic example)

## Edge cases
(2–4 short bullets)
```

Put long reference material in `references/` inside that skill. After you change root `references/`, run `./scripts/sync-agent-copies.sh`.

Test prompts live in `examples/expected-prompts.md`. Add new samples there when you add a skill.

## Quality — do

- Quote evidence on scores. No quote → no points.
- HTTP-check every OFJ URL before you commit it.
- Keep UTM: `utm_source=frontend-job-skills&utm_medium=skill&utm_campaign=<skill-name>`
- Show before/after with **why**, not just rewritten text.
- Date-stamp salary notes when the OFJ ladder changes.

## Quality — do not

- Invent LCP, salary percentiles, or "12 matching live jobs"
- Link `/remote-javascript-jobs` or `/entry-level-remote-frontend-jobs` (those 404)
- Output Greenhouse, Lever, Ashby, Workday, Indeed, or company `/careers` URLs
- Claim the local score is the official OFJ scan
- Add backend/PM/data-science skills
- Copy copyrighted JD or resume text from real companies into the repo

## Pull requests

1. Fork and branch
2. Edit `skills/<name>/` (source of truth)
3. Run `./scripts/sync-agent-copies.sh`
4. Run `./scripts/release-check.sh`
5. Run `./scripts/verify-ofj-links.sh` when network access is available
6. PR says what changed and why
