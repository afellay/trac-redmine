-- Esto es para diaguita ??


-- SELECT id FROM issue_statuses WHERE name = 'Cerrado';

UPDATE issues 
SET status_id =  estado
FROM (
SELECT 
	  custom_values.value,
	  custom_values.customized_id,
	  (SELECT id FROM issue_statuses WHERE name = 'Invalido') as estado
	  
	FROM 
	  custom_fields, 
	  custom_values
	WHERE 
	  custom_values.custom_field_id = custom_fields.id 
	  AND custom_fields.name = 'Resolution' 
	  AND (custom_values.value = 'Invalido' or custom_values.value = 'invalid')
	  
	) AS subquery
WHERE 
  issues.id = subquery.customized_id
  AND issues.project_id = 103;

-- SELECT id FROM issue_statuses WHERE name = 'Duplicado';

UPDATE issues 
SET status_id =  estado
FROM (
SELECT 
	  custom_values.value,
	  custom_values.customized_id,
	  (SELECT id FROM issue_statuses WHERE name = 'Duplicado') as estado
	  
	FROM 
	  custom_fields, 
	  custom_values
	WHERE 
	  custom_values.custom_field_id = custom_fields.id 
	  AND custom_fields.name = 'Resolution' 
	  AND (custom_values.value = 'Duplicado' or custom_values.value = 'duplicate')
	  
	) AS subquery
WHERE 
  issues.id = subquery.customized_id
  AND issues.project_id = 103;



-- HAY QUE VER SI HAY MAS DE UN ESTADO Cerrado
