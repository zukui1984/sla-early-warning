# SLA early-warning
D4B Practicum - Predicting SLA Breaches at Ticket Creation: An Early-Warning Prototype for IT Service Desks

## Part A: BigQuery
* Go to `console.cloud.google.com/bigquery` and sign in with Google account.
* Create a new project "sla-early-warning"
* Create a dataset "raw" and choose EU Location
* Upload CSV and name the table "incident_event_log", after can create the table

To test if the dataset works

```sql
SELECT COUNT(*) AS records, COUNT(DISTINCT number) AS incidents
FROM raw.incident_event_log
```
Here you will the result of **141712** and **24918**
