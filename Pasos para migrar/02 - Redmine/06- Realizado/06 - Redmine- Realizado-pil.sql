

UPDATE issues 
SET done_ratio =  30
WHERE 
 status_id IN (15)
 AND issues.project_id = 79
 AND donde_radio <> 0 -- Nro de proyecto 


 
	 	  