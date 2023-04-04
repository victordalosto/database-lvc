-- TRANSFERE OS DADOS PARA CACHE
DROP TABLE if exists cache;
CREATE TABLE cache (
		    id BIGINT PRIMARY KEY,
			nome CHAR(25),
            condicao CHAR(25),
            km INT,
            uf CHAR(2),
            br CHAR(3),
            x DOUBLE,
            y DOUBLE,
            iri_int,
            iri_ext,
            flecha_int,
            flecha_ext
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
-- CACHE IS USED FOR START POINT FOR FIXING SOME VALUE
-- SO, InnoDB WAS USED TO MANIPULATE THE ENTIRE DATABASE
-- AND MyISAM IS APPLYED LATER FOR QUERYS



SELECT  tb_log.id_log,
        tb_tipo_ocorrencia.nm_tipo_ocorrencia,
        tb_detalhe_ocorrencia.nm_detalhe_ocorrencia,
        tb_log.odometro,
        tb_trecho.nm_uf,
        tb_trecho.nm_br,
        tb_log.gps_x,
        tb_log.gps_y,
        tb_log.iri_interno,
        tb_log.iri_externo,
        tb_log.flecha_int,
        tb_log.flecha_ext
    FROM 
        tb_log
        LEFT JOIN tb_trecho ON tb_log.id_trecho = tb_trecho.id_trecho
        LEFT JOIN tb_ocorrencia_log ON tb_ocorrencia_log.id_log = tb_log.id_log
        LEFT JOIN tb_tipo_ocorrencia ON tb_tipo_ocorrencia.id_tipo_ocorrencia = tb_ocorrencia_log.id_tipo_ocorrencia
        LEFT JOIN tb_detalhe_ocorrencia ON tb_detalhe_ocorrencia.id_tipo_ocorrencia = tb_ocorrencia_log.id_tipo_ocorrencia
    -- ORDER BY 
    --     tb_trecho.nm_uf, 
    --     tb_trecho.nm_br,
    --     tb_log.odometro
    LIMIT 50
;

-- INSERT INTO cache 
-- 	SELECT s.id, t.nome as nome, l.km, 
--                 tr.uf, tr.br, l.x, l.y 
--             FROM Defeito s
--             LEFT JOIN tipo    t ON s.tipo = t.id
--             LEFT JOIN log     l ON s.log  = l.id
--             LEFT JOIN trecho  tr ON l.trecho = tr.id
--                WHERE tr.ano = 2021
--             ORDER BY tr.uf, tr.br,l.km;
	


-- Aplica Index nos principais parametros de busca
CREATE INDEX nome on cache(nome);
CREATE INDEX condicao on cache(condicao);
CREATE INDEX km on cache(km);
CREATE INDEX uf on cache(uf);
CREATE INDEX br on cache(br);

OPTIMIZE TABLE cache;