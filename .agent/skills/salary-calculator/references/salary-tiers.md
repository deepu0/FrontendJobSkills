# OFJ salary ladder (static tiers)

Copied from OnlyFrontendJobs `src/lib/salary-config.ts` + `salary-agent/config.ts` + `bands.ts`.
Source notes in OFJ: 6figr / Levels.fyi / Glassdoor / AmbitionBox, 2025–26.

This is the **fallback ladder** OFJ uses when it has no company band and not enough live listings to blend.
The official number is always https://onlyfrontendjobs.com/salary-calculator — that tool can blend company data and live jobs.

India figures below are **LPA** (lakhs per annum). OFJ stores them in rupees; divide by 100000.
US is USD. Europe is EUR.

## Seniority (same as OFJ)

Prefer stated role level:

- junior → junior
- mid → mid
- senior → senior
- lead / staff / principal / architect → staff

Else years of production frontend experience:

- 0–2 → junior
- 3–4 → mid
- 5–9 → senior
- 10+ → staff

Else text: fresher/junior/entry → junior; mid → mid; senior/sr → senior; lead/staff/principal → staff.

If still unknown, OFJ defaults to **senior**. Say that you defaulted.

## Region

- India (Bengaluru, Hyderabad, Pune, Gurgaon, Mumbai, Chennai, Delhi, Noida, remote-india, or "India") → india / INR / LPA
- US / New York / San Francisco / Seattle / remote-global / Canada-as-US-remote in OFJ list → us / USD
- London, Berlin, Amsterdam, Dubai → europe / EUR
- Else say defaulted to **india** if the user is clearly India-based; otherwise ask.

## Tech multipliers

| Tech | Multiplier |
|---|---|
| nextjs | 1.08 |
| typescript | 1.06 |
| react, nodejs | 1.05 |
| react-native | 1.04 |
| svelte | 1.02 |
| javascript, angular | 1.00 |
| vue, nuxtjs | 0.98 |
| tailwind | 0.95 |
| css | 0.90 |
| unknown | 1.00 |

Apply to min and max after picking the bracket. Round to a whole lakh (INR) or $1k / €1k.

## Tiers

### Big Tech / FAANG (tier1)

| | Junior | Mid | Senior | Staff |
|---|---|---|---|---|
| India (LPA) | 18–30 | 30–55 | 60–100 | 100–180 |
| US (USD k) | 130–180 | 180–250 | 250–350 | 350–500 |
| EU (EUR k) | 70–100 | 100–140 | 140–200 | 200–280 |

Examples: Google, Meta, Amazon, Microsoft, Apple, Netflix, Adobe, Atlassian, Uber, Flipkart, Stripe, Databricks, LinkedIn.

### Unicorns / high growth (tier2)

| | Junior | Mid | Senior | Staff |
|---|---|---|---|---|
| India (LPA) | 12–22 | 22–40 | 35–70 | 70–120 |
| US (USD k) | 110–150 | 150–200 | 200–270 | 270–350 |
| EU (EUR k) | 60–85 | 85–120 | 120–160 | 160–220 |

Examples: Razorpay, PhonePe, Swiggy, Zomato, Meesho, Cred, Zepto, Groww, Vercel, Deel, Postman.

### Product / enterprise (tier3) — default if company unknown

| | Junior | Mid | Senior | Staff |
|---|---|---|---|---|
| India (LPA) | 8–15 | 15–28 | 28–50 | 50–80 |
| US (USD k) | 90–120 | 120–160 | 160–210 | 210–280 |
| EU (EUR k) | 50–70 | 70–100 | 100–130 | 130–180 |

Examples: IBM, JPMorgan, Myntra, Walmart, Airtel, Target-class product orgs.

### IT / services / agencies (tier4)

| | Junior | Mid | Senior | Staff |
|---|---|---|---|---|
| India (LPA) | 4–8 | 8–15 | 15–25 | 25–40 |
| US (USD k) | 70–90 | 90–130 | 130–160 | 160–200 |
| EU (EUR k) | 40–55 | 55–75 | 75–100 | 100–140 |

Examples: TCS, Infosys, Wipro, Accenture, Capgemini, Cognizant, Deloitte.

### Early-stage startups

| | Junior | Mid | Senior | Staff |
|---|---|---|---|---|
| India (LPA) | 6–12 | 12–20 | 20–35 | 35–55 |
| US (USD k) | 80–110 | 110–150 | 150–200 | 200–260 |
| EU (EUR k) | 45–65 | 65–90 | 90–120 | 120–160 |

## How to present

1. State tier + region + seniority + multiplier.
2. Give the range. Label it **estimate from OFJ static ladder**.
3. If they gave current CTC: say under / around / above the midpoint. Do not invent a percentile.
4. Always send them to the live calculator for the official number (company match + listings).
5. Never write ₹40K LPA. India is lakhs (4–8 LPA junior services, not 40,000 LPA).
