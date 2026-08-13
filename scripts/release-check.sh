#!/usr/bin/env bash
# Verify the distributable plugin without requiring network access.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
archive="$root/dist/onlyfrontendjobsskills-plugin.zip"
cd "$root"

for manifest in \
  .codex-plugin/plugin.json \
  .claude-plugin/plugin.json \
  .claude-plugin/config.json \
  .agents/plugins/marketplace.json; do
  python3 -m json.tool "$manifest" >/dev/null
done

version="$(python3 -c 'import json; print(json.load(open(".codex-plugin/plugin.json"))["version"])')"
claude_version="$(python3 -c 'import json; print(json.load(open(".claude-plugin/plugin.json"))["version"])')"
config_version="$(python3 -c 'import json; print(json.load(open(".claude-plugin/config.json"))["version"])')"
test "$version" = "$claude_version"
test "$version" = "$config_version"
test "$(python3 -c 'import json; print(json.load(open(".codex-plugin/plugin.json"))["name"])')" = onlyfrontendjobsskills
test "$(python3 -c 'import json; print(json.load(open(".claude-plugin/plugin.json"))["name"])')" = onlyfrontendjobsskills
test "$(python3 -c 'import json; print(len(json.load(open(".claude-plugin/config.json"))["skills"]))')" = 11

test "$(find skills -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')" = 11

for agent in .agent .agents .claude .codex .cursor .gemini .opencode .windsurf; do
  diff -qr skills "$agent/skills" >/dev/null
done

bash "$root/scripts/pack-chatgpt-plugin.sh" >/dev/null
unzip -t "$archive" >/dev/null
entries="$(unzip -Z1 "$archive")"
test "$(grep -Ec '^skills/[^/]+/SKILL\.md$' <<<"$entries")" = 11
grep -qx '.claude-plugin/plugin.json' <<<"$entries"
grep -qx '.mcp.json' <<<"$entries"
python3 -c 'import json; m=json.load(open(".codex-plugin/plugin.json")); assert "mcpServers" in m, "codex plugin must declare mcpServers"'
if grep -Eq '^(\.agents/|\.claude/|\.codex/|\.cursor/|dist/|tests/)' <<<"$entries"; then
  echo "Release archive contains development-only files." >&2
  exit 1
fi

echo "Release check passed: OnlyFrontendJobs Skills $version"
