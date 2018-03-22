

UPDATE issues 
SET done_ratio =  100
WHERE 
 status_id IN (5,11,13,16,17,19,21,22)
 AND issues.project_id = 35 -- Nro de proyecto 


 
	 	  