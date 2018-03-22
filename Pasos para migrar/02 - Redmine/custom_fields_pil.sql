UPDATE custom_fields
   SET field_format= 'text'
 WHERE name='Nota an' and field_format= 'string';

 UPDATE custom_fields
   SET field_format= 'text'
 WHERE name='Nota usuario' and field_format= 'string';

  UPDATE custom_fields
   SET field_format= 'link'
 WHERE name='Revision branch' and field_format= 'string';

  UPDATE custom_fields
   SET field_format= 'link'
 WHERE name='Revision detec' and field_format= 'string';

  UPDATE custom_fields
   SET field_format= 'link'
 WHERE name='Revision testeo branch' and field_format= 'string';

  UPDATE custom_fields
   SET field_format= 'link'
 WHERE name='Revision testeo' and field_format= 'string';
