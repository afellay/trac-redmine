-- CIERRRA LAS VERSIONES (MILESTONE) QUE ESTABAN CERRADOS EN EL TRAC

UPDATE versions
   SET  status= 'closed'
 WHERE project_id = 41 and effective_date is not null;

-- PONER EL ID DE