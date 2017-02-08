--INSERT INTO time_entries(project_id,  issue_id, hours, comments, activity_id, user_id,spent_on,tyear,tmonth,tweek,created_on,updated_on)
--    VALUES (18, 4001, 2.1, 'Migrado del trac',9, 40,current_date, date_part('year', current_date), date_part('month', current_date), extract(week from current_date),current_date, current_date);
INSERT INTO time_entries(project_id,  issue_id, hours, comments, activity_id, user_id,spent_on,tyear,tmonth,tweek, created_on, updated_on)
SELECT 
  issues.project_id, 
  issues.id,
  custom_values.value::double precision,
  'Migrado del trac',
  9, 
  40,
  current_date, 
  date_part('year', current_date), 
  date_part('month', current_date),
  extract(week from current_date),
  current_date, 
  current_date
  
FROM 
  public.custom_fields, 
  public.custom_values, 
  public.issues
WHERE 
  custom_fields.id = custom_values.custom_field_id AND
  issues.id = custom_values.customized_id AND
  custom_fields.name = 'Esfuerzo' AND 
  issues.project_id = 18
  AND custom_values.value <> ''
  AND custom_values.value not ilike '%,%'
  AND custom_values.value not ilike '%+%'
  AND custom_values.value not ilike '%m%'
  AND custom_values.value not ilike '%:%'
