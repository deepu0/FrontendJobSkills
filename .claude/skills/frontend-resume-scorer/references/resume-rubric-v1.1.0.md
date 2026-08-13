# OFJ Frontend Resume Scorer rubric v1.1.0

Copied from OnlyFrontendJobs `src/lib/ai/resume-rubric.ts`.
Do not invent categories, weights, or point maps.

The model (or you) only picks **levels** and quotes **evidence from the resume text**.
Arithmetic is: look up `points` for that level. Sum = /100.

Qualification floor: **40**. Below that band is `Not yet qualified`.

## Bands

| Band | Min total |
|---|---|
| Exceptional | 85 |
| Strong | 70 |
| Solid | 55 |
| Developing | 40 |
| Not yet qualified | 0 |

## Categories (weights sum to 100)

### 1. Production Frontend Impact — 25

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No production frontend experience evident. |
| 1 | 8 | Contributed to production frontend features used by real users. |
| 2 | 16 | Owned significant production frontend work with some quantified impact (performance, conversion, or engagement). |
| 3 | 25 | Led production frontend at scale with clear measurable impact (Core Web Vitals/LCP, bundle size, conversion or engagement lift). |

### 2. Project Depth & Craft — 20

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No substantive projects described. |
| 1 | 7 | Basic projects, limited depth. |
| 2 | 14 | Several projects showing real craft, including performance and/or accessibility. |
| 3 | 20 | Deep, polished projects demonstrating craft across performance, accessibility, and UX. |

### 3. Modern Stack Fluency — 20

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No modern frameworks evident. |
| 1 | 7 | One modern framework. |
| 2 | 14 | Multiple modern frameworks/tools. |
| 3 | 20 | Broad, current modern stack fluency. |

### 4. AI & Applied AI Contribution — 15 (two sub-criteria)

Top-level level is unused. Sum the two sub-scores (max 15).

**AI product engineering (max 10)**

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No evidence of building with AI. |
| 1 | 3 | Experimented with AI features or tooling (beyond tutorials). |
| 2 | 6 | Shipped an AI-powered feature to real users in production. |
| 3 | 10 | Led or shipped production AI features at scale serving real traffic. |

**AI-augmented workflow (max 5)**

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No evidence of AI-assisted workflow. |
| 1 | 2 | Some use of AI dev tooling. |
| 2 | 5 | Clear acceleration of delivery via AI tooling. |

Never invent AI work. No quote → level 0.

### 5. Open Source & Community — 5

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No open-source/community activity. |
| 1 | 3 | Some public contributions. |
| 2 | 5 | Notable open-source/community presence. |

### 6. Communication & Impact Signals — 5

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | No measurable impact or communication signals. |
| 1 | 3 | Some quantified outcomes, or clear writing/talks. |
| 2 | 5 | Strong quantified outcomes alongside clear communication. |

### 7. ATS Readiness — 10

Computed from the six checks in `ats-checks.md`. Do not let the model pick this level.

| Level | Points | Anchor |
|---|---|---|
| 0 | 0 | Hard for automated screeners to parse. |
| 1 | 4 | Parseable but missing several ATS essentials. |
| 2 | 7 | ATS-friendly with minor gaps. |
| 3 | 10 | Fully ATS-ready. |

## Scoring rules (same as OFJ Score_Calculator)

1. Quote evidence from the resume. If you cannot quote it, drop the level to 0 for that category.
2. Do not award points for implied or typical work.
3. Juniors: do not punish missing staff-level impact. Still use the same anchors.
4. After the local score, send the user to the official OFJ scan. This pack is the same rubric, not the same cache or ATS file parser.
