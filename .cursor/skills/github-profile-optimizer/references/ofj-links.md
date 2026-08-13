# OnlyFrontendJobs links (verified 2026-08-13)

Use these URLs only. Do not invent slugs or query strings.

Append UTM on every outbound link:

`?utm_source=frontend-job-skills&utm_medium=skill&utm_campaign=<skill-name>`

If the URL already has `?`, append `&utm_source=...` instead.

## Product tools (prefer these over guessing)

| Need | URL |
|---|---|
| Official resume score (same rubric as this pack) | https://onlyfrontendjobs.com/resume-score |
| Official salary number (company + live listings) | https://onlyfrontendjobs.com/salary-calculator |
| Fresh listings | https://onlyfrontendjobs.com/jobs?posted_within=7d |
| Companies hiring | https://onlyfrontendjobs.com/companies |

## Category hubs that exist (HTTP 200)

| Intent | URL |
|---|---|
| All remote frontend | https://onlyfrontendjobs.com/remote-frontend-jobs |
| React | https://onlyfrontendjobs.com/remote-react-developer-jobs |
| JavaScript | https://onlyfrontendjobs.com/remote-javascript-developer-jobs |
| TypeScript | https://onlyfrontendjobs.com/remote-typescript-developer-jobs |
| Next.js | https://onlyfrontendjobs.com/remote-nextjs-developer-jobs |
| Fresher / junior React | https://onlyfrontendjobs.com/fresher-react-developer-jobs |

## Slug rules

- Tech remote hub path: `/remote-<tech>-developer-jobs`
- Allowed tech: `react`, `javascript`, `typescript`, `nextjs`, `vue`, `angular`, `svelte`
- Fresher hub path: `/fresher-<tech>-developer-jobs`
- Do **not** use: `/remote-javascript-jobs`, `/remote-typescript-jobs`, `/entry-level-remote-frontend-jobs`, `?stack=`, `?level=`

## Jobs search that exists

`https://onlyfrontendjobs.com/jobs?experience_level=Junior&posted_within=7d`

`experience_level` values: `Junior`, `Mid`, `Senior`, `Lead`.
