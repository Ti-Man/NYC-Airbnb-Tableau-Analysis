# NYC Airbnb Market Analysis — Tableau Dashboard

**Valentine Emehige | Data Analyst**

A three-page Tableau dashboard analysing 48,895 New York City Airbnb listings to surface actionable intelligence for property management decision-making. Built to demonstrate Tableau dashboard design, calculated field logic, and business-oriented analytical storytelling across three distinct stakeholder perspectives.

---

## Live Dashboard

> **Download:** [NYC_Airbnb_Analysis.twbx](./NYC_Airbnb_Analysis.twbx)
> Open with Tableau Desktop or Tableau Public (free) to interact with all three dashboards.

---

## Dashboard Pages

### Page 1 — Executive Overview
*Target audience: Leadership stakeholders*

![Executive Overview](./screenshots/executive_overview.png)

A high-level view of the NYC rental market combining a geographic dot map, borough-level pricing comparison, room type composition, and a time series of review activity from 2015–2019.

- 48,895 listings plotted across all five NYC boroughs
- Manhattan commands the highest average price at $196.9/night
- Market is nearly evenly split: 25,409 entire homes vs 22,326 private rooms
- Review volume accelerates sharply into 2019, reflecting peak market activity

---

### Page 2 — Revenue & Pricing Analysis
*Target audience: Finance stakeholders*

![Revenue & Pricing](./screenshots/revenue_pricing.png)

Neighbourhood-level pricing ranked by average nightly rate (top 15, minimum 10 listings), alongside a scatter plot of individual listing price vs availability showing how pricing distributes across the full market.

- Tribeca leads neighbourhood pricing at $490.6 average nightly rate
- Riverdale ($442.1) and Battery Park City ($367.6) follow as premium markets
- Price filtered to under $1,000 for visual clarity — 97% of listings fall within this range
- Scatter plot reveals teal (Manhattan) dots consistently higher on price axis across all availability levels

---

### Page 3 — Operational Performance
*Target audience: Operations / Property Management*

![Operational Performance](./screenshots/operational_performance.png)

Borough-level occupancy rate proxy calculated as `(365 - AVG(Availability 365)) / 365`, paired with an analytical text annotation connecting the numbers to real operational decisions.

**Standout finding:** Brooklyn leads Manhattan on occupancy rate (72.5% vs 69.3%) despite commanding lower average prices ($124 vs $197). This suggests Brooklyn listings generate more consistent bookings — potentially higher yield when price premium is weighed against vacancy risk.

Staten Island underperforms at 45.3% — nearly 30 points below Brooklyn. High availability with low bookings signals either poor market fit or insufficient demand.

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
Proxy for occupancy based on availability data. A listing available 0 days of the year has a 100% occupancy rate; available 365 days has 0%. Formatted as percentage with 1 decimal place.

---

## Methodology Notes

**Price filter on scatter plot:** Price capped at $1,000 for the Price vs Availability scatter. This covers 97% of listings and prevents extreme outliers (up to $10,000) from compressing the main cluster into an unreadable band at the bottom.

**Neighbourhood filter:** Top 15 neighbourhoods by average price filtered to a minimum of 10 listings. This removes statistical outliers like Fort Wadsworth which had extreme average prices driven by 1–2 listings only.

**Occupancy proxy:** Availability_365 represents days the listing is available to be booked, not days it was actually booked. The occupancy rate calculated here is a proxy — unavailability is treated as bookings. This is standard practice for InsideAirbnb data analysis and acknowledged as a limitation.

**Hotel room category:** The 2019 dataset predates Airbnb's formal "Hotel room" room type category. Only three room types appear: Entire home/apt, Private room, and Shared room.

**Map tiles:** Tableau's online map tiles load via Mapbox. Offline map mode used during development due to connectivity constraints — dashboard renders with full online tiles when opened with an active internet connection.

---

## Design Decisions

| Decision | Rationale |
|---|---|
| Teal (#006D77) as primary colour | Distinct from Power BI projects in portfolio — signals tool adaptability |
| Salmon (#E29578) as secondary | Warm contrast against teal, readable on white background |
| Consistent borough colour encoding | Same colour per borough across all three pages — reduces cognitive load |
| White background | Clean professional aesthetic distinct from dark-theme Power BI work |
| Analytical text on Page 3 | Connects numbers to business decisions — targets operations stakeholders directly |
| Three separate dashboard pages | Maps to three stakeholder types named in target job description: leadership, finance, operations |

---

## Key Findings Summary

| Finding | Numbers | Business Implication |
|---|---|---|
| Manhattan price premium | $196.9 vs $87.5 (Bronx) | 2.3x pricing gap across boroughs |
| Brooklyn occupancy advantage | 72.5% vs 69.3% Manhattan | Higher yield potential despite lower price |
| Market composition | 52% entire homes, 46% private rooms | Near-even split — both segments viable |
| Tribeca premium | $490.6 avg/night | Top neighbourhood commands 2.5x Manhattan average |
| Staten Island underperformance | 45.3% occupancy | 27-point gap vs Brooklyn — demand risk |
| 2019 review spike | Sharp acceleration visible | Peak activity before regulatory environment shift |

---

## Tools Used

- **Tableau Desktop** — dashboard building, calculated fields, geographic visualisation
- **Data source:** CSV direct connection (live)
- **Map provider:** Mapbox via Tableau (offline mode during development)

---

## Repository Structure

```
NYC-Airbnb-Tableau-Analysis/
│
├── NYC_Airbnb_Analysis.twbx     # Packaged Tableau workbook (includes data)
├── README.md                     # This file
│
└── screenshots/
    ├── executive_overview.png    # Dashboard 1
    ├── revenue_pricing.png       # Dashboard 2
    └── operational_performance.png  # Dashboard 3
```

---

## Other Portfolio Projects

| Project | Tools | Link |
|---|---|---|
| LendingClub Credit Risk Analysis | Power BI, SQL, DAX | [GitHub](https://github.com/Ti-Man/LendingClub-Credit-Risk-Analysis) |
| Zara Store Sales Dashboard | Power BI, Excel, DAX | Maven Analytics |
| Medical Insurance Charges Analysis | Google Sheets, AVERAGEIF, COUNTIFS | Maven Analytics |

---

*Valentine Emehige — Data Analytics Portfolio*
*mavenshowcase.com*
