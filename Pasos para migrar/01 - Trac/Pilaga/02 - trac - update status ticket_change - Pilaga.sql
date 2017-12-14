select distinct oldvalue, newvalue From ticket_change WHERE field = 'status';
select distinct status from ticket ;

/*
UPDATE ticket SET status= 'Cerrado' WHERE status= 'closed';
UPDATE ticket SET status= 'Nuevo' WHERE status= 'new';
UPDATE ticket SET status= 'En Documentacion' WHERE status= 'EnDocumentacion';
UPDATE ticket SET status= 'Listo Para Testeo' WHERE status= 'ListoParaTesteo';
UPDATE ticket SET status= 'Listo Para Desarrollo' WHERE status= 'ListoParaDesarrollo';
UPDATE ticket SET status= 'Listo Para Analisis' WHERE status= 'ListoAnalisis';
UPDATE ticket SET status= 'Listo Para Analisis' WHERE status= 'ListoParaAnalisis';
UPDATE ticket SET status= 'Listo Para Analisis' WHERE status= 'PendienteRespuesta';
UPDATE ticket SET status= 'En Analisis' WHERE status= 'EnAnalisis';
UPDATE ticket SET status= 'En Testeo' WHERE status= 'EnTesteo';
UPDATE ticket SET status= 'En Desarrollo' WHERE status= 'EnDesarrollo';
UPDATE ticket SET status= 'Listo Para Documentacion' WHERE status= 'ListoParaDocumentacion';
UPDATE ticket SET status= 'Listo Para Documentacion' WHERE status= 'ListoParaDocumentar';
UPDATE ticket SET status= 'Cerrado' WHERE status= 'Rechazado';
UPDATE ticket SET status= 'Cerrado' WHERE status= 'Respondido';
-- UPDATE ticket SET status= 'Incluido En Version' WHERE status= 'IncluidoEnVersion';
-- UPDATE ticket SET status= 'Listo Para Versionar' WHERE status= 'ListoParaVersionar';
UPDATE ticket SET status= 'Listo Para Documentacion' WHERE status= 'ListoParaVersionar';
UPDATE ticket SET status= 'Cerrado' WHERE status= 'IncluidoEnVersion';


UPDATE ticket_change SET oldvalue= 'En Analisis' WHERE field = 'status' and oldvalue= 'EnAn�lisis';
UPDATE ticket_change SET newvalue= 'En Analisis' WHERE field = 'status' and newvalue= 'EnAn�lisis';
UPDATE ticket_change SET oldvalue= 'En Analisis' WHERE field = 'status' and oldvalue= 'EnAnalisis';
UPDATE ticket_change SET newvalue= 'En Analisis' WHERE field = 'status' and newvalue= 'EnAnalisis';


UPDATE ticket_change SET oldvalue= 'Listo Para Analisis' WHERE field = 'status' and oldvalue= 'ListoAnalisis';
UPDATE ticket_change SET newvalue= 'Listo Para Analisis' WHERE field = 'status' and newvalue= 'ListoAnalisis';
UPDATE ticket_change SET oldvalue= 'Listo Para Analisis' WHERE field = 'status' and oldvalue= 'ListoParaAnalisis';
UPDATE ticket_change SET newvalue= 'Listo Para Analisis' WHERE field = 'status' and newvalue= 'ListoParaAnalisis';

UPDATE ticket_change SET oldvalue= 'En Integracion' WHERE field = 'status' and oldvalue= 'EnIntegracion';
UPDATE ticket_change SET newvalue= 'En Integracion' WHERE field = 'status' and newvalue= 'EnIntegracion';

UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'status' and oldvalue= 'ListoParaDesarrollar';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'status' and newvalue= 'ListoParaDesarrollar';
UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'status' and oldvalue= 'ListoParaDesarrollo';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'status' and newvalue= 'ListoParaDesarrollo';
UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'status' and oldvalue= 'ParaDesarrollar';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'status' and newvalue= 'ParaDesarrollar';

UPDATE ticket_change SET oldvalue= 'Listo Para Desarrollo' WHERE field = 'status' and oldvalue= 'Analizado';
UPDATE ticket_change SET newvalue= 'Listo Para Desarrollo' WHERE field = 'status' and newvalue= 'Analizado';

UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'status' and oldvalue= 'Desarrollado';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'status' and newvalue= 'Desarrollado';
UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'status' and oldvalue= 'ListoParaTestear';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'status' and newvalue= 'ListoParaTestear';
UPDATE ticket_change SET oldvalue= 'Listo Para Testeo' WHERE field = 'status' and oldvalue= 'ListoParaTesteo';
UPDATE ticket_change SET newvalue= 'Listo Para Testeo' WHERE field = 'status' and newvalue= 'ListoParaTesteo';

UPDATE ticket_change SET oldvalue= 'Listo Para Documentacion' WHERE field = 'status' and oldvalue= 'ListoParaDocumentar';
UPDATE ticket_change SET newvalue= 'Listo Para Documentacion' WHERE field = 'status' and newvalue= 'ListoParaDocumentar';
UPDATE ticket_change SET oldvalue= 'Listo Para Documentacion' WHERE field = 'status' and oldvalue= 'Testeado';
UPDATE ticket_change SET newvalue= 'Listo Para Documentacion' WHERE field = 'status' and newvalue= 'Testeado';
UPDATE ticket_change SET oldvalue= 'Listo Para Documentacion' WHERE field = 'status' and oldvalue= 'ListoParaDocumentacion';
UPDATE ticket_change SET newvalue= 'Listo Para Documentacion' WHERE field = 'status' and newvalue= 'ListoParaDocumentacion';

UPDATE ticket_change SET oldvalue= 'En Documentacion' WHERE field = 'status' and oldvalue= 'Documentado';
UPDATE ticket_change SET newvalue= 'En Documentacion' WHERE field = 'status' and newvalue= 'Documentado';
UPDATE ticket_change SET oldvalue= 'En Documentacion' WHERE field = 'status' and oldvalue= 'EnDocumentacion';
UPDATE ticket_change SET newvalue= 'En Documentacion' WHERE field = 'status' and newvalue= 'EnDocumentacion';

UPDATE ticket_change SET oldvalue= 'En Desarrollo' WHERE field = 'status' and oldvalue= 'EnDesarrollo';
UPDATE ticket_change SET newvalue= 'En Desarrollo' WHERE field = 'status' and newvalue= 'EnDesarrollo';

UPDATE ticket_change SET oldvalue= 'En Testeo' WHERE field = 'status' and oldvalue= 'EnTesteo';
UPDATE ticket_change SET newvalue= 'En Testeo' WHERE field = 'status' and newvalue= 'EnTesteo';

UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'reopened';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'new';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'new';
UPDATE ticket_change SET oldvalue= 'Nuevo' WHERE field = 'status' and oldvalue= 'RequiereInformacion';
UPDATE ticket_change SET newvalue= 'Nuevo' WHERE field = 'status' and newvalue= 'RequiereInformacion';

-- UPDATE ticket_change  SET oldvalue= 'Incluido En Version' WHERE field = 'status' and oldvalue= 'IncluidoEnVersion';
-- UPDATE ticket_change  SET newvalue= 'Incluido En Version' WHERE field = 'status' and newvalue= 'IncluidoEnVersion';

-- UPDATE ticket_change  SET oldvalue= 'Listo Para Versionar' WHERE field = 'status' and oldvalue= 'ListoParaVersionar';
-- UPDATE ticket_change  SET newvalue= 'Listo Para Versionar' WHERE field = 'status' and newvalue= 'ListoParaVersionar';

UPDATE ticket_change  SET oldvalue= 'Cerrado' WHERE field = 'status' and oldvalue= 'IncluidoEnVersion';
UPDATE ticket_change  SET newvalue= 'Cerrado' WHERE field = 'status' and newvalue= 'IncluidoEnVersion';

UPDATE ticket_change  SET oldvalue= 'Listo Para Documentacion' WHERE field = 'status' and oldvalue= 'ListoParaVersionar';
UPDATE ticket_change  SET newvalue= 'Listo Para Documentacion' WHERE field = 'status' and newvalue= 'ListoParaVersionar';


UPDATE ticket_change SET oldvalue= 'Listo Para Analisis' WHERE field = 'status' and oldvalue= 'PendienteAprobacion';
UPDATE ticket_change SET newvalue= 'Listo Para Analisis' WHERE field = 'status' and newvalue= 'PendienteAprobacion';

UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'status' and oldvalue= 'closed';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'status' and newvalue= 'closed';
UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'status' and oldvalue= 'Rechazado';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'status' and newvalue= 'Rechazado';
UPDATE ticket_change SET oldvalue= 'Cerrado' WHERE field = 'status' and oldvalue= 'Respondido';
UPDATE ticket_change SET newvalue= 'Cerrado' WHERE field = 'status' and newvalue= 'Respondido';

*/