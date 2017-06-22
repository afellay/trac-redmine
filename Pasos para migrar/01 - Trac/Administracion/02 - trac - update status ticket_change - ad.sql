﻿select distinct oldvalue, newvalue From ticket_change WHERE field = 'estado' ;
select * from ticket where status = 'assigned';
SELECT distinct value FROM ticket_custom as tc,   ticket as t
  where tc.name = 'estado' AND t.id = tc.ticket
  and t.status <> 'Cerrado'
 -- order by  status

 
/*


UPDATE ticket SET status= 'Cerrado' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Rechazado') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';


UPDATE ticket SET status= 'En Analisis' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'En analisis') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';




UPDATE ticket SET status= 'Nuevo' WHERE status= 'assigned';


UPDATE ticket SET status= 'Listo Para Testeo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Desarrollado') AS subquery
	WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Listo Para Desarrollo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Analizado') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Listo Para Desarrollo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Para desarrollar') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'En Testeo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'En testeo') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';
 UPDATE ticket_change SET newvalue= subquery.status
  FROM (SELECT status, id
	FROM ticket) AS subquery
  WHERE field = 'status' and subquery.id = ticket;

UPDATE ticket SET status= 'En Desarrollo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'En desarrollo') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';





*/

/*
UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and oldvalue= 'Analizado';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and newvalue= 'Analizado';

UPDATE ticket_change SET oldvalue= 'En Testeo' WHERE field = 'estado' and oldvalue= 'En testeo';
UPDATE ticket_change SET newvalue= 'En Testeo' WHERE field = 'estado' and newvalue= 'En testeo';
UPDATE ticket_change SET oldvalue= 'En Analisis' WHERE field = 'estado' and oldvalue= 'En analisis';
UPDATE ticket_change SET newvalue= 'En Analisis' WHERE field = 'estado' and newvalue= 'En analisis';
UPDATE ticket_change SET oldvalue= 'En Desarrollo' WHERE field = 'estado' and oldvalue= 'En desarrollo';
UPDATE ticket_change SET newvalue= 'En Desarrollo' WHERE field = 'estado' and newvalue= 'En desarrollo';
UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and oldvalue= 'Para desarrollar';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and newvalue= 'Para desarrollar';
UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'estado' and oldvalue= 'Desarrollado';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'estado' and newvalue= 'Desarrollado';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'estado' and oldvalue= 'Informacion requerida';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'estado' and newvalue= 'Informacion requerida';


UPDATE ticket_custom SET value= 'Listo Para Testeo' WHERE name = 'estado' and value= 'Desarrollado';
UPDATE ticket_custom SET value= 'Listo Para Desarrollo' WHERE name = 'estado' and value= 'Para desarrollar';
UPDATE ticket_custom SET value= 'En Desarrollo' WHERE name = 'estado' and value= 'En desarrollo';
UPDATE ticket_custom SET value= 'En Testeo' WHERE name = 'estado' and value= 'En testeo';
UPDATE ticket_custom SET value= 'Listo Para Desarrollo' WHERE name = 'estado' and value= 'En Analizado';
UPDATE ticket_custom SET value= 'En Analisis' WHERE name = 'estado' and value= 'En analisis';
UPDATE ticket_custom SET value= 'Nuevo' WHERE name = 'estado' and value= 'new';
UPDATE ticket_custom SET value= 'Nuevo' WHERE name = 'estado' and value= 'Informacion requerida';


*/