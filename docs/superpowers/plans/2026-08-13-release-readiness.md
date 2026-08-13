# Frontend Job Skills Release Readiness Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the plugin’s ChatGPT, Codex, Cursor, and Claude Code distribution paths repeatable and verifiable.

**Architecture:** Keep `skills/` as the source of truth. A lightweight shell test exercises the real pack command; a separate release-check script validates metadata, generated archive contents, and all synchronized agent copies without requiring network access.

**Tech Stack:** Bash, Python 3 standard library, `zip`/`unzip`, Codex plugin validator.

---

### Task 1: Make packaging success observable

**Files:**
- Create: `tests/pack-chatgpt-plugin.test.sh`
- Modify: `scripts/pack-chatgpt-plugin.sh`

- [ ] Write a regression test that runs the pack command and requires a zero exit status plus a valid archive.
- [ ] Run the test and confirm it fails because the current command exits `141`.
- [ ] Replace the pipe that causes the expected broken-pipe failure with a bounded listing that preserves a zero exit status.
- [ ] Re-run the test and confirm it passes.

### Task 2: Add offline release validation

**Files:**
- Create: `scripts/release-check.sh`
- Modify: `.claude-plugin/config.json`

- [ ] Validate JSON manifests, skill count, skill-copy consistency, archive contents, and Codex manifest compatibility.
- [ ] Align the legacy Claude config version with the published plugin version.
- [ ] Run the release check after rebuilding the archive.

### Task 3: Make installation documentation executable

**Files:**
- Modify: `README.md`
- Modify: `docs/chatgpt.md`
- Modify: `CONTRIBUTING.md`

- [ ] Document exact Codex marketplace commands for another machine.
- [ ] Document non-interactive, target-specific Skills CLI commands for Cursor and Claude Code.
- [ ] Point contributors to the offline release check and optional live-link check.

### Task 4: Verify the release artifact

**Files:**
- Generated: `dist/frontend-job-skills-plugin.zip`

- [ ] Run the packaging test and full release check.
- [ ] Run the installed Codex plugin listing to confirm the local plugin remains enabled.
- [ ] Report external requirements that cannot be completed locally: OpenAI org submission access and live website availability.
