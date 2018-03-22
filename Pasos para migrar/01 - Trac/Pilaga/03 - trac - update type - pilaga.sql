select * from enum WHERE type = 'ticket_type';
select distinct TYPE from ticket where type not in (select name from enum WHERE type = 'ticket_type');



UPDATE enum  SET name = 'Bug' WHERE type = 'ticket_type' and name = 'Bug del sistema';
UPDATE ticket  SET type= 'Bug' WHERE type = 'Bug del sistema';
UPDATE ticket_change SET oldvalue= 'Bug' WHERE field = 'type' and oldvalue= 'Bug del sistema';
UPDATE ticket_change SET newvalue= 'Bug' WHERE field = 'type' and newvalue= 'Bug del sistema';

UPDATE enum  SET name = 'Nuevo' WHERE type = 'ticket_type' and name = 'Nueva funcionalidad';
UPDATE ticket  SET type= 'Nuevo' WHERE type = 'Nueva funcionalidad';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'type' and oldvalue= 'Nueva funcionalidad';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'type' and newvalue= 'Nueva funcionalidad';


UPDATE ticket  SET type= 'Mejora' WHERE type = 'Control para evitar errores';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Control para evitar errores';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Control para evitar errores';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Control para evitar errores'; 

UPDATE ticket  SET type= 'Mejora' WHERE type = 'Sugerencia';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Sugerencia';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Sugerencia';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Sugerencia'; 


UPDATE ticket  SET type= 'Mejora' WHERE type = 'Optimización de código';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Optimización de código';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Optimización de código';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Optimización de código'; 


UPDATE ticket  SET type= 'Mejora' WHERE type = 'Consideración general';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Consideración general';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Consideración general';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Consideración general'; 

UPDATE ticket  SET type= 'Mejora' WHERE type = 'Script para incorporar en una versión';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Script para incorporar en una versión';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Script para incorporar en una versión';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Script para incorporar en una versión'; 

UPDATE ticket  SET type= 'Mejora' WHERE type = 'Pedidos de Auditoria (SIGEN)';
UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Pedidos de Auditoria (SIGEN)';
UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Pedidos de Auditoria (SIGEN)';
DELETE FROM enum WHERE type = 'ticket_type' and name = 'Pedidos de Auditoria (SIGEN)'; 


UPDATE ticket  SET type= 'tarea' WHERE type = 'task';
--UPDATE ticket_change SET oldvalue= 'Mejora' WHERE field = 'type' and oldvalue= 'Optimización de código';
--UPDATE ticket_change SET newvalue= 'Mejora' WHERE field = 'type' and newvalue= 'Optimización de código';
DELETE FROM enum WHERE type = 'tarea' and name = 'task'; 

