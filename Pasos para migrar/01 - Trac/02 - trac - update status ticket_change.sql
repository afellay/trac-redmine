select distinct oldvalue, newvalue From ticket_change WHERE field = 'status'


/*UPDATE ticket_change SET oldvalue= 'EnAnalisis' WHERE field = 'status' and oldvalue= 'EnAn�lisis';
UPDATE ticket_change SET newvalue= 'EnAnalisis' WHERE field = 'status' and newvalue= 'EnAn�lisis';

UPDATE ticket_change SET oldvalue= 'ListoParaAnalisis' WHERE field = 'status' and oldvalue= 'ListoAnalisis';
UPDATE ticket_change SET newvalue= 'ListoParaAnalisis' WHERE field = 'status' and newvalue= 'ListoAnalisis';

UPDATE ticket_change SET oldvalue= 'ListoParaDesarrollo' WHERE field = 'status' and oldvalue= 'ListoParaDesarrollar';
UPDATE ticket_change SET newvalue= 'ListoParaDesarrollo' WHERE field = 'status' and newvalue= 'ListoParaDesarrollar';
UPDATE ticket_change SET oldvalue= 'ListoParaDesarrollo' WHERE field = 'status' and oldvalue= 'ParaDesarrollar';
UPDATE ticket_change SET newvalue= 'ListoParaDesarrollo' WHERE field = 'status' and newvalue= 'ParaDesarrollar';

UPDATE ticket_change SET oldvalue= 'ListoParaDesarrollo' WHERE field = 'status' and oldvalue= 'Analizado';
UPDATE ticket_change SET newvalue= 'ListoParaDesarrollo' WHERE field = 'status' and newvalue= 'Analizado';

UPDATE ticket_change SET oldvalue= 'ListoParaTesteo' WHERE field = 'status' and oldvalue= 'Desarrollado';
UPDATE ticket_change SET newvalue= 'ListoParaTesteo' WHERE field = 'status' and newvalue= 'Desarrollado';
UPDATE ticket_change SET oldvalue= 'ListoParaTesteo' WHERE field = 'status' and oldvalue= 'ListoParaTestear';
UPDATE ticket_change SET newvalue= 'ListoParaTesteo' WHERE field = 'status' and newvalue= 'ListoParaTestear';

UPDATE ticket_change SET oldvalue= 'ListoParaDocumentacion' WHERE field = 'status' and oldvalue= 'ListoParaDocumentar';
UPDATE ticket_change SET newvalue= 'ListoParaDocumentacion' WHERE field = 'status' and newvalue= 'ListoParaDocumentar';
UPDATE ticket_change SET oldvalue= 'ListoParaDocumentacion' WHERE field = 'status' and oldvalue= 'Testeado';
UPDATE ticket_change SET newvalue= 'ListoParaDocumentacion' WHERE field = 'status' and newvalue= 'Testeado';

UPDATE ticket_change SET oldvalue= 'EnDocumentacion' WHERE field = 'status' and oldvalue= 'Documentado';
UPDATE ticket_change SET newvalue= 'EnDocumentacion' WHERE field = 'status' and newvalue= 'Documentado';

UPDATE ticket_change SET oldvalue= 'New' WHERE field = 'status' and oldvalue= 'reopened';
UPDATE ticket_change SET newvalue= 'New' WHERE field = 'status' and newvalue= 'reopened';
UPDATE ticket_change SET oldvalue= 'New' WHERE field = 'status' and oldvalue= 'new';
UPDATE ticket_change SET newvalue= 'New' WHERE field = 'status' and newvalue= 'new';
UPDATE ticket SET status= 'New' WHERE status= 'new';

UPDATE ticket_change SET oldvalue= 'Closed' WHERE field = 'status' and oldvalue= 'closed';
UPDATE ticket_change SET newvalue= 'Closed' WHERE field = 'status' and newvalue= 'closed';
UPDATE ticket SET status= 'Closed' WHERE status= 'closed';
*/