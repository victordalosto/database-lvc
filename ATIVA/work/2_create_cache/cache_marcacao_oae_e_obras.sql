-- COPIA OS DADOS BRUTOS DO LEVANTAMENTO LVC PARA O CACHE DE MARCACOES
DROP TABLE IF EXISTS cache_oaeobras;
CREATE TABLE IF NOT EXISTS cache_oaeobras (
    id_log integer
    id_tipo_ocorrencia smallint,
    nm_tipo_ocorrencia CHAR(20),
    id_detalhe_ocorrencia smallint,
    nm_detalhe_ocorrencia CHAR(20)
);


INSERT INTO cache_oaeobras
SELECT  
    o.id_log, 
    o.id_tipo_ocorrencia, 
    tipo.nm_tipo_ocorrencia, 
    o.id_detalhe_ocorrencia,
    det.nm_detalhe_ocorrencia
FROM 
    tb_ocorrencia_log o
    LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
    LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
WHERE
	o.id_tipo_ocorrencia IN (
        69, -- OAES
        18  -- OBRAS
    )
;