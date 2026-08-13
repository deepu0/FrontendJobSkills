# ChatGPT plugin (2026)

The 2023 ChatGPT plugin store (`ai-plugin.json`) is gone. OpenAI now uses **skills** (SKILL.md) packaged as a **plugin**.

This repo is already a skills-only plugin. No MCP server. No live job API.

## What you can do today

### A. ChatGPT Skills upload (fastest for you)

Needs a ChatGPT plan that has **Skills** (Business / Enterprise / Edu / Healthcare on web; also Codex / desktop). Personal Plus may not show the Skills tab.

1. Open https://chatgpt.com/skills
2. **Create → Upload from your computer**
3. Upload `dist/frontend-job-skills-plugin.zip` (build it below)
4. After scan, **Install**
5. New chat → type `@` → pick **Frontend Job Skills** or a skill name
6. Paste a resume: `Score my frontend resume`

Build the zip:

```bash
./scripts/pack-chatgpt-plugin.sh
```

Output: `dist/frontend-job-skills-plugin.zip`

The archive root has `.claude-plugin/plugin.json` and `skills/<name>/SKILL.md`, which is what [OpenAI's skills-only upload](https://developers.openai.com/plugins/guides/submit-claude-plugin) expects.

### B. ChatGPT desktop / Codex local plugin

Already wired in this repo:

- `.codex-plugin/plugin.json`
- `.agents/plugins/marketplace.json`

1. Open this folder as the project, or add the repo as a marketplace source
2. Restart ChatGPT desktop
3. Plugins directory → local / repo source → **Frontend Job Skills** → install
4. Work chat → `@Frontend Job Skills`

Personal copy (this machine, **installed and enabled** via Codex):

```bash
mkdir -p ~/.codex/plugins
ln -sfn /Users/deepaksharma/Documents/FrontendJobSkills ~/.codex/plugins/frontend-job-skills
codex plugin add frontend-job-skills@personal
```

Verified: `frontend-job-skills@personal  installed, enabled  1.1.0`

### C. Public plugin directory

Follow [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

Paste-ready form: [docs/openai-plugin-submission.md](openai-plugin-submission.md)

Blocked here: portal is login + Cloudflare. Needs Apps Management write + verified identity on your OpenAI org. Submit ≠ published; you publish after they approve.

## What this is not

- Not an MCP app. No tools, no OFJ API calls from ChatGPT.
- Not a Custom GPT listing in the GPT store (different product).
- ChatGPT will not fetch OFJ listings unless the user (or browsing) opens the URL.

## Test prompts

- `Score this frontend resume:` + paste
- `Should I apply?` + JD + resume
- `What salary for a mid React role in Bengaluru?`
