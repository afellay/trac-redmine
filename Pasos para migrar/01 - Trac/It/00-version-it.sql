-- NO LO NECESITARIAN

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

--INSERT INTO milestone (name) VALUES ('2.1.1');

/*



*/





