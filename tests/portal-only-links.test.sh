#!/usr/bin/env bash
# Job links must stay on onlyfrontendjobs.com. Career / ATS hosts are a product leak.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

hits="$(rg -n -i 'https?://[^ )"'"'"']*(greenhouse|lever\.co|ashbyhq|myworkday|indeed\.com|linkedin\.com/jobs)'   skills references docs README.md CONTRIBUTING.md .codex-plugin .claude-plugin   --glob '!**/node_modules/**' || true)"

if [ -n "$hits" ]; then
  echo "Career / ATS hosts leaked into plugin docs or skills:" >&2
  echo "$hits" >&2
  exit 1
fi

if ! rg -q "Never output Greenhouse" references/ofj-links.md; then
  echo "ofj-links.md is missing the portal-only rule." >&2
  exit 1
fi

echo "Portal-only link check passed."
