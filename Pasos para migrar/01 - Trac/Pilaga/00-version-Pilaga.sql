
﻿-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;

-- mileston que no estan en los ticket (se pueden borrar)

SELECT distinct milestone
  FROM ticket
  where milestone not in (SELECT name
  FROM milestone) ;

  SELECT distinct version
  FROM ticket
  where version not in (SELECT name
  FROM milestone);


INSERT INTO milestone (name) VALUES ('1.12.4');
INSERT INTO milestone (name) VALUES ('1.13.0');
INSERT INTO milestone (name) VALUES ('1.12.5');  
INSERT INTO milestone (name) VALUES ('1.14.0');
INSERT INTO milestone (name) VALUES ('1.12.3');
INSERT INTO milestone (name) VALUES ('2.0.0');
INSERT INTO milestone (name) VALUES ('1.15.5');  
INSERT INTO milestone (name) VALUES ('1.15.1');
INSERT INTO milestone (name) VALUES ('0.1.0');
INSERT INTO milestone (name) VALUES ('0.2.1');
INSERT INTO milestone (name) VALUES ('0.2.2');
INSERT INTO milestone (name) VALUES ('1.7.2');
INSERT INTO milestone (name) VALUES ('1.12.1');
INSERT INTO milestone (name) VALUES ('1.14.1');
 INSERT INTO milestone (name) VALUES ('Pilaga');
 INSERT INTO milestone (name) VALUES ('uba_diciembre');
 INSERT INTO milestone (name) VALUES ('uba_marzo');
UPDATE ticket SET milestone= '' WHERE milestone = '----';
UPDATE ticket SET version= '' WHERE version = '----';
UPDATE ticket SET milestone= '' WHERE milestone = 'sin-fecha';





/*
UPDATE version  SET name= '0.1.0'  WHERE name = '0.1';
UPDATE ticket	 SET version= '0.1.0' WHERE version = '0.1';
 UPDATE ticket	 SET version= '' WHERE version = 's/vers Neg';

*/





