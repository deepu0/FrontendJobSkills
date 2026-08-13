# Contributing

Frontend-only skills. Generic resume advice belongs in [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills), not here.

## Ways to help

- Fix a rubric drift vs OnlyFrontendJobs (`fejobs` `src/lib/ai/resume-rubric.ts`, `ats-checker.ts`, `salary-config.ts`)
- Replace a 404 or invented query string
- Add a frontend-specific example that does not invent metrics
- New skill: open an issue first

## Skill format

```markdown
---
name: kebab-case-name
description: What it does and when to use it. One or two sentences.
---

# Title

## When to Use
## Procedure
## Output
```

`name` must match the folder name.

Put extra material in `references/` inside that skill. After you change root `references/`, run `./scripts/sync-agent-copies.sh` so skill copies and agent folders stay in sync.

## Do

- Quote evidence. No quote → no points.
- HTTP-check every OFJ URL before you commit it.
- Keep UTM: `utm_source=frontend-job-skills&utm_medium=skill&utm_campaign=<skill-name>`
- Date-stamp salary notes when the OFJ ladder changes.

## Do not

- Invent LCP, salary percentiles, or "12 matching live jobs"
- Link `/remote-javascript-jobs` or `/entry-level-remote-frontend-jobs` (those 404)
- Claim the local score is the official OFJ scan
- Add backend/PM/data-science skills

## Pull requests

1. Fork and branch
2. Edit `skills/<name>/` (source of truth)
3. Run `./scripts/sync-agent-copies.sh`
4. Run `./scripts/verify-ofj-links.sh`
5. PR says what changed and why
