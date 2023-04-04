SET SESSION group_concat_max_len=10240;

SELECT CONCAT('ALTER TABLE ', `Table`, ' DROP INDEX ', GROUP_CONCAT(`Index` SEPARATOR ', DROP INDEX '),';' )
FROM (
SELECT table_name AS `Table`,
       index_name AS `Index`
FROM information_schema.statistics
WHERE NON_UNIQUE = 1 AND table_schema = 'dnit' AND table_name = 'iluminacao'
GROUP BY `Table`, `Index`) AS tmp
GROUP BY `Table`;


ALTER TABLE posto DROP INDEX tipo_posto;
ALTER TABLE defensa DROP INDEX tipo_defensa;
