

-- CERRADA (■) a Closed. Despues se debe borrar
 UPDATE issues SET status_id = 5 WHERE status_id = 8;

-- NUEVA (⌂) a New. Despues se debe borrar
 UPDATE issues SET status_id = 1 WHERE status_id = 7;


-- ANULADA (X) a Closed. Despues se debe borrar
 UPDATE issues SET status_id = 5 WHERE status_id = 20;



UPDATE journal_details
   SET old_value= '5'
 WHERE prop_key= 'status_id' and (old_value='8' or old_value='20') ;

 UPDATE journal_details
   SET value= '5'
 WHERE prop_key= 'status_id' and (value='8' or value='20') ;

 UPDATE journal_details
   SET old_value= '1'
 WHERE prop_key= 'status_id' and old_value='7' ;

 UPDATE journal_details
   SET value= '1'
 WHERE prop_key= 'status_id' and value='7'  ;


/*
-- Se borran los estados que no se utilizan
 DELETE FROM issue_statuses WHERE id = 7;
 DELETE FROM issue_statuses WHERE id = 8;
 DELETE FROM issue_statuses WHERE id = 20;
 DELETE FROM issue_statuses WHERE id = 2;
 DELETE FROM issue_statuses WHERE id = 3;
 DELETE FROM issue_statuses WHERE id = 4;
 DELETE FROM issue_statuses WHERE id = 6;
*/

