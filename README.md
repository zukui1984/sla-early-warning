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

## Part B: DBT (data build tools)
Step 1: Make a key so dbt can use BigQuery
*	Google Cloud IAM & Admin -> Service Accounts and create `dbt-user`
*	Add 2 roles “BigQuery Data Editor” and “BigQuery Job User”
<img width="420" height="320" alt="image" src="https://github.com/user-attachments/assets/0d446002-0624-4fc9-acd5-b06b74d33cdd" />

* Open `dbt-user` and create new key -> JSON (this must be keep private)

Step 2: Set up dbt
* 
