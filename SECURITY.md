# Security Policy

## Supported versions

| Version | Supported |
|---------|-----------|
| 1.2.x   | Yes       |
| < 1.2   | No (please upgrade) |

## Reporting a vulnerability

- **Do not** open a public issue for security problems.
- Report via GitHub Security → Advisories → "Report a vulnerability" on this repo, or contact the owner via GitHub profile.

Include: description, steps to reproduce, impact, and suggested fix if any.

We aim to acknowledge within 48 hours and release a fix promptly.

## Scope

This repo is a skills-only plugin. It has no backend, no OAuth, and no secrets. The only network calls are to `onlyfrontendjobs.com` (`/api/mcp`, `/api/public/jobs`). Please do not report `onlyfrontendjobs.com` application vulnerabilities here — report those to the main site.
