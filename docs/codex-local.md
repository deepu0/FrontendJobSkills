# Codex local install

## Install

```bash
git clone https://github.com/deepu0/FrontendJobSkills.git
cd FrontendJobSkills
codex plugin marketplace add .
codex plugin add onlyfrontendjobsskills@onlyfrontendjobsskills-repo
```

Personal symlink:

```bash
ln -sfn /path/to/FrontendJobSkills ~/.codex/plugins/onlyfrontendjobsskills
codex plugin add onlyfrontendjobsskills@personal
```

## Enable live jobs MCP

The plugin bundles `.mcp.json` → `https://www.onlyfrontendjobs.com/api/mcp`.

After install:

1. Open **Codex → Settings → Plugins** (or your Codex MCP settings surface).
2. Find **OnlyFrontendJobs Skills**.
3. Turn on the bundled **`onlyfrontendjobs`** MCP server.
4. Start a **new** Work chat with the plugin tagged.

If MCP is off, the agent should still call `GET https://www.onlyfrontendjobs.com/api/public/jobs` — but MCP is faster and returns structured cards.

Verify MCP in a terminal:

```bash
curl -sS -X POST "https://www.onlyfrontendjobs.com/api/mcp" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}' | head -c 500
```

## Update after repo changes

```bash
cd FrontendJobSkills
git pull
codex plugin update onlyfrontendjobsskills@personal   # or @onlyfrontendjobsskills-repo
```

## Expected UX

| You say | Should happen |
|---|---|
| `give me frontend jobs` | Up to 5 live OFJ cards — no weekly plan lecture |
| `@OnlyFrontendJobs Skills` greeting | Starts with **Namaskaram**, then intro + name/experience ask |
| Tool narration | Minimal — no "I'll read the skill" / curl debugging in chat |

Product rules live in [PLUGIN.md](../PLUGIN.md).
