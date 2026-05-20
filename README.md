[README.md](https://github.com/user-attachments/files/28039157/README.md)
# NYC Airbnb Market Analysis — Tableau Dashboard

**Valentine Emehige | Data Analyst**

A three-page Tableau dashboard analysing 48,895 New York City Airbnb listings to surface actionable intelligence for property management decision-making. Built to demonstrate Tableau dashboard design, calculated field logic, and business-oriented analytical storytelling across three distinct stakeholder perspectives. All major findings independently validated with SQL before publication.

---

## Live Dashboard

🔗 **[View on Tableau Public](https://public.tableau.com/views/NYC_Airbnb_Analysis/ExecutiveOverview?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

Interact with all three dashboard pages directly in your browser — no software required.

---

## Dashboard Pages

### Page 1 — Executive Overview
*Target audience: Leadership stakeholders*

![Executive Overview](./screenshots/executive_overview.png)

A high-level view of the NYC rental market combining a geographic dot map, borough-level pricing comparison, room type composition, and a time series of review activity from 2015–2019.

- 48,895 listings plotted across all five NYC boroughs
- Manhattan commands the highest average price at $196.88/night
- Market is nearly evenly split: 25,409 entire homes vs 22,326 private rooms
- Review volume accelerates sharply into 2019, reflecting peak market activity

---

### Page 2 — Revenue & Pricing Analysis
*Target audience: Finance stakeholders*

![Revenue & Pricing](./screenshots/revenue_pricing.png)

Neighbourhood-level pricing ranked by average nightly rate (top 15, minimum 10 listings), alongside a scatter plot of individual listing price vs availability showing how pricing distributes across the full market.

- Tribeca leads neighbourhood pricing at $490.64 average nightly rate
- Riverdale (Bronx) ranks #2 at $442.09 — a Bronx neighbourhood outpricing Battery Park City ($367.56) and Flatiron District ($341.93)
- Price filtered to under $1,000 for visual clarity — 97% of listings fall within this range
- Scatter plot reveals Manhattan dots consistently higher on price axis across all availability levels

---

### Page 3 — Operational Performance
*Target audience: Operations / Property Management*

![Operational Performance](./screenshots/operational_performance.png)

Borough-level occupancy rate proxy calculated as `(365 - AVG(Availability 365)) / 365`, paired with an analytical text annotation connecting the numbers to real operational decisions.

**Standout finding:** Brooklyn leads Manhattan on occupancy rate (72.5% vs 69.3%) despite commanding lower average prices ($124 vs $197). A property manager optimising for yield — not just nightly rate — finds Brooklyn potentially more attractive once vacancy risk is factored in.

Staten Island underperforms at 45.3% — nearly 27 points below Brooklyn. High availability with low review volume signals insufficient demand rather than deliberate host strategy.

**SQL cross-validation:** Query 3 ran the identical occupancy formula against raw data in SQLite and returned Brooklyn 72.5%, Manhattan 69.3%, Staten Island 45.3% — exact match to Tableau's calculated fields.

---

## SQL Validation Layer

Five queries written in SQLite (DB Browser) to independently verify all major dashboard findings before publication.

| Query | What It Validates |
|---|---|
| Q1 — Portfolio summary by room type | Entire homes avg $211.79 vs private rooms $89.78 |
| Q2 — Top 10 neighbourhoods by avg price | Tribeca $490.64 · Riverdale (Bronx) $442.09 as surprise #2 |
| Q3 — Occupancy rate by borough | Brooklyn 72.5% · Manhattan 69.3% · Staten Island 45.3% ✓ |
| Q4 — Price tier segmentation (CASE WHEN) | Mid-range dominates at 55% of supply · Luxury sits emptiest |
| Q5 — Host portfolio distribution | 86% single-listing hosts · 94 operators average 31.6 listings |

📁 Full queries: [`/sql/nyc_airbnb_analysis.sql`](./sql/nyc_airbnb_analysis.sql)

---

## Excel Companion Workbook

Four-sheet workbook built as an analytical companion to the Tableau dashboard.

| Sheet | Contents |
|---|---|
| 1 — Cleaned Data Sample | 50 representative rows with occupancy rate column and anomaly flags |
| 2 — Pivot Analysis | Avg price by borough × room type · Occupancy rate comparison table |
| 3 — KPI Summary | 15 KPIs with live formula references · Financial model colour conventions |
| 4 — What-If Pricing Model | Input your rate, occupancy %, listings, fees, and costs → net profit recalculates automatically, benchmarked vs Brooklyn and Manhattan averages |

📁 File: [`NYC_Airbnb_Companion_Workbook.xlsx`](./NYC_Airbnb_Workbook.xlsx)

---

## Dataset

| Attribute | Detail |
|---|---|
| Source | [NYC Airbnb Open Data — Kaggle](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data) |
| File | AB_NYC_2019.csv |
| Rows | 48,895 listings |
| Columns | 16 fields |
| Coverage | All five NYC boroughs |
| Snapshot date | 2019 |

### Columns Used

| Column | Type | Used For |
|---|---|---|
| latitude / longitude | Geographic | Map visualisation |
| neighbourhood_group | Categorical | Borough filtering and colour encoding |
| neighbourhood | Categorical | Top 15 neighbourhood ranking |
| room_type | Categorical | Market composition analysis |
| price | Numeric | Pricing analysis across all pages |
| availability_365 | Numeric | Occupancy rate calculation |
| number_of_reviews | Numeric | Review volume count |
| last_review | Date | Time series on Reviews Over Time |
| calculated_host_listings_count | Numeric | Host portfolio analysis |
| name | Text | Tooltip labels on map and scatter |

---

## Calculated Fields

### Occupancy Rate
```
(365 - AVG([Availability 365])) / 365
```
Proxy for occupancy based on availability data. A listing available 0 days of the year has a 100% occupancy rate; available 365 days has 0%. Formatted as percentage with 1 decimal place. Validated against SQL Query 3.

---

## Methodology Notes

**Price filter on scatter plot:** Price capped at $1,000 for the Price vs Availability scatter. This covers 97% of listings and prevents extreme outliers (up to $10,000) from compressing the main cluster into an unreadable band at the bottom.

**Neighbourhood filter:** Top 15 neighbourhoods by average price filtered to a minimum of 10 listings. This removes statistical outliers like Fort Wadsworth which had extreme average prices driven by 1–2 listings only.

**Occupancy proxy:** Availability_365 represents days the listing is available to be booked, not confirmed bookings. Unavailability is treated as bookings — standard InsideAirbnb methodology, acknowledged as approximation.

**Hotel room category:** The 2019 dataset predates Airbnb's formal "Hotel room" room type category. Only three room types appear: Entire home/apt, Private room, and Shared room.

---

## Design Decisions

| Decision | Rationale |
|---|---|
| Teal (#006D77) as primary colour | Distinct from Power BI projects in portfolio — signals tool adaptability |
| Salmon (#E29578) as secondary | Warm contrast against teal, readable on white background |
| Consistent borough colour encoding | Same colour per borough across all three pages — reduces cognitive load |
| White background | Clean professional aesthetic distinct from dark-theme Power BI work |
| Analytical text on Page 3 | Connects numbers to business decisions — targets operations stakeholders directly |
| Three separate dashboard pages | Maps to three stakeholder types: leadership, finance, operations |

---

## Key Findings Summary

| Finding | Numbers | Business Implication |
|---|---|---|
| Manhattan price premium | $196.88 vs $87.50 (Bronx) | 2.3x pricing gap across boroughs |
| Brooklyn occupancy advantage | 72.5% vs 69.3% Manhattan | Higher yield potential despite lower price — SQL verified |
| Market composition | 52% entire homes, 46% private rooms | Near-even split — both segments viable |
| Tribeca premium | $490.64 avg/night | 2.5x Manhattan average — SQL verified |
| Riverdale surprise | $442.09 avg/night (Bronx) | #2 in city — Bronx outlier worth investigating |
| Staten Island underperformance | 45.3% occupancy | 27-point gap vs Brooklyn — demand risk |
| Host market fragmentation | 86% single-listing hosts | Professional operators (94 hosts, 10+ listings) are a small distinct class |
| Luxury vacancy | 160 avg availability days | Highest of any price tier — luxury listings sit emptiest |

---

## Tools Used

- **Tableau Public** — dashboard building, calculated fields, geographic visualisation, published live
- **SQLite (DB Browser)** — 5 validation queries, all findings cross-referenced against Tableau
- **Excel** — companion workbook with pivot analysis, KPI summary, and what-if pricing model
- **Data source:** CSV direct connection
- **Map provider:** Mapbox via Tableau

---

## Repository Structure

```
NYC-Airbnb-Tableau-Analysis/
│
├── NYC_Airbnb_Analysis.twbx           # Packaged Tableau workbook
├── NYC_Airbnb_Companion_Workbook.xlsx  # Excel companion (4 sheets)
├── README.md                           # This file
│
├── sql/
│   └── nyc_airbnb_analysis.sql         # 5 validation queries (SQLite)
│
└── screenshots/
    ├── executive_overview.png
    ├── revenue_pricing.png
    └── operational_performance.png
```

---

## Other Portfolio Projects

| Project | Tools | Link |
|---|---|---|
| LendingClub Credit Risk Analysis | Power BI · SQL · DAX | [GitHub](https://github.com/Ti-Man/LendingClub-Credit-Risk-Analysis) · [Maven](https://mavenshowcase.com/project/55667) |
| Zara Store Sales Dashboard | Power BI · Excel · DAX | [Maven](https://mavenshowcase.com/project/55750) |
| Medical Insurance Charges Analysis | Google Sheets · AVERAGEIF · COUNTIFS | Maven Analytics |

---

*Valentine Emehige — Data Analytics Portfolio*
*mavenshowcase.com*
