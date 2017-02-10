-- ESTO DEBERIA REALIZARSE CUANDO SE COMIENCE A TRABAJAR CON LA DB DE PRODUCCION


/*SELECT
 'SELECT setval('''|| esquema.schemaname ||'.'|| c.relname||''',(SELECT coalesce(max('||columna.attname ||'), 1) FROM '|| esquema.schemaname ||'.'||tabla.relname ||'))',
					c.relname as nombre_sequencia
					--,tabla.relname as nombre_tabla
					--,columna.attname as nombre_columna
					--,esquema.schemaname as nombre_esquema
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
			--GROUP BY 1,2,3,4
			ORDER BY 2--, 3, 1
;
*/

SELECT setval('public.attachments_id_seq',(SELECT coalesce(max(id), 1) FROM public.attachments));
SELECT setval('public.auth_sources_id_seq',(SELECT coalesce(max(id), 1) FROM public.auth_sources));
SELECT setval('public.boards_id_seq',(SELECT coalesce(max(id), 1) FROM public.boards));
SELECT setval('public.changes_id_seq',(SELECT coalesce(max(id), 1) FROM public.changes));
SELECT setval('public.changesets_id_seq',(SELECT coalesce(max(id), 1) FROM public.changesets));
SELECT setval('public.comments_id_seq',(SELECT coalesce(max(id), 1) FROM public.comments));
SELECT setval('public.custom_fields_id_seq',(SELECT coalesce(max(id), 1) FROM public.custom_fields));
SELECT setval('public.custom_values_id_seq',(SELECT coalesce(max(id), 1) FROM public.custom_values));
SELECT setval('public.documents_id_seq',(SELECT coalesce(max(id), 1) FROM public.documents));
SELECT setval('public.enabled_modules_id_seq',(SELECT coalesce(max(id), 1) FROM public.enabled_modules));
SELECT setval('public.enumerations_id_seq',(SELECT coalesce(max(id), 1) FROM public.enumerations));
SELECT setval('public.issue_categories_id_seq',(SELECT coalesce(max(id), 1) FROM public.issue_categories));
SELECT setval('public.issue_relations_id_seq',(SELECT coalesce(max(id), 1) FROM public.issue_relations));
SELECT setval('public.issue_statuses_id_seq',(SELECT coalesce(max(id), 1) FROM public.issue_statuses));
SELECT setval('public.issues_id_seq',(SELECT coalesce(max(id), 1) FROM public.issues));
SELECT setval('public.journal_details_id_seq',(SELECT coalesce(max(id), 1) FROM public.journal_details));
SELECT setval('public.journals_id_seq',(SELECT coalesce(max(id), 1) FROM public.journals));
SELECT setval('public.member_roles_id_seq',(SELECT coalesce(max(id), 1) FROM public.member_roles));
SELECT setval('public.members_id_seq',(SELECT coalesce(max(id), 1) FROM public.members));
SELECT setval('public.messages_id_seq',(SELECT coalesce(max(id), 1) FROM public.messages));
SELECT setval('public.news_id_seq',(SELECT coalesce(max(id), 1) FROM public.news));
SELECT setval('public.open_id_authentication_associations_id_seq',(SELECT coalesce(max(id), 1) FROM public.open_id_authentication_associations));
SELECT setval('public.open_id_authentication_nonces_id_seq',(SELECT coalesce(max(id), 1) FROM public.open_id_authentication_nonces));
SELECT setval('public.projects_id_seq',(SELECT coalesce(max(id), 1) FROM public.projects));
SELECT setval('public.queries_id_seq',(SELECT coalesce(max(id), 1) FROM public.queries));
SELECT setval('public.repositories_id_seq',(SELECT coalesce(max(id), 1) FROM public.repositories));
SELECT setval('public.roles_id_seq',(SELECT coalesce(max(id), 1) FROM public.roles));
--SELECT setval('public.roles_id_seq',(SELECT coalesce(max(id), 1) FROM public.member_roles));
SELECT setval('public.settings_id_seq',(SELECT coalesce(max(id), 1) FROM public.settings));
SELECT setval('public.time_entries_id_seq',(SELECT coalesce(max(id), 1) FROM public.time_entries));
SELECT setval('public.tokens_id_seq',(SELECT coalesce(max(id), 1) FROM public.tokens));
SELECT setval('public.trackers_id_seq',(SELECT coalesce(max(id), 1) FROM public.trackers));
SELECT setval('public.user_preferences_id_seq',(SELECT coalesce(max(id), 1) FROM public.user_preferences));
SELECT setval('public.users_id_seq',(SELECT coalesce(max(id), 1) FROM public.users));
SELECT setval('public.versions_id_seq',(SELECT coalesce(max(id), 1) FROM public.versions));
--SELECT setval('public.versions_id_seq',(SELECT coalesce(max(id), 1) FROM public.wiki_content_versions));
SELECT setval('public.watchers_id_seq',(SELECT coalesce(max(id), 1) FROM public.watchers));
SELECT setval('public.wiki_content_versions_id_seq',(SELECT coalesce(max(id), 1) FROM public.wiki_content_versions));
SELECT setval('public.wiki_contents_id_seq',(SELECT coalesce(max(id), 1) FROM public.wiki_contents));
SELECT setval('public.wiki_pages_id_seq',(SELECT coalesce(max(id), 1) FROM public.wiki_pages));
SELECT setval('public.wiki_redirects_id_seq',(SELECT coalesce(max(id), 1) FROM public.wiki_redirects));
SELECT setval('public.wikis_id_seq',(SELECT coalesce(max(id), 1) FROM public.wikis));
SELECT setval('public.workflows_id_seq',(SELECT coalesce(max(id), 1) FROM public.workflows));
