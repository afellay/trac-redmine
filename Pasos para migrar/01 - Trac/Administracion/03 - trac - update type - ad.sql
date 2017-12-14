select * from enum WHERE type = 'ticket_type';
select distinct TYPE from ticket;

UPDATE enum  SET name = 'Mejora' WHERE type = 'ticket_type' and name = 'mejora';
UPDATE ticket  SET type= 'Mejora' WHERE type = 'mejora';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'mejora';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'mejora';

UPDATE enum  SET name = 'Bug' WHERE type = 'ticket_type' and name = 'bug';
UPDATE ticket  SET type= 'Bug' WHERE type = 'bug';
UPDATE ticket_change SET oldvalue= 'Bug' WHERE field = 'type' and oldvalue= 'bug';
UPDATE ticket_change SET newvalue= 'Bug' WHERE field = 'type' and newvalue= 'bug';

UPDATE enum  SET name = 'Nuevo' WHERE type = 'ticket_type' and name = 'operacion';
UPDATE ticket  SET type= 'Nuevo' WHERE type = 'operacion';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'type' and oldvalue= 'operacion';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'type' and newvalue= 'operacion';

DELETE FROM enum  WHERE type = 'ticket_type' and name = 'ANALISIS / IMPLEMENTACION'; -- hay que borrarlo
UPDATE ticket  SET type= 'Mejora' WHERE type = 'ANALISIS / IMPLEMENTACION';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'ANALISIS / IMPLEMENTACION';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'ANALISIS / IMPLEMENTACION';

DELETE FROM enum  WHERE type = 'ticket_type' and name = 'ANALISIS'; -- hay que borrarlo
UPDATE ticket  SET type= 'Mejora' WHERE type = 'ANALISIS';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'ANALISIS';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'ANALISIS';


