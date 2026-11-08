select *
from {{ ref('stg_incident_events') }}
qualify row_number() over (partition by number order by sys_mod_count asc) = 1