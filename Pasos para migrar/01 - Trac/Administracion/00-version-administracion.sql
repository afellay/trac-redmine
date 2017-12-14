-- Versiones que no estan en milestone y que sino van a dar error
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
  FROM version) ;
/*
INSERT INTO milestone (name) VALUES ('2.1.1');
INSERT INTO milestone (name) VALUES ('2.1.0');
INSERT INTO milestone (name) VALUES ('3.0.1');  
INSERT INTO milestone (name) VALUES ('2.2.4');
INSERT INTO milestone (name) VALUES ('2.2.3');
INSERT INTO milestone (name) VALUES ('2.2.0');
INSERT INTO milestone (name) VALUES ('2.0.0');
INSERT INTO milestone (name) VALUES ('2.2.6');
INSERT INTO milestone (name) VALUES ('2.2.7');
INSERT INTO milestone (name) VALUES ('2.2.9');
INSERT INTO milestone (name) VALUES ('1.0.0');

INSERT INTO milestone (name) VALUES ('0.1.0');
UPDATE version  SET name= '0.1.0'  WHERE name = '0.1';
UPDATE ticket	 SET version= '0.1.0' WHERE version = '0.1';
UPDATE ticket	 SET version= '' WHERE version = 's/vers Neg';





*/





