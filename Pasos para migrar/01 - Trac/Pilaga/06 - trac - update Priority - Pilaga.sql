Select * from enum where type = 'priority';
Select distinct priority from ticket;
/*
UPDATE enum  SET name = 'Alta' WHERE type = 'priority' and name = '1-Alta';
UPDATE enum  SET name = 'Media' WHERE type = 'priority' and name = '2-Media';
UPDATE enum  SET name = 'Baja' WHERE type = 'priority' and name = '3-Baja';
UPDATE enum  SET name = 'Critica' WHERE type = 'priority' and name = '0 - Urgente';
UPDATE enum  SET name = '' WHERE type = 'priority' and name = '----';



UPDATE ticket  SET priority = 'Alta' WHERE priority = '1-Alta';
UPDATE ticket  SET priority = 'Alta' WHERE priority = 'major';
UPDATE ticket  SET priority = 'Alta' WHERE priority = 'prioridad_1';
UPDATE ticket  SET priority = 'Media' WHERE priority = '2-Media';
UPDATE ticket  SET priority = 'Media' WHERE priority = 'prioridad_4';
UPDATE ticket  SET priority = 'Baja' WHERE priority = '3-Baja';
UPDATE ticket  SET priority = 'Baja' WHERE priority = 'prioridad_5';
UPDATE ticket  SET priority = 'Critica' WHERE priority = '0 - Urgente';
UPDATE ticket  SET priority = '' WHERE priority = '----';

*/