# Dev Environment Implementation
## Customer Lifetime Value Prediction Platform

## Overview
The Dev environment uses approximately 10% of the data and follows Medallion Architecture with full ACID compliance via Delta Lake in Microsoft Fabric.

## Architecture (Dev)

```
Raw CSVs
    ↓
Bronze (bronze_*)
    ↓
Silver (silver_*_dev)
    ↓
Gold (gold_customer_features_dev)
    ↓
Predictions (clv_predictions_dev)
    ↓
Power BI Semantic Model + Dashboard
```

## Tables Created

| Layer | Table Name | Rows (Approx) | Purpose |
|-------|------------|---------------|---------|
| Bronze | bronze_customers | 250,080 | Raw customers |
| Bronze | bronze_transactions | 800,000 | Raw transactions |
| Bronze | bronze_support_tickets | 137,500 | Raw tickets |
| Silver | silver_customers_dev | 24,996 | Cleaned customers (Dev) |
| Silver | silver_transactions_dev | 79,632 | Cleaned transactions (Dev) |
| Silver | silver_support_tickets_dev | 13,679 | Cleaned tickets (Dev) |
| Gold | gold_customer_features_dev | 24,996 | Feature table |
| Predictions | clv_predictions_dev | 24,996 | Model output |

## Modeling Results (Dev)

| Metric | Value |
|--------|-------|
| RMSE | 7.49 |
| MAE | 4.51 |
| R² | 0.9995 |

## Power BI Dashboard (Dev)

**Semantic Model**: `CLV_SemanticModel_Dev`  
**Report**: `CLV_Dashboard_Dev`

### Pages
1. **Historical Customer Overview** (Descriptive)
2. **Customer Behavior Drivers** (Diagnostic)
3. **Predicted Customer Lifetime Value** (Predictive)
4. **Recommended Actions & Risk** (Prescriptive)

## Key Measures
- Total Customers
- Average Spend
- Total Orders
- Average Predicted CLV
- Total Predicted CLV
- Average Tickets
- High Risk Customers

## Notebooks
- Bronze to Silver to Gold transformations
- Modeling and prediction scoring

## Next Steps
- Promote logic to Test environment (50%)
- Promote to Prod environment (100%)
- Add RAG / Agent layer

---
*Dev environment completed and validated.*
