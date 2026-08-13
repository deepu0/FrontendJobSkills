# Changelog

## [1.1.0] — 2026-08-13

### Added

- 11 frontend job-search skills aligned with OnlyFrontendJobs rubric v1.1.0 and 2025–26 salary ladder
- ChatGPT / Codex skills-only plugin (`dist/frontend-job-skills-plugin.zip`)
- `scripts/release-check.sh`, pack tests, and `sync-agent-copies.sh`
- Skills: call live jobs via `GET /api/public/jobs` when available; MCP documented for v1.2
- OpenAI directory submission pack (`docs/openai-plugin-submission.md`)

### Rules

- Every job link lands on `onlyfrontendjobs.com` — never employer ATS/career URLs
- No invented job listings or metrics
- Plugin requires no OFJ account

[1.1.0]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.1.0

## [1.1.1] — 2026-08-13

### Added

- `examples/` — sample resume, JD, and copy-paste test prompts for directory review
- README: ResumeSkills credit, skill categories, supported agents, uninstall section

[1.1.1]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.1.1

## [1.1.2] — 2026-08-13

### Changed

- Deepened `frontend-resume-scorer`, `frontend-job-analyzer`, and `frontend-resume-tailor` with triggers, core capabilities, before/after examples, and edge cases
- Expanded CONTRIBUTING skill template
- Updated Claude plugin trigger phrases for the three core skills

[1.1.2]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.1.2

## [1.2.0] — 2026-08-13

### Added

- `.mcp.json` + `mcpServers` in `.codex-plugin/plugin.json` → `https://onlyfrontendjobs.com/api/mcp`
- Plugin zip now includes MCP manifest for ChatGPT **With MCP** submission

### Changed

- README and `ofj-links.md` — MCP is live in production (fejobs deployed)

[1.2.0]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.2.0

## [1.2.2] — 2026-08-13

### Changed

- `PLUGIN.md` — greeting, skill routing, instant jobs UX (no tool narration)
- `remote-job-strategy` — split **instant listings** vs **weekly plan** modes
- API calls documented with `www.onlyfrontendjobs.com` (avoid 308 redirects)
- `docs/codex-local.md` — enable bundled MCP after install

[1.2.2]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.2.2

## [1.2.3] — 2026-08-13

### Changed

- Copy pass: removed internal jargon from user-facing README, plugin listing, starter prompts, and skill descriptions
- Namaskaram greeting + onboarding flow in `PLUGIN.md`
- Shorter default prompts on the directory card

[1.2.3]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.2.3

## [1.2.1] — 2026-08-13

### Changed

- Renamed plugin to **OnlyFrontendJobs Skills** (slug: `onlyfrontendjobsskills`)
- New plugin icons (`logo.png`, `logo-256.png`, `logo-48.png`, `logo-composer.png`)
- Zip output: `dist/onlyfrontendjobsskills-plugin.zip`

### Note

- `utm_source=frontend-job-skills` unchanged in skill links (analytics continuity)

[1.2.1]: https://github.com/deepu0/FrontendJobSkills/releases/tag/v1.2.1
