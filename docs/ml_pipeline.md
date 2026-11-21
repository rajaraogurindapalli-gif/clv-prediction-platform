# EDA and ML Pipeline Documentation
## Customer Lifetime Value Prediction Platform

## Environment Strategy

| Environment | Data Volume | Purpose |
|-------------|-------------|---------|
| **Dev** | 10% of Gold table | EDA, experimentation, model development |
| **Test** | 50% of Gold table | Pipeline validation and final evaluation |
| **Prod** | 100% + future data | Batch scoring and prediction serving |

---

## Transition from SQL Server to Microsoft Fabric

After the Gold table is finalized in SQL Server, the following steps move the platform into Fabric:

### Step 1: Export Gold Table
- Export `gold_customer_features` from SQL Server to CSV (or Parquet).

### Step 2: Create Fabric Workspace & Lakehouse
- Create or use an existing Fabric workspace.
- Create a Lakehouse (e.g., `clv_lakehouse`).

### Step 3: Ingest Gold Table into Fabric
- Upload the exported file to the Lakehouse Files area, **or**
- Use a Data Pipeline / Dataflow to copy from SQL Server into the Lakehouse.

### Step 4: Create Lakehouse Table
- Load the file into a Delta table named `gold_customer_features`.
- This becomes the source for Power BI and optional Fabric notebooks.

### Step 5: Environment Samples in Fabric
- Dev sample (10%): Create a view or table `gold_features_dev`
- Test sample (50%): Create `gold_features_test`
- Prod: Use the full `gold_customer_features` table + future incremental loads

### Step 6: Power BI Connection
- Build Power BI reports directly on the Fabric Lakehouse tables.
- Support Descriptive and Diagnostic analytics.

### Step 7: Optional Fabric Notebook Execution
- Run scoring notebooks inside Fabric against the Lakehouse tables if desired.
- Alternatively, continue scoring in Python locally and write results back.

---

## Stage 1: Data Extraction
- Primary source: Fabric Lakehouse table `gold_customer_features`
- Fallback: SQL Server (during transition)
- Create environment-specific samples (Dev 10%, Test 50%, Prod 100%)

## Stage 2: Exploratory Data Analysis (EDA) — Performed in Dev
- Summary statistics
- Distribution plots
- Correlation analysis
- Missing value and outlier review
- Segment profiling

## Stage 3: Target Definition
- Primary target: Predicted 12-month CLV
- Secondary targets: Next order value, ticket volume, satisfaction

## Stage 4: Train-Test Split
- Applied within Dev and Test environments

## Stage 5: Preprocessing Pipeline
- Scaling, encoding, imputation via scikit-learn Pipeline

## Stage 6: Model Training (Dev)
- XGBoost / LightGBM Regressor (primary)
- Ridge Regression (baseline)

## Stage 7: Evaluation (Test)
- RMSE, MAE, R²
- Feature importance and residual analysis

## Stage 8: Model Promotion
- Serialize pipeline
- Store artifact for Prod scoring

## Stage 9: Production Scoring
- Score full Gold table in Fabric (or locally)
- Write predictions to `gold_clv_predictions`
- Support incremental/future data

## Stage 10: Monitoring Provision
- Prediction distribution tracking
- Drift detection readiness

---

## End-to-End Flow

```
SQL Server (Bronze/Silver/Gold)
        ↓
   Export / Pipeline
        ↓
Microsoft Fabric Lakehouse (Gold)
        ↓
Dev (10%) / Test (50%) / Prod (100%+future)
        ↓
EDA → ML Pipeline → Scoring
        ↓
Power BI + Predictions
```
