-- select actualizar_secuencias();

CREATE OR REPLACE FUNCTION actualizar_secuencias()
  RETURNS text AS
$BODY$
		DECLARE
			_secuencias CURSOR FOR SELECT
					c.relname as nombre_sequencia
					,tabla.relname as nombre_tabla
					,columna.attname as nombre_columna
					,esquema.schemaname as nombre_esquema
			FROM
					pg_class as c,
					pg_attrdef as a,
					pg_class as tabla,
					pg_attribute as columna,
					pg_tables as esquema
			WHERE
					c.relkind = 'S'
					AND tabla.oid = a.adrelid
					AND columna.attrelid = a.adrelid
					AND columna.attnum = a.adnum
					AND esquema.tablename = tabla.relname
					AND a.adsrc LIKE '%' || c.relname || '%'
					AND esquema.schemaname in ('public')
			GROUP BY 1,2,3,4
			ORDER BY 2, 3, 1;
			_nombre_sequencia name;
			_nombre_tabla name;
			_nombre_columna name;
			_nombre_esquema name;
			_valor INTEGER;
		BEGIN
			OPEN _secuencias;
				LOOP FETCH _secuencias INTO _nombre_sequencia, _nombre_tabla, _nombre_columna, _nombre_esquema; EXIT WHEN NOT FOUND;
					EXECUTE 'SELECT setval('''|| _nombre_esquema ||'.'|| _nombre_sequencia||''',(SELECT coalesce(max('||_nombre_columna ||'), 1) FROM '|| _nombre_esquema ||'.'||_nombre_tabla ||'))';
				END LOOP;
			RETURN 'Actualizadas las secuencias!';
		END;
		$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;