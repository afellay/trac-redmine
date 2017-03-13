SELECT *
  FROM issue_statuses
  WHERE name NOT IN (SELECT 
  distinct issue_statuses.name
FROM 
  public.issue_statuses, 
  public.issues 
  ,public.projects
WHERE 
  issue_statuses.id = issues.status_id 
  AND issues.project_id = projects.id
  );
/*
DELETE FROM issue_statuses
  WHERE name NOT IN (
	SELECT 
	  distinct issue_statuses.name
	FROM 
	  public.issue_statuses, 
	  public.issues 
	  ,public.projects
	WHERE 
	  issue_statuses.id = issues.status_id 
	  AND issues.project_id = projects.id
  );


*/