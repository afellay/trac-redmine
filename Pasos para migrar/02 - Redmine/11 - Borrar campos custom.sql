-- Revision inte
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision inte');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision inte');


 DELETE FROM custom_fields
 WHERE name = 'Revision inte';

-- Perfiles sol
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Perfiles sol');

  DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Perfiles sol');

 DELETE FROM custom_fields
 WHERE name = 'Perfiles sol';

 -- Status
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Status');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Status');

 DELETE FROM custom_fields
 WHERE name = 'Status';

  -- Estado
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Estado');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Estado');

 DELETE FROM custom_fields
 WHERE name = 'Estado';

-- Revision test
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision test');

  DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision test');

 DELETE FROM custom_fields
 WHERE name = 'Revision test';

  -- Univ solicitante
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Univ solicitante');

  DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Univ solicitante');

 DELETE FROM custom_fields
 WHERE name = 'Univ solicitante';

 
   -- Nota obj
DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota obj');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota obj');

 DELETE FROM custom_fields
 WHERE name = 'Nota obj';
 
 --Gds solicitudes
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Gds solicitudes');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Gds solicitudes');

 DELETE FROM custom_fields
 WHERE name = 'Gds solicitudes';
 
 --Tiempo r
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Tiempo r');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Tiempo r');

 DELETE FROM custom_fields
 WHERE name = 'Tiempo r';
 
 --Nota int
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota int');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota int');

 DELETE FROM custom_fields
 WHERE name = 'Nota int';
 
 --Revision desa
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision desa');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Revision desa');

 DELETE FROM custom_fields
 WHERE name = 'Revision desa';

 --Version sol
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Version sol');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Version sol');

 DELETE FROM custom_fields
 WHERE name = 'Version sol';
 
 --Nota testeo
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota testeo');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Nota testeo');

 DELETE FROM custom_fields
 WHERE name = 'Nota testeo';
 

/*
 --Version Sol
 DELETE FROM custom_fields_projects
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Version Sol');

 DELETE FROM custom_fields_trackers
 WHERE custom_field_id = (Select id FROM custom_fields
 WHERE name = 'Version Sol');

 DELETE FROM custom_fields
 WHERE name = 'Version Sol';*/