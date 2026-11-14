{{ config(materialized='table') }}
select
  f.number,
  f.opened_at,
  extract(hour from f.opened_at)     as opened_hour,
  format_datetime('%A', f.opened_at) as opened_weekday,
  f.priority, f.impact, f.urgency, f.category, f.subcategory, f.u_symptom,
  f.assignment_group, f.contact_type, f.location,
  l.made_sla
from {{ ref('int_first_event') }} as f
join {{ ref('int_last_event') }} as l on f.number = l.number
