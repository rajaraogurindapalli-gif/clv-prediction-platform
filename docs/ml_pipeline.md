# EDA and ML Pipeline Documentation
## Customer Lifetime Value Prediction Platform

## Environment Strategy

| Environment | Data Volume | Purpose |
|-------------|-------------|---------|
| **Dev** | 10% of Gold table | EDA, experimentation, model development |
| **Test** | 50% of Gold table | Pipeline validation and final evaluation |
| **Prod** | 100% + future data | Batch scoring and prediction serving |

---

## Stage 1: Data Extraction
- Connect to SQL Server and extract `gold_customer_features`.
- Create environment-specific samples:
  - Dev: 10% random sample
  - Test: 50% sample (non-overlapping with Dev where possible)
  - Prod: Full table + incremental new records

## Stage 2: Exploratory Data Analysis (EDA) — Performed in Dev
- Summary statistics
- Distribution plots (continuous variables)
- Categorical frequency analysis
- Correlation matrix
- Missing value and outlier review
- Segment profiling (tier, country, segment)

## Stage 3: Target Definition
- Primary target: Predicted 12-month CLV (proxy engineered from historical patterns for synthetic data)
- Secondary targets: Next order value, ticket volume, satisfaction score

## Stage 4: Train-Test Split (within each environment)
- Dev: Internal split for experimentation
- Test: Dedicated evaluation set
- Prod: No split (scoring only)

## Stage 5: Preprocessing Pipeline
- Continuous: StandardScaler
- Nominal: OneHotEncoder or TargetEncoder
- Ordinal: OrdinalEncoder
- Missing value imputation
- Implemented as a reusable scikit-learn Pipeline

## Stage 6: Model Training (Dev)
- Baseline: Ridge Regression
- Primary: XGBoost Regressor / LightGBM
- Hyperparameter exploration on Dev data

## Stage 7: Evaluation (Test)
- Metrics: RMSE, MAE, R²
- Feature importance
- Residual analysis
- Comparison against baseline

## Stage 8: Model Promotion
- Serialize trained pipeline (`joblib` / `pickle`)
- Version the model artifact in GitHub or model registry

## Stage 9: Production Scoring
- Load validated pipeline
- Score full Gold table (100%)
- Score any new/future customer records
- Write predictions to `gold_clv_predictions` table

## Stage 10: Monitoring Provision
- Track prediction distribution over time
- Prepare for data drift and model drift detection
- Support scheduled retraining

---

## Pipeline Flow

```
Gold Table
    ├── Dev (10%) → EDA + Development
    ├── Test (50%) → Validation
    └── Prod (100% + future) → Scoring
```

This structure ensures reproducibility, proper validation, and readiness for future data.
