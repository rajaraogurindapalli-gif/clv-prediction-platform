# Customer Lifetime Value Prediction Platform
## A Data & AI Transformation Case

**Industry**: Digital Retail & Subscription  
**Company Size**: Mid-sized (250,000 customers)  
**Focus**: Predictive Analytics, Medallion Architecture, Regression Modeling  

---

## Abstract

A mid-sized digital retail and subscription company seeks to move from reactive customer management to proactive, value-based decision making. With customer data scattered across structured transactional systems, semi-structured digital events, and unstructured feedback channels, the organization lacks a unified view of future customer value. This case examines how the company designs and implements a Customer Lifetime Value (CLV) prediction platform using medallion architecture, regression-based predictive AI, and generative AI for explainability.

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

## Data Landscape

| Data Type | Examples | Variable Types Present |
|-----------|----------|------------------------|
| **Structured** | Customer profiles, transactions, support tickets | Continuous, Discrete, Nominal, Ordinal |
| **Semi-Structured** | Clickstream events (JSON), application logs | Discrete, Continuous, Nominal |
| **Unstructured** | Product reviews, chat transcripts, call notes | Text (engineered into Continuous & Ordinal) |

The data contains realistic quality issues (duplicates, nulls, inconsistent formatting, invalid values) that must be addressed before modeling.

---

## Proposed Solution Architecture

The company adopts a **Medallion Architecture** implemented across MS SQL Server and Microsoft Fabric:

```
Raw Sources (Structured, Semi-Structured, Unstructured)
        ↓
┌────────────────────────┐
│   BRONZE (Raw)        │  ← MS SQL Server
│   Preserve quality    │
│   issues              │
└──────────┬─────────────┘
             ↓
┌────────────────────────┐
│   SILVER (Cleaned)    │  ← Fabric / SQL
│   Standardized        │
│   Deduplicated        │
└──────────┬─────────────┘
             ↓
┌────────────────────────┐
│   GOLD (Features)     │  ← Customer 360 table
│   Model-ready         │
│   variables           │
└──────────┬─────────────┘
             ↓
    Predictive AI (Regression)
             ↓
    Generative AI (RAG / Agent)
             ↓
      Power BI + Decisions
```

- **Bronze Layer**: Raw data landed with minimal transformation. Quality issues are preserved for auditability.
- **Silver Layer**: Cleaned, conformed, and standardized data. Duplicates removed, invalid values handled, consistent categorization applied.
- **Gold Layer**: Business-ready customer feature table containing engineered variables suitable for regression modeling.

On top of the Gold layer:
- **Predictive AI**: Gradient boosting regression models (XGBoost/LightGBM) predict CLV and related continuous/discrete outcomes.
- **Generative AI**: A retrieval-augmented generation (RAG) layer explains model scores in natural language and recommends next-best actions.

Consumption occurs through Power BI dashboards and an internal AI agent interface.

---

## Implementation Approach

The project follows DataOps principles with version-controlled SQL and Python artifacts stored in GitHub. Development proceeds through Dev → Test → Prod environments. Modeling is performed in Python for reliability, while Fabric serves feature preparation and Power BI delivers visualization.

---

## Expected Outcomes

- Accurate, customer-level CLV predictions
- Improved targeting of high-value customers
- Better quarterly revenue forecasting
- Proactive support and experience management
- Explainable AI outputs that business users can trust and act upon

---

## Discussion Questions

1. What are the primary risks of relying solely on structured transactional data for CLV prediction?
2. How should the organization balance model accuracy with explainability when deploying the generative AI layer?
3. What governance mechanisms are required as the platform moves from portfolio demonstration to production?
4. How might the five business questions evolve as the company matures its data and AI capabilities?

---

*This case was prepared for portfolio and educational purposes to demonstrate end-to-end data architecture, predictive modeling, and generative AI integration.*
