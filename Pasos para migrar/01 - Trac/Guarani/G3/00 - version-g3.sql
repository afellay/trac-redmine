

-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;

INSERT INTO milestone (name) VALUES ('3.0.0');
INSERT INTO milestone (name) VALUES ('3.3.0');
INSERT INTO milestone (name) VALUES ('3.3.0 Preinsc');

 UPDATE version  SET name= '3.3.0 Preinsc'  WHERE name = '3.3.0 preinsc';
 UPDATE ticket	 SET version= '3.3.0 Preinsc' WHERE version = '3.3.0 preinsc';
  UPDATE ticket	 SET version= '' WHERE version = 'aleph';
  UPDATE ticket SET version= '' WHERE version = 'beth';
    UPDATE ticket	 SET version= '' WHERE version = '3.8.0 3w';
  UPDATE ticket SET version= '' WHERE version = '3.8.2 3w';





/*
﻿-- Versiones que no estan en milestone y que sino van a dar error
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;

-- Versiones que no estan en los ticket (se pueden borrar)

SELECT  distinct version
  FROM ticket
  where version not in (SELECT name
  FROM milestone) and version <> '';
  
-- Versiones que no estan en los ticket (se pueden borrar)
SELECT name, 'time', description
  FROM version
  where name not in (SELECT name
  FROM milestone) ;


*/








