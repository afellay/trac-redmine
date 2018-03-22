select distinct oldvalue, newvalue From ticket_change WHERE field = 'estado'
select distinct status from ticket;

/*
UPDATE ticket SET status= 'Cerrado' WHERE status= 'closed';
UPDATE ticket SET status= 'Nuevo' WHERE status= 'new';
UPDATE ticket SET status= 'Cerrado' WHERE id = 106;


UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'assigned';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'assigned';

UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'reopened';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'new';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'new';



UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'estado' and oldvalue= 'assigned';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'estado' and newvalue= 'assigned';

UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'estado' and oldvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'estado' and newvalue= 'reopened';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'estado' and oldvalue= 'new';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'estado' and newvalue= 'new';


UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'estado' and oldvalue= 'closed';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'estado' and newvalue= 'closed';

UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'status' and oldvalue = '';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'status' and newvalue = '';

UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'estado' and oldvalue = '';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'estado' and newvalue = '';

UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'estado' and oldvalue is null;
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'estado' and newvalue is null;

UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'estado' and oldvalue = 'Listo para Testeo';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'estado' and newvalue = 'Listo para Testeo';

UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and oldvalue = 'Listo para Desarrollo';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'estado' and newvalue = 'Listo para Desarrollo';

UPDATE ticket_change SET oldvalue= 'Listo Para Analisis' WHERE field = 'estado' and oldvalue = 'Listo para Analisis';
UPDATE ticket_change SET newvalue= 'Listo Para Analisis' WHERE field = 'estado' and newvalue = 'Listo para Analisis';

UPDATE ticket_change SET oldvalue= 'Listo Para Documentacion' WHERE field = 'estado' and oldvalue = 'Listo para Documentacion';
UPDATE ticket_change SET newvalue= 'Listo Para Documentacion' WHERE field = 'estado' and newvalue = 'Listo para Documentacion';

UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'estado' and oldvalue = 'Cerrado por SIU';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'estado' and newvalue =  'Cerrado por SIU';

*/

select * from ticket where status = 'assigned';

 -- order by  status

 
/*


UPDATE ticket SET status= 'Cerrado' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Cerrado por SIU') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';




UPDATE ticket SET status= 'En Analisis' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'En Analisis') AS subquery
	WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Incluido en Version' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Incluido en Version') AS subquery
	WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Listo Para Analisis' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Listo para Analisis') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Listo Para Desarrollo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Listo para Desarrollo') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

UPDATE ticket SET status= 'Listo Para Testeo' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Listo para Testeo') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

 UPDATE ticket_change SET newvalue= subquery.status
  FROM (SELECT status, id
	FROM ticket) AS subquery
  WHERE field = 'status' and subquery.id = ticket;

UPDATE ticket SET status= 'Listo Para Documentacion' 
FROM (SELECT ticket
	FROM ticket_custom
	WHERE name = 'estado'
	AND value = 'Listo para Documentacion') AS subquery
WHERE id = subquery.ticket 
AND status <> 'Cerrado';

*/
select distinct oldvalue, newvalue From ticket_change WHERE field = 'estado'
SELECT distinct value FROM ticket_custom as tc,   ticket as t
  where tc.name = 'estado' AND t.id = tc.ticket
 and t.status <> 'Cerrado'

/*


UPDATE ticket_custom SET value= 'Cerrado' WHERE name = 'estado' and value= 'Cerrado por SIU';
UPDATE ticket_custom SET value= 'Cerrado' WHERE name = 'estado' and value= '';


*/