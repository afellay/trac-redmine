﻿

UPDATE issues 
SET done_ratio =  100
WHERE 
 status_id IN (5)
 AND issues.project_id = 38 
 --AND done_ratio <> 0; -- Nro de proyecto 

 UPDATE issues 
SET done_ratio =  30
WHERE 
 status_id IN (15)
 AND issues.project_id = 38 
 --AND done_ratio <> 0; -- Nro de proyecto 



 
	 	  