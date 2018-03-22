-- Ver el valor correspondiente de Tiempo en custom_field_id

SELECT distinct   custom_fields.name,   custom_values.value
FROM 
  public.custom_values, 
  public.custom_fields
WHERE 
  custom_fields.id = custom_values.custom_field_id AND
  custom_fields.name = 'Tiempo';

 SELECT 
	  custom_values.value::double precision as hora_estimada,
	  custom_values.customized_id
	FROM 
	  custom_fields, 
	  custom_values
	WHERE 
	  custom_values.custom_field_id = custom_fields.id 
	  AND custom_fields.name = 'Tiempo'
	   AND custom_values.value <> '' 

 
 /*
 -- EN DIAGUITA custom_field_id = 7 ES EL CAMPO CUSTOM ESTIMADO


update custom_values 
	  set value = 0.5
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '30 minutos' or value = '1/2 hora');


update custom_values 
	  set value = 1
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '1 hora' or value = '1 hr.');

update custom_values 
	  set value = 4
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '4 horas');

update custom_values 
	  set value = 2
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND ( value = '2 horas' or value = '2 hs');

update custom_values 
	  set value = 5
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '5 horas' or value = '5 hs.');


update custom_values 
	  set value = 6
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '6 horas' or value = '6 hs.');



update custom_values 
	  set value = 88.5
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '88,5');





update custom_values 
	  set value = 3
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '3 horas');


update custom_values 
	  set value = 8
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '8 horas' or value = '8 hs.');

update custom_values 
	  set value = 10
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '10 horas' or value = '10 hs.');



update custom_values 
	  set value = 21
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '3 días');

update custom_values 
	  set value = 14
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND ( value = '2 días');

update custom_values 
	  set value = 7
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value is null or value = '1 día');

update custom_values 
	  set value = 35
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '1 semana');


update custom_values 
	  set value = 140
	WHERE 
	  custom_field_id = (Select id
		FROM 
		custom_fields
		WHERE 		 custom_fields.name = 'Tiempo')
	  AND (value = '1 mes');






-- Copia datos del custom la dato tiempo estimado de redmine




-- Copia datos del custom la dato tiempo estimado de redmine

UPDATE issues 
SET estimated_hours =  hora_estimada
FROM (SELECT 
	  custom_values.value::double precision as hora_estimada,
	  custom_values.customized_id
	FROM 
	  custom_fields, 
	  custom_values
	WHERE 
	  custom_values.custom_field_id = custom_fields.id 
	  AND custom_fields.name = 'Tiempo'
	   AND custom_values.value <> '' ) AS subquery
WHERE 
 issues.id = subquery.customized_id
 AND issues.project_id = 52 -- Nro de proyecto 

 
*/
 -- Borrar el custom de redmine si ya se migraron los datos de todos los proyectos 
