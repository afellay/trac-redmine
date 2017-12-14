Select * from enum where type = 'severity';
Select distinct severity from ticket;
/*
UPDATE enum  SET name = 'Imprescindible' WHERE type = 'severity' and name = '1-Imprescindible';
UPDATE enum  SET name = 'Necesario' WHERE type = 'severity' and name = '2-Necesario';
UPDATE enum  SET name = 'Deseable' WHERE type = 'severity' and name = '3-Deseable';
UPDATE enum  SET name = 'Consulta' WHERE type = 'severity' and name = '4-Consulta';
UPDATE enum  SET name = 'Urgente' WHERE type = 'severity' and name = '5-Urgente';
UPDATE enum  SET name = '' WHERE type = 'severity' and name = '----';



UPDATE ticket  SET severity = 'Imprescindible' WHERE severity = '1-Imprescindible';
UPDATE ticket  SET severity = 'Necesario' WHERE severity = '2-Necesario';
UPDATE ticket  SET severity = 'Deseable' WHERE severity = '3-Deseable';
UPDATE ticket  SET severity = 'Consulta' WHERE severity = '4-Consulta';
UPDATE ticket  SET severity = 'Urgente' WHERE severity = '5-Urgente';
UPDATE ticket  SET severity = '' WHERE severity = '----';

*/