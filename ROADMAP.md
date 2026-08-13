# Roadmap

## Shipped — v1.1.2

- Deepened 3 core skills: `frontend-resume-scorer`, `frontend-job-analyzer`, `frontend-resume-tailor` (triggers, before/after, edge cases)
- Expanded CONTRIBUTING skill template

## Shipped — v1.1.0

- 11 frontend job-search skills (resume, JD, tailor, LinkedIn, portfolio, GitHub, interview, salary, remote strategy)
- ChatGPT / Codex skills-only plugin pack
- Portal-only OFJ links + UTM tracking
- Offline `release-check.sh` + pack tests
- Skills call public jobs API when available (REST fallback)

## Next — v1.2.0 (after fejobs MCP is live in prod)

- [ ] Merge & deploy [fejobs PR #261](https://github.com/deepu0/fejobs/pull/261) (`/api/mcp`, `/api/public/jobs`)
- [ ] Inspector green on `https://onlyfrontendjobs.com/api/mcp`
- [ ] Bump plugin manifest → add MCP URL (`dependencies.tools`)
- [ ] Submit ChatGPT plugin update (With MCP)

## Later (only if used)

- [ ] PostHog: `utm_source=frontend-job-skills` / `utm_medium=mcp` signal
- [x] `examples/` — sample resume, JD, and test prompts
- [x] README — ResumeSkills credit, categories, uninstall, supported agents
- [x] GitHub topics for discoverability
- [ ] GitHub Actions running `release-check.sh` on PRs

## Out of scope

- Login / OAuth in the plugin
- Resume-score MCP
- Auto-apply or employer career URLs
- Non-frontend roles
