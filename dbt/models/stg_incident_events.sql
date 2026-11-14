select
  cast(number as string)                                      as number,
  cast(sys_mod_count as int64)                                as sys_mod_count,
  lower(cast(made_sla as string)) = 'true'                    as made_sla,
  coalesce(
    safe.parse_datetime('%d/%m/%Y %H:%M', cast(opened_at as string)),
    safe_cast(opened_at as datetime)
  ) as opened_at,
  nullif(cast(priority as string), '?')         as priority,
  nullif(cast(impact as string), '?')           as impact,
  nullif(cast(urgency as string), '?')          as urgency,
  nullif(cast(category as string), '?')         as category,
  nullif(cast(subcategory as string), '?')      as subcategory,
  nullif(cast(u_symptom as string), '?')        as u_symptom,
  nullif(cast(assignment_group as string), '?') as assignment_group,
  nullif(cast(contact_type as string), '?')     as contact_type,
  nullif(cast(location as string), '?')         as location
from {{ source('raw', 'incident_event_log') }}
