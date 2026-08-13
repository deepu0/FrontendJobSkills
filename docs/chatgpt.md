# ChatGPT & Codex plugin

**OnlyFrontendJobs Copilot** helps frontend developers job hunt: find roles suited to your profile, score resumes, judge job posts, tailor applications, and estimate salary — powered by [OnlyFrontendJobs](https://onlyfrontendjobs.com).

## ChatGPT upload

1. Plugins → Skills → **Upload from your computer**
2. Upload `dist/onlyfrontendjobsskills-plugin.zip` (`./scripts/pack-chatgpt-plugin.sh`)
3. Install → new chat → `@OnlyFrontendJobs Copilot`

## Codex local

```bash
codex plugin marketplace add .
codex plugin add onlyfrontendjobsskills@onlyfrontendjobsskills-repo
```

Enable the bundled jobs server: [docs/codex-local.md](codex-local.md)

## Public directory

Paste-ready fields: [openai-plugin-submission.md](openai-plugin-submission.md)

## Try these

- `Find React jobs posted this week`
- `Score this frontend resume:` + paste
- `Should I apply?` + JD + resume
- `What salary for a mid React role in Bengaluru?`
