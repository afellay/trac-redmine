select * from enum WHERE type = 'ticket_type';
select distinct TYPE from ticket;

/* En el caso de IT queda todo distinto 
UPDATE enum  SET name = 'Mejora' WHERE type = 'ticket_type' and name = 'mejora';
UPDATE ticket  SET type= 'Mejora' WHERE type = 'mejora';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'mejora';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'mejora';
*/