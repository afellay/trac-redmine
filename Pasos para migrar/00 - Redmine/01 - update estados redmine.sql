-- Por unica vez en la base de produccion antes de la migracion

 UPDATE issue_statuses SET name = 'Listo Para Analisis' WHERE name = 'Lista para ANALIZAR';
 UPDATE issue_statuses SET name = 'Listo Para Desarrollo' WHERE name = 'Lista para DESARROLLAR';
 UPDATE issue_statuses SET name = 'Listo Para Testeo' WHERE name = 'Lista para TESTEAR';
 UPDATE issue_statuses SET name = 'Listo Para Documentacion' WHERE name = 'Lista para DOCUMENTAR';

 UPDATE issue_statuses SET name = 'En Desarrollo' WHERE name = 'En DESARROLLO (►)';
 UPDATE issue_statuses SET name = 'En Documentacion' WHERE name = 'En DOCUMENTACIÓN (✍)';
 UPDATE issue_statuses SET name = 'En Testeo' WHERE name = 'En TESTEO (✔)'; 
 UPDATE issue_statuses SET name = 'En Analisis' WHERE name = 'En ANÁLISIS (∮)';
 UPDATE issue_statuses SET name = 'En Revision De Codigo' WHERE name = 'En REVISIÓN DE CÓDIGO (⌨)';

 UPDATE issue_statuses SET name = 'Cerrado' WHERE name = 'ANULADA (X)';
 UPDATE issue_statuses SET name = 'Cerrado' WHERE name = 'CERRADA (■)';
 UPDATE issue_statuses SET name = 'Listo Para Cerrar' WHERE name = 'Lista para CERRAR'; 
 UPDATE issue_statuses SET name = 'Listo Para Revisar Codigo' WHERE name = 'Lista para REVISAR CÓDIGO'; 
 UPDATE issue_statuses SET name = 'Nuevo' WHERE name = 'NUEVA (⌂)';
-- 
 UPDATE issue_statuses SET name = 'Cerrado' WHERE name = 'closed';
 UPDATE issue_statuses SET name = 'Nuevo' WHERE name = 'new';

/*
-- CONSULTAR LOS ESTADOS QUE NO SE UTILIZAN EN EL REDMINE
SELECT 
  distinct issue_statuses.name
FROM 
  public.issue_statuses, 
  public.issues 
  ,public.projects
WHERE 
  issue_statuses.id = issues.status_id 
  AND issues.project_id = projects.id
  --and issue_statuses.name = 'Feedback'
  order by issue_statuses.name asc;
*/
