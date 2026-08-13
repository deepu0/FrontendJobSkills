#!/usr/bin/env bash
# Build a skills-only plugin zip for ChatGPT / OpenAI plugin portal upload.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
out="$root/dist/frontend-job-skills-plugin.zip"
mkdir -p "$root/dist"
rm -f "$out"

# Archive root must contain .claude-plugin/plugin.json and skills/<name>/SKILL.md
zip -r "$out" \
  .claude-plugin/plugin.json \
  .codex-plugin/plugin.json \
  skills \
  references \
  LICENSE \
  README.md \
  assets \
  -x 'skills/*/.DS_Store' -x 'assets/.DS_Store'

echo "Wrote $out"
unzip -Z1 "$out" | sed -n '1,40p'
