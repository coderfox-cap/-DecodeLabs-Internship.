1. Executive Summary

This report presents an Exploratory Data Analysis (EDA) conducted on an e-commerce transactional dataset containing customer orders, pricing information, referral sources, and operational order statuses from January 2023 to June 2025.

The primary objective of the analysis was to identify:

customer purchasing behavior,
revenue-driving factors,
operational inefficiencies,
marketing channel performance,
temporal sales trends,
and revenue distribution patterns.

The analysis revealed that revenue volatility was influenced more by fluctuations in Average Order Value (AOV) than by changes in overall order volume. Instagram emerged as the strongest-performing acquisition channel due to its combination of high revenue contribution and comparatively low cancellation rates, while Google and Email channels demonstrated higher cancellation tendencies.

Correlation analysis showed that Total Revenue was strongly influenced by Unit Price and Quantity purchased, whereas cart size alone had only moderate influence on revenue generation. Additionally, Pareto analysis indicated that revenue contribution was moderately distributed across orders rather than being dominated by a very small subset of transactions.

Overall, the dataset demonstrated internally consistent transactional behavior with realistic revenue and purchasing relationships, though certain categorical distributions suggested partially balanced or synthetic dataset characteristics.

2. Objective of the Analysis

  The main objectives of this EDA were to:

  Analyze revenue and order trends over time.
  Study customer purchasing patterns.
  Investigate the impact of pricing and quantity on revenue.
  Evaluate referral-source performance.
  Identify operational inefficiencies through cancellation analysis.
  Detect outliers and validate transaction consistency.
  Understand revenue concentration behavior using Pareto analysis

3. Exploratory Data Analysis Findings

  3.1 Revenue Distribution Analysis
    Key Findings
    The TotalPrice distribution was positively skewed.
    Most orders were concentrated within low-to-mid price ranges.
    A smaller number of high-value transactions formed the upper revenue tail.
  Interpretation

    This indicates that the business primarily operates through moderate-value purchases while still benefiting from occasional premium or bulk transactions.

  Outlier Validation

    Outlier analysis confirmed that high-value orders were legitimate and primarily associated with larger purchase quantities rather than pricing errors or corrupted data.

  3.2 Customer Purchasing Behavior
    Quantity Analysis
    Quantity demonstrated a strong positive relationship with TotalPrice.
    Larger quantities contributed significantly to high-value transactions.
    Items-in-Cart Analysis
    Most customers maintained medium-sized carts.
    Cart-size distribution appeared relatively balanced without extreme anomalies.
Correlation Findings

Correlation analysis revealed:

Variable Pair	Correlation
UnitPrice ↔ TotalPrice	0.72
Quantity ↔ TotalPrice	0.62
ItemsInCart ↔ TotalPrice	0.39
Interpretation

Revenue generation was driven primarily by:

product pricing,
and purchase quantity,

while cart size alone exhibited only moderate influence on transaction value.

3.3 Referral Source Performance
Revenue Contribution

Instagram generated the highest total revenue among all acquisition channels.

Average Order Value (AOV)

Facebook exhibited the highest Average Order Value, indicating relatively stronger spending behavior per transaction.

Cancellation Rate Analysis
Referral Source	Approx Cancellation Rate
Google	Highest
Email	High
Referral	Moderate
Facebook	Lower
Instagram	Lowest
Interpretation

The analysis suggests that:

Instagram traffic demonstrated stronger purchase stability,
while Google and Email traffic exhibited relatively higher cancellation tendencies.

This may indicate differences in customer intent and acquisition quality across channels.

3.4 Operational Insights
Order Status Analysis

Cancelled orders exceeded Delivered orders within the dataset.

While initially appearing concerning, deeper analysis showed that:

cancellation behavior varied by acquisition source,
and no single catastrophic operational issue was identified.
Interpretation

Operational inefficiencies may be partially linked to:

promotion-driven traffic,
lower customer commitment,
or unstable purchasing behavior from certain acquisition channels.
3.5 Time-Series Analysis
Monthly Revenue Trends

Revenue demonstrated substantial month-to-month volatility without a consistent long-term growth trajectory.

Rolling Average Analysis

A 3-month rolling average smoothed short-term fluctuations and revealed:

moderate weakening of revenue momentum over time,
along with temporary isolated spikes.
Monthly Order Trend

Order volume remained comparatively stable across periods.

Monthly AOV Trend

Average Order Value fluctuated significantly between periods.

Interpretation

Revenue instability was influenced more by changes in customer spending intensity (AOV) than by major fluctuations in customer demand volume.

3.6 Pareto Revenue Analysis

Pareto analysis demonstrated that revenue contribution was moderately distributed across the order base.

Approximately:

50% of orders contributed to nearly 80% of cumulative revenue.
Interpretation

The business does not appear excessively dependent on a very small number of high-value transactions, indicating a relatively diversified revenue structure.

4. Key Business Insights
1. Revenue Volatility is AOV-Driven

Revenue fluctuations were primarily influenced by changes in transaction value rather than drastic changes in order volume.

2. Instagram Emerged as the Strongest Overall Acquisition Channel

Instagram combined:

strong revenue contribution,
healthy order volume,
and the lowest cancellation tendency.
3. Google and Email Channels Showed Higher Operational Risk

These channels exhibited elevated cancellation rates, suggesting comparatively weaker purchase stability.

4. Revenue Depends More on Pricing and Quantity Than Cart Size

Correlation analysis confirmed that UnitPrice and Quantity are the strongest revenue drivers.

5. Revenue Distribution is Moderately Balanced

The business is not overly dependent on a tiny subset of extreme-value purchases.


