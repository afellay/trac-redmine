﻿-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;

UPDATE version  SET name= '1.0.0'  WHERE name = '1.0';
UPDATE ticket	 SET version= '1.0.0' WHERE version = '1.0';
UPDATE version  SET name= '2.0.0'  WHERE name = '2.0';
UPDATE ticket	 SET version= '2.0.0' WHERE version = '2.0';

INSERT INTO milestone (name) VALUES ('1.0.0');  
INSERT INTO milestone (name) VALUES ('2.0.0');
INSERT INTO milestone (name) VALUES ('3.1.1');
INSERT INTO milestone (name) VALUES ('3.0.0');
INSERT INTO milestone (name) VALUES ('3.1.0');
INSERT INTO milestone (name) VALUES ('3.2.0');
INSERT INTO milestone (name) VALUES ('3.3.0');
INSERT INTO milestone (name) VALUES ('3.4.0');
INSERT INTO milestone (name) VALUES ('3.1.3');



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








