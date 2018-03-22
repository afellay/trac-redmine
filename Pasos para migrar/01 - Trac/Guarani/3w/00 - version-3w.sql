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


INSERT INTO milestone (name) VALUES ('1.0.0');
UPDATE version  SET name= '1.0.0'  WHERE name = '1.0';
UPDATE ticket	 SET version= '1.0.0' WHERE version = '1.0';

INSERT INTO milestone (name) VALUES ('2.0.0');
UPDATE version  SET name= '2.0.0'  WHERE name = '2.0';
UPDATE ticket	 SET version= '2.0.0' WHERE version = '2.0';

INSERT INTO milestone (name) VALUES ('G3W3');
INSERT INTO milestone (name) VALUES ('G3W2');
INSERT INTO milestone (name) VALUES ('PreInsc v1');
INSERT INTO milestone (name) VALUES ('3.4.0');


*/









