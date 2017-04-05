-- Creo estados finales nuevos (serian el replazo de resolution del trac)
-- INSERT INTO issue_statuses(name, is_closed, is_default,position)  VALUES ('Resuelto',true,false, (select coalesce(max(position) + 1, 1) from issue_statuses));
    
INSERT INTO issue_statuses(
            name, is_closed, is_default,position)
    VALUES ('Duplicado',true,false, (select coalesce(max(position) + 1, 1) from issue_statuses));

INSERT INTO issue_statuses(
            name, is_closed, is_default,position)
    VALUES ('Invalido',true,false, (select coalesce(max(position) + 1, 1) from issue_statuses));
