# Customer Lifetime Value Prediction Platform
## A Data & AI Transformation Case

**Industry**: Digital Retail & Subscription  
**Company Size**: Mid-sized (250,000 customers)  
**Focus**: Descriptive, Diagnostic, Predictive & Prescriptive Analytics  

---

## Abstract

A mid-sized digital retail and subscription company seeks to move from reactive customer management to proactive, value-based decision making. With customer data scattered across structured transactional systems, semi-structured digital events, and unstructured feedback channels, the organization lacks a unified view of future customer value. This case examines how the company designs and implements a Customer Lifetime Value (CLV) prediction platform that progresses through descriptive, diagnostic, predictive, and prescriptive analytics using medallion architecture and AI.

---

## Company Background

The company operates an e-commerce platform and subscription service offering physical products and digital memberships. Its customer base of 250,000 spans multiple countries and acquisition channels. While the firm possesses substantial historical data, it struggles to answer fundamental forward-looking questions about customer value, revenue contribution, service demand, and satisfaction.

Leadership has identified five critical business questions that, if answered reliably, would improve retention targeting, marketing efficiency, operational planning, and customer experience.

---

## The Business Questions

1. **What is the predicted 12-month Customer Lifetime Value of each customer?**  
   Enables prioritization of retention efforts and marketing investment.

2. **How much revenue will the existing customer base generate next quarter?**  
   Supports financial planning and resource allocation.

3. **What is the expected value of a customer’s next order?**  
   Informs personalization and dynamic offer strategies.

4. **How many support tickets is a customer likely to raise in the next 90 days?**  
   Allows proactive service staffing and churn-risk identification.

5. **What satisfaction score is a customer likely to give after their next interaction?**  
   Helps identify at-risk experiences and trigger timely interventions.

---

## Analytics Maturity Path

| Analytics Type | Question Answered | How It Is Delivered in This Platform |
|----------------|-------------------|--------------------------------------|
| **Descriptive** | What happened? | Power BI dashboards on Gold features |
| **Diagnostic** | Why did it happen? | Drill-down analysis and driver exploration |
| **Predictive** | What will happen? | EDA + ML Pipeline with regression models |
| **Prescriptive** | What should we do? | Generative AI / RAG agent recommendations |

---

## Key Metrics & Success Criteria

| Metric | Target | Purpose |
|--------|--------|---------|
| CLV Model RMSE | < 15% of mean CLV | Prediction accuracy |
| R² Score | > 0.75 | Explanatory power |
| Forecast MAPE | < 10% | Quarterly revenue reliability |
| High-value retention lift | +8–12% | Business impact |
| Score coverage | > 95% of active customers | Operational completeness |

---

## Variable Dictionary (Gold Layer)

| Feature | Type | Description |
|---------|------|-------------|
| total_spend | Continuous | Historical monetary value |
| avg_order_value | Continuous | Average transaction size |
| order_count | Discrete | Number of purchases |
| ticket_count | Discrete | Number of support tickets |
| subscription_tier | Ordinal | Basic / Standard / Premium |
| country | Nominal | Customer geography |
| preferred_category | Nominal | Dominant product category |
| customer_segment | Nominal | New / Repeat / Loyal / One-time |
| days_since_last_order | Continuous | Recency signal |

---

## Predictive AI Layer: EDA and ML Pipeline

### Exploratory Data Analysis (EDA)
- Distribution and correlation analysis
- Outlier and missing value assessment
- Segmentation profiling

### ML Pipeline
```
Gold Feature Table → Train-Test Split → Preprocessing 
→ Model Training (XGBoost/LightGBM) → Evaluation → Scoring
```

---

## Technology Decisions

| Component | Choice | Rationale |
|-----------|--------|-----------|
| Raw Storage | MS SQL Server | Strong relational handling, already available |
| Transformation | Fabric + SQL | Medallion support, Power BI integration |
| Modeling | Python (scikit-learn + XGBoost) | Flexibility, reproducibility, portfolio clarity |
| Visualization | Power BI | Native connectivity, business-user friendly |
| Version Control | GitHub | Collaboration and artifact management |

---

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Poor data quality | Bronze-to-Silver cleaning rules + monitoring |
| Model drift | Scheduled retraining and performance tracking |
| Cold-start customers | Segment-based defaults and proxy features |
| Low explainability | SHAP values + Generative AI narratives |
| Trial/platform limits | Local Python fallback for modeling |

---

## Project Phases

1. **Foundation** — Bronze ingestion and data quality
2. **Preparation** — Silver cleaning and Gold feature engineering
3. **Analytics** — Descriptive and Diagnostic dashboards
4. **Predictive** — EDA + ML Pipeline development
5. **Prescriptive** — Generative AI / RAG layer
6. **Operationalization** — Scoring, monitoring, and documentation

---

## Data Landscape

| Data Type | Examples | Variable Types |
|-----------|----------|----------------|
| Structured | Profiles, transactions, tickets | Continuous, Discrete, Nominal, Ordinal |
| Semi-Structured | Clickstream JSON, logs | Discrete, Continuous, Nominal |
| Unstructured | Reviews, chats | Engineered Continuous & Ordinal |

---

## Proposed Solution Architecture

```
Raw Sources → Bronze → Silver → Gold
                ↓
     Descriptive & Diagnostic (Power BI)
                ↓
         Predictive AI (EDA + ML Pipeline)
                ↓
      Prescriptive AI (RAG / Agent)
                ↓
           Decisions & Actions
```

---

## Expected Outcomes

- Historical visibility and driver understanding
- Reliable customer-level and aggregate predictions
- Actionable, explainable recommendations
- Improved retention targeting and forecasting accuracy

---

## Discussion Questions

1. What are the primary risks of relying solely on structured transactional data for CLV prediction?
2. How should the organization balance model accuracy with explainability?
3. What governance mechanisms are required for production deployment?
4. How might the business questions evolve as capabilities mature?

---

*Prepared for portfolio demonstration of end-to-end data architecture, analytics maturity, predictive modeling, and generative AI integration.*
