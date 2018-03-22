﻿-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;


  
INSERT INTO milestone (name) VALUES ('2.1.1');
INSERT INTO milestone (name) VALUES ('2.1.0');
INSERT INTO milestone (name) VALUES ('2.2.0');
INSERT INTO milestone (name) VALUES ('2.3.0');
INSERT INTO milestone (name) VALUES ('2.4.0');
INSERT INTO milestone (name) VALUES ('2.5.0');
INSERT INTO milestone (name) VALUES ('Sin versión');
INSERT INTO milestone (name) VALUES ('Próxima Versión');

 UPDATE version SET name= 'Sin versión' WHERE name = 'Sin versión definida';
 UPDATE ticket  SET version= 'Sin versión'WHERE version = 'Sin versión definida';
 UPDATE ticket  SET milestone= 'Sin versión'WHERE milestone = 'Sin versión definida';

 UPDATE version SET name= 'Próxima Versión' WHERE name = 'Próxima Versión SIU-Tehuelche';
 UPDATE ticket  SET version= 'Próxima Versión' WHERE version = 'Próxima Versión SIU-Tehuelche';
 UPDATE ticket  SET milestone= 'Próxima Versión' WHERE milestone = 'Próxima Versión SIU-Tehuelche';

/*
﻿-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;

-- Versiones que no estan en los ticket (se pueden borrar)

SELECT distinct version
  FROM ticket
  where milestone not in (SELECT name
  FROM milestone) ;
  
-- Versiones que no estan en los ticket (se pueden borrar)
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;


*/








