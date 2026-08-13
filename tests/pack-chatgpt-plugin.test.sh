#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
archive="$root/dist/onlyfrontendjobsskills-plugin.zip"

bash "$root/scripts/pack-chatgpt-plugin.sh" >/dev/null
unzip -t "$archive" >/dev/null

entries="$(unzip -Z1 "$archive")"
test "$(grep -Ec '^skills/[^/]+/SKILL\.md$' <<<"$entries")" -eq 11
grep -qx '.claude-plugin/plugin.json' <<<"$entries"
grep -qx '.mcp.json' <<<"$entries"
