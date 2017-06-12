-- Ver el valor correspondiente de Tiempo en custom_field_id

/*SELECT distinct   custom_fields.name,   custom_values.value
FROM 
  public.custom_values, 
  public.custom_fields
WHERE 
  custom_fields.id = custom_values.custom_field_id AND
  custom_fields.name = 'Tiempo';

 */

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
 AND issues.project_id = 19 -- Nro de proyecto 
 

 -- Borrar el custom de redmine si ya se migraron los datos de todos los proyectos 

 
	 	  