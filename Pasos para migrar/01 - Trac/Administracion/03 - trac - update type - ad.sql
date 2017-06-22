﻿select * from enum WHERE type = 'ticket_type'
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

--UPDATE enum  SET name = 'Mejora' WHERE type = 'ticket_type' and name = 'ANALISIS / IMPLEMENTACION'; hay que borrarlo
UPDATE ticket  SET type= 'Mejora' WHERE type = 'ANALISIS / IMPLEMENTACION';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'ANALISIS / IMPLEMENTACION';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'ANALISIS / IMPLEMENTACION';

/*
-- Diguita -- 
UPDATE enum  SET name = 'Nuevo' WHERE type = 'ticket_type' and name = 'Operacion Nueva';
UPDATE ticket  SET type= 'Nuevo' WHERE type = 'Operacion Nueva';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'type' and oldvalue= 'Operacion Nueva';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'type' and newvalue= 'Operacion Nueva';


UPDATE ticket  SET type= 'Nuevo' WHERE type = 'Libreria';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'type' and oldvalue= 'Libreria';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'type' and newvalue= 'Libreria';


UPDATE ticket  SET type= 'Nuevo' WHERE type = 'Modulo';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'type' and oldvalue= 'Modulo';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'type' and newvalue= 'Modulo';

UPDATE enum  SET name = 'Bug' WHERE type = 'ticket_type' and name = 'Correcion Bug';
UPDATE ticket  SET type = 'Bug' WHERE type = 'Correcion Bug';
UPDATE ticket_change SET oldvalue= 'Bug' WHERE field = 'type' and oldvalue= 'Correcion Bug';
UPDATE ticket_change SET newvalue= 'Bug' WHERE field = 'type' and newvalue= 'Correcion Bug';

UPDATE enum  SET name = 'Bug' WHERE type = 'ticket_type' and name = 'defect'; -- EN ESTA TABLA HAY UN CONSTRAINT 
UPDATE ticket  SET type= 'Bug' WHERE type = 'defect';
UPDATE ticket_change SET oldvalue= 'Bug' WHERE field = 'type' and oldvalue= 'defect';
UPDATE ticket_change SET newvalue= 'Bug' WHERE field = 'type' and newvalue= 'defect';




UPDATE ticket  SET type= 'Mejora' WHERE type = 'Optimizacion';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Optimizacion';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Optimizacion';

--UPDATE enum  SET name = 'Nuevo' WHERE type = 'ticket_type' and name = 'Libreria';
--UPDATE enum  SET name = 'Nuevo' WHERE type = 'ticket_type' and name = 'Modulo';
-- UPDATE enum  SET name = 'Mejora' WHERE type = 'ticket_type' and name = 'Optimizacion'; -- EN ESTA TABLA HAY UN CONSTRAINT ¿no se la corre?
*/



