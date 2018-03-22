SELECT distinct   custom_fields.name,   custom_values.value
FROM 
  public.custom_values, 
  public.custom_fields
WHERE 
  custom_fields.id = custom_values.custom_field_id AND
  custom_fields.name = 'Tiempo r';

 
 SELECT 
	  custom_values.value::double precision as hora_estimada,
	  custom_values.customized_id
	FROM 
	  custom_fields, 
	  custom_values
	WHERE 
	  custom_values.custom_field_id = custom_fields.id 
	  AND custom_fields.name = 'Tiempo r'  
	   AND custom_values.value <> '' 


 /*
 -- EN DIAGUITA custom_field_id = 7 ES EL CAMPO CUSTOM ESTIMADO

update custom_values 
	  set value = 0
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value is null or value = '');
	  
update custom_values 
	  set value = 4.5
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '4,5');



update custom_values 
	  set value = 1
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '1 hora' or value = '1 hr.');



update custom_values 
	  set value = 20
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '20hs.');




update custom_values 
	  set value = 3
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '3 horas');


update custom_values 
	  set value = 8
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '8 horas' or value = '8 hs.');

update custom_values 
	  set value = 11
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value = '11 horas' or value = '11 hs.');



update custom_values 
	  set value = 7
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo r')
	  AND (value is null or value = '1 día');




*/
 

/*
INSERT INTO time_entries(project_id,  issue_id, hours, comments, activity_id, user_id,spent_on,tyear,tmonth,tweek, created_on, updated_on)
SELECT 
  issues.project_id, 
  issues.id,
  custom_values.value::double precision, -- horas trabajadas
  'Migrado del trac',
  9, -- Desarrollador
  40, -- usuario
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
  custom_fields.name = 'Tiempo r'  
  AND issues.project_id = 41 -- CAMBIAR EL NRO DE PROYECTO
  AND custom_values.value <> ''
--  AND custom_values.value not ilike '%,%'
--  AND custom_values.value not ilike '%+%'
--  AND custom_values.value not ilike '%m%'
--  AND custom_values.value not ilike '%:%'

*/
