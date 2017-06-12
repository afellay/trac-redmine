﻿-- CERRADA (■) a Closed. Despues se debe borrar
-- UPDATE issues SET status_id = 5 WHERE status_id = 8;

-- NUEVA (⌂) a New. Despues se debe borrar
-- UPDATE issues SET status_id = 1 WHERE status_id = 7;


-- ANULADA (X) a Closed. Despues se debe borrar
-- UPDATE issues SET status_id = 5 WHERE status_id = 20;


-- Se borran los estados que no se utilizan
-- DELETE FROM issue_statuses WHERE id = 7;
-- DELETE FROM issue_statuses WHERE id = 8;
-- DELETE FROM issue_statuses WHERE id = 20;