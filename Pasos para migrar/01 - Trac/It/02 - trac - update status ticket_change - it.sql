
select status from ticket where status = 'assigned';
SELECT distinct value FROM ticket_custom as tc,   ticket as t
  where tc.name = 'estado' AND t.id = tc.ticket
  and t.status <> 'Cerrado'
 -- order by  status

Select distinct oldvalue, newvalue From ticket_change WHERE field = 'status';
select distinct oldvalue, newvalue From ticket_change WHERE field = 'estado' ;

select distinct status from ticket ;




/*

UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'accepted';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'accepted';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'assigned';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'assigned';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'new';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'new';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'status' and newvalue= 'closed';
UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'status' and oldvalue= 'closed';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'estado' and newvalue= 'Resuelto';
UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'estado' and oldvalue= 'Resuelto';

UPDATE ticket_change SET oldvalue= 'En Analisis' WHERE field = 'estado' and oldvalue= 'En analisis';
UPDATE ticket_change SET newvalue= 'En Analisis' WHERE field = 'estado' and newvalue= 'En analisis';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'estado' and oldvalue= 'Reportado';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'estado' and newvalue= 'Reportado';
UPDATE ticket SET status= 'Cerrado' WHERE status= 'closed';
UPDATE ticket SET status= 'Nuevo' WHERE status= 'new';
/*

