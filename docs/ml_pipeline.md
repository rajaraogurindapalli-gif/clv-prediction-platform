# EDA and ML Pipeline Documentation
## Customer Lifetime Value Prediction Platform

## Architectural Decision: Medallion in SQL Server First

### Why Medallion Architecture Was Implemented in SQL Server Before Fabric

| Reason | Explanation |
|--------|-------------|
| **Tool Availability** | MS SQL Server was immediately available with no trial limitations or capacity constraints. |
| **SQL Competency Demonstration** | Building Bronze, Silver, and Gold layers in SQL showcased core data engineering skills (DDL, DML, data quality, joins, aggregations). |
| **Data Quality Control** | SQL provided precise, auditable control over cleaning rules and transformations on structured data. |
| **Risk Reduction** | Fabric trial environments have usage limits and expiration. Completing the foundational layers in SQL avoided dependency on trial constraints. |
| **Separation of Concerns** | SQL Server handled reliable structured data processing; Fabric is positioned for analytics serving, Power BI integration, and optional large-scale processing. |
| **Portfolio Clarity** | The approach demonstrates ability to work across both traditional (SQL) and modern (Fabric) platforms. |

### Logical Conclusion
The Medallion architecture was intentionally built in SQL Server to establish a stable, auditable, and skill-demonstrating foundation. Once the Gold layer was validated, the platform transitions to Microsoft Fabric for consumption, visualization, and future scalability. This hybrid approach is pragmatic, low-risk, and professionally defensible.

---

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

### Step 5: Environment Samples in Fabric
- Dev (10%), Test (50%), Prod (100% + future)

### Step 6: Power BI Connection
- Connect Power BI to Fabric Lakehouse tables.

### Step 7: Optional Notebook Execution
- Scoring can run in Fabric notebooks or remain in Python with results written back.

---

## Stage 1: Data Extraction
- Primary source after transition: Fabric Lakehouse
- Dev / Test / Prod sampling strategy remains unchanged

## Stage 2: Exploratory Data Analysis (EDA)
- Performed primarily on Dev (10%) sample

## Stage 3: Target Definition
- Predicted 12-month CLV (primary)

## Stage 4–10: ML Pipeline Stages
- Preprocessing, training (Dev), evaluation (Test), promotion, production scoring (Prod), and monitoring remain as previously defined.

---

## End-to-End Flow

```
SQL Server (Medallion: Bronze → Silver → Gold)
        ↓
   Architectural Foundation Complete
        ↓
Microsoft Fabric Lakehouse
        ↓
Dev (10%) / Test (50%) / Prod (100%+future)
        ↓
EDA → ML Pipeline → Scoring → Power BI
```
