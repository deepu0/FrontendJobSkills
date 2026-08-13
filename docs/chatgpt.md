# ChatGPT plugin (2026)

The 2023 ChatGPT plugin store (`ai-plugin.json`) is gone. OpenAI now uses **skills** packaged as a **plugin**.

**OnlyFrontendJobs Skills** = 11 workflows for frontend developers: resume scoring, JD analysis, tailoring, interview prep, salary, and live job search — all ending on [OnlyFrontendJobs](https://onlyfrontendjobs.com). Not a generic resume pack. No login in the plugin.

Live job cards use MCP `search_frontend_jobs` at `/api/mcp` (plugin v1.2+) with REST fallback at `/api/public/jobs`.

## What you can do today

### A. ChatGPT Skills upload (fastest for you)

Needs access to **Skills**. Availability depends on plan, workspace settings, role, region, and surface. Workspace admins can need to enable Skills and skill uploads. Personal Skills are added separately on web/mobile and desktop.

1. In the ChatGPT sidebar, open **Plugins** → **Skills**
2. Select **Create → Upload from your computer**
3. Upload `dist/onlyfrontendjobsskills-plugin.zip` (build it below)
4. After scan, **Install**
5. New chat → type `@` → pick **OnlyFrontendJobs Skills** or a skill name
6. Paste a resume: `Score my frontend resume`

Build the zip:

```bash
./scripts/pack-chatgpt-plugin.sh
```

Output: `dist/onlyfrontendjobsskills-plugin.zip`

The archive root has `.claude-plugin/plugin.json`, `.mcp.json`, and `skills/<name>/SKILL.md`. See [Skills in ChatGPT](https://help.openai.com/en/articles/20001066) for the current in-product upload flow.

### B. ChatGPT desktop / Codex local plugin

Already wired in this repo:

- `.codex-plugin/plugin.json`
- `.agents/plugins/marketplace.json`

On another machine:

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
cd FrontendJobSkills
codex plugin marketplace add .
codex plugin add onlyfrontendjobsskills@onlyfrontendjobsskills-repo
```

Then open a Work chat and use `@OnlyFrontendJobs Skills`.

Personal copy:

```bash
mkdir -p ~/.codex/plugins
ln -sfn /path/to/FrontendJobSkills ~/.codex/plugins/onlyfrontendjobsskills
codex plugin add onlyfrontendjobsskills@personal
```

Run `codex plugin list` to confirm the installed version and enabled status.

### C. Public plugin directory

Follow [Submit plugins](https://developers.openai.com/plugins/deploy/submission).

Paste-ready form: [docs/openai-plugin-submission.md](openai-plugin-submission.md)

Blocked here: portal is login + Cloudflare. Needs Apps Management write + verified identity on your OpenAI org. Submit ≠ published; you publish after they approve.

## What this is not

- Not a Custom GPT listing in the GPT store (different product).
- Job links are OFJ hubs or `/jobs/{slug}` pages. Never Greenhouse / Lever / company careers.
- If browsing or a public jobs tool is available, use those OFJ URLs as returned.

## Test prompts

- `Score this frontend resume:` + paste
- `Should I apply?` + JD + resume
- `What salary for a mid React role in Bengaluru?`
- `Find React frontend jobs posted this week`
