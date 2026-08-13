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

# Every skills/<name>/SKILL.md must declare matching frontmatter name.
python3 - <<'PY'
import pathlib
import re
import sys

root = pathlib.Path("skills")
name_re = re.compile(r'^name:\s*(.+?)\s*$', re.MULTILINE)
failures = []
for skill_dir in sorted(root.iterdir()):
    if not skill_dir.is_dir():
        continue
    md = skill_dir / "SKILL.md"
    if not md.exists():
        failures.append(f"{md}: SKILL.md missing")
        continue
    text = md.read_text(errors="ignore")
    if not text.startswith("---"):
        failures.append(f"{md}: YAML frontmatter missing")
        continue
    parts = text.split("---", 2)
    if len(parts) < 3:
        failures.append(f"{md}: malformed frontmatter")
        continue
    match = name_re.search(parts[1])
    if not match:
        failures.append(f"{md}: 'name:' not found in frontmatter")
        continue
    name = match.group(1).strip().strip('"').strip("'")
    if name != skill_dir.name:
        failures.append(f"{md}: name '{name}' != directory '{skill_dir.name}'")
if failures:
    print("SKILL.md frontmatter check failed:")
    for failure in failures:
        print(f"  {failure}")
    sys.exit(1)
PY

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
