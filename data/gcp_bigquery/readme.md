## Data Setup: Load the Dataset into BigQuery

1. **Download** the [Incident Management dataset](https://archive.ics.uci.edu/dataset/498/incident+management+process+enriched+event+log) from UCI and unzip it to get `incident_event_log.csv`.

2. **Create a dataset.** In the [BigQuery console](https://console.cloud.google.com/bigquery), click `⋮` next to your project ID and choose **Create dataset**. Set **Dataset ID** to `raw` and the location to **Multi-region: EU**.

3. **Create the table.** Click `⋮` next to `raw` and choose **Create table**:
   * **Source:** Upload `incident_event_log.csv`, format **CSV**
   * **Table:** `incident_event_log`
   * **Schema:** check **Auto detect**
   * **Advanced options:** set **Null markers** to `?` (the dataset uses `?` for missing values)

4. **Verify** in the query editor. You should get 141,712 records and 24,918 incidents:

   ```sql
   SELECT
     COUNT(*) AS total_records,
     COUNT(DISTINCT number) AS unique_incidents
   FROM `raw.incident_event_log`;
   ```
