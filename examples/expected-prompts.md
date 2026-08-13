# Expected prompts (copy-paste to test skills)

Use these after install. Paste files from this folder where noted.

## Resume

**Skill:** `frontend-resume-scorer`

```
Score my frontend resume with the OFJ rubric, then offer a full rewrite.

[paste examples/sample-resume-react-mid.md]
```

**Expected:** Category scores with evidence quotes, ATS checks, no invented metrics, link to `/resume-score`.

---

## Job description

**Skill:** `frontend-job-analyzer`

```
Should I apply to this job? Here's my resume and the JD.

Resume:
[paste examples/sample-resume-react-mid.md]

JD:
[paste examples/sample-jd-react-senior.md]
```

**Expected:** Real seniority vs title, stack match with gaps, red flags, apply/tailor/skip decision, OFJ hub or live job cards — not employer careers URL.

---

## Tailor

**Skill:** `frontend-resume-tailor`

```
Tailor my resume to this JD. Do not add tech I don't have.

[paste both sample files]
```

**Expected:** Reordered summary/skills/bullets using only existing experience. No Next.js added unless resume already claims it.

---

## Bullets

**Skill:** `frontend-bullet-writer`

```
Rewrite these bullets with real metrics — ask me if you need numbers:

- Worked on React app
- Responsible for UI components
```

---

## Live jobs

**Skill:** `remote-job-strategy` or `frontend-job-analyzer`

```
Find React jobs posted in the last 7 days for a mid-level developer.
```

**Expected:** Up to 5 OFJ job card URLs when API is up; else `remote-react-developer-jobs` hub.

---

## Salary

**Skill:** `salary-calculator`

```
What salary should a mid-level React engineer in Bengaluru ask for on a remote role?
```

**Expected:** OFJ 2025–26 tier reasoning, then `/salary-calculator` link.

---

## Remote search plan

**Skill:** `remote-job-strategy`

```
I'm a React + TypeScript dev in IST. Plan my remote job search for this week.
```

**Expected:** Lane, 5–10 app target, OFJ URLs, funnel metrics — no Easy Apply spam.
