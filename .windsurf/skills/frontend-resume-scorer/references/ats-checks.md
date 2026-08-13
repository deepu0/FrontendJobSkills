# OFJ ATS checks (deterministic)

Copied from OnlyFrontendJobs `src/lib/ai/ats-checker.ts`.
Run these on the extracted resume **text**. Same inputs → same outcomes.

Status weight: pass = 1, warn = 0.5, fail = 0.
`score = sum(weights) / 6`
Level: `>= 0.85 → 3`, `>= 0.6 → 2`, `>= 0.35 → 1`, else `0`.
Points come from rubric `ats_readiness` (0/4/7/10).

## Checks

### 1. parseable_text — Resume text is machine-readable

- pass: non-whitespace chars ≥ 800
- warn: ≥ 300
- fail: < 300 (likely image/scan or unreadable columns)

### 2. contact_info — Clear contact information

- pass: email AND phone (8+ digits)
- warn: only one of those
- fail: neither

### 3. standard_sections — Standard section headings

Look for the words `experience`, `education`, `skills` (case-insensitive).

- pass: all 3
- warn: 2
- fail: 0–1

### 4. frontend_keywords — Core frontend keyword coverage

Count distinct hits among: react, vue, angular, svelte, typescript, javascript, css, html.

- pass: ≥ 4
- warn: 2–3
- fail: 0–1

### 5. length_sanity — Resume length

Word count.

- pass: 250–1200
- warn: < 250 (thin) or > 1200 (too long)

### 6. date_presence — Employment dates

Years matching `19xx` or `20xx`.

- pass: ≥ 2 year tokens
- warn: fewer

## Output

List each check as pass/warn/fail with the tip. Then report ATS level and points.
