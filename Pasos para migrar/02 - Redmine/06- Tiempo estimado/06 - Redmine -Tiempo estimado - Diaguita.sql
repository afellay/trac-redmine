select value from custom_values 
	WHERE 
	  custom_field_id = 7 and value <> '';

/*
-- EN DIAGUITA custom_field_id = 7 ES EL CAMPO CUSTOM ESTIMADO

update custom_values 
	  set value = 0
	WHERE 
	  custom_field_id = 7
	  AND (value is null or value = '');


update custom_values 
	  set value = 0.30
	WHERE 
	  custom_field_id = 7
	  AND (value = '0,30' or value = '0:30');

update custom_values 
	  set value = 0.20
	WHERE 
	  custom_field_id = 7
	  AND (value = '0,20' or value = '0:20');  	 

update custom_values 
	  set value = 0
	WHERE 
	  custom_field_id = 7
	  AND (value ilike '%[%');	  

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
	  AND custom_fields.name = 'Estimado' ) AS subquery
WHERE 
 issues.id = subquery.customized_id
 AND issues.project_id = 18 -- Nro de proyecto 

 -- Borrar el custom de redmine si ya se migraron los datos de todos los proyectos 
 Borrar el compo Estimado

 */
	 	  