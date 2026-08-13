#!/usr/bin/env bash
# Copy root references into each skill, then copy skills/ into agent folders.
# Same layout as Paramchoudhary/ResumeSkills.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

for skill in skills/*/; do
  mkdir -p "${skill}references"
  cp -f references/ofj-links.md "${skill}references/"
done

cp -f references/resume-rubric-v1.1.0.md skills/frontend-resume-scorer/references/
cp -f references/ats-checks.md skills/frontend-resume-scorer/references/
cp -f references/salary-tiers.md skills/salary-calculator/references/

agent_dirs=(
  .cursor/skills
  .claude/skills
  .codex/skills
  .gemini/skills
  .agents/skills
  .agent/skills
  .opencode/skills
  .windsurf/skills
)

for dest in "${agent_dirs[@]}"; do
  mkdir -p "$dest"
  rsync -a --delete skills/ "$dest/"
done

echo "Synced references into skills/ and copied skills/ to agent folders."
