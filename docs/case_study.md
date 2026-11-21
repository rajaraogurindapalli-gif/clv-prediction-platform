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
| **Descriptive** | What happened? | Power BI dashboards on Gold features (spend, orders, tickets, segments) |
| **Diagnostic** | Why did it happen? | Drill-down analysis, cohort views, and driver exploration in Power BI |
| **Predictive** | What will happen? | EDA + ML Pipeline with regression models predicting CLV and related outcomes |
| **Prescriptive** | What should we do? | Generative AI / RAG agent recommending next-best actions based on predictions |

---

## Predictive AI Layer: EDA and ML Pipeline

The Predictive AI layer follows a structured machine learning workflow:

### 1. Exploratory Data Analysis (EDA)
- Distribution analysis of continuous variables (spend, order value)
- Frequency analysis of discrete and categorical variables
- Correlation and relationship exploration
- Outlier and missing value assessment on the Gold feature table
- Segmentation insights (by tier, country, segment)

### 2. ML Pipeline
```
Gold Feature Table
       ↓
Train-Test Split
       ↓
Preprocessing (scaling, encoding)
       ↓
Model Training (XGBoost / LightGBM Regression)
       ↓
Evaluation (RMSE, MAE, R²)
       ↓
Model Registration & Scoring
       ↓
Predictions written back for Power BI & Prescriptive layer
```

- **Target variables**: CLV, next order value, ticket volume, satisfaction score
- **Algorithms**: Gradient Boosting Regression (primary), with Ridge as baseline
- **Validation**: Cross-validation and hold-out test set
- **Outputs**: Customer-level predictions consumed by dashboards and the Generative AI layer

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

```
Raw Sources
    ↓
Bronze → Silver → Gold (Features)
    ↓
Descriptive & Diagnostic Analytics (Power BI)
    ↓
Predictive AI
  • EDA
  • ML Pipeline (Regression)
    ↓
Prescriptive AI (RAG / Agent)
    ↓
Decisions & Actions
```

---

## Implementation Approach

The project follows DataOps principles with version-controlled SQL and Python artifacts stored in GitHub. Development proceeds through Dev → Test → Prod environments. The ML pipeline is implemented in Python (scikit-learn + XGBoost) for reliability and reproducibility.

---

## Expected Outcomes

- Clear visibility into historical customer behavior (Descriptive)
- Understanding of key drivers (Diagnostic)
- Accurate, pipeline-driven predictions (Predictive)
- Actionable recommendations (Prescriptive)
- Improved targeting, forecasting, and customer experience

---

## Discussion Questions

1. What are the primary risks of relying solely on structured transactional data for CLV prediction?
2. How should the organization balance model accuracy with explainability when deploying the generative AI layer?
3. What governance mechanisms are required as the platform moves from portfolio demonstration to production?
4. How might the five business questions evolve as the company matures its data and AI capabilities?

---

*This case was prepared for portfolio and educational purposes to demonstrate end-to-end data architecture, analytics maturity, predictive modeling with EDA and ML pipelines, and generative AI integration.*
