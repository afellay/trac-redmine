-- Por unica vez en la base de produccion antes de la migracion

 UPDATE issue_statuses SET name = 'ListoParaAnalisis' WHERE name = 'Lista para ANALIZAR';
 UPDATE issue_statuses SET name = 'ListoParaDesarrollo' WHERE name = 'Lista para DESARROLLAR';
 UPDATE issue_statuses SET name = 'ListoParaTesteo' WHERE name = 'Lista para TESTEAR';
 UPDATE issue_statuses SET name = 'ListoParaDocumentacion' WHERE name = 'Lista para DOCUMENTAR';

 UPDATE issue_statuses SET name = 'EnDesarrollo' WHERE name = 'En DESARROLLO (►)';
 UPDATE issue_statuses SET name = 'EnDocumentacion' WHERE name = 'En DOCUMENTACIÓN (✍)';
 UPDATE issue_statuses SET name = 'EnTesteo' WHERE name = 'En TESTEO (✔)'; 
 UPDATE issue_statuses SET name = 'EnAnalisis' WHERE name = 'En ANÁLISIS (∮)';
 UPDATE issue_statuses SET name = 'EnRevisionCodigo' WHERE name = 'En REVISIÓN DE CÓDIGO (⌨)';

/*
-- CONSULTAR LOS ESTADOS QUE NO SE UTILIZAN EN EL REDMINE
SELECT 
  distinct projects.name,issue_statuses.name
FROM 
  public.issue_statuses, 
  public.issues, 
  public.projects
WHERE 
  issue_statuses.id = issues.status_id AND
  issues.project_id = projects.id
  --and issue_statuses.name = 'Feedback'
  order by projects.name asc;
*/