-- COPIA OS DADOS BRUTOS DO LEVANTAMENTO LVC PARA O CACHE DE MARCACOES
DROP TABLE IF EXISTS cache_pavimento;
CREATE TABLE IF NOT EXISTS cache_pavimento (
    id_log integer
    id_tipo_ocorrencia smallint,
    nm_tipo_ocorrencia CHAR(20),
);


INSERT INTO cache_pavimento
SELECT  
    o.id_log, 
    o.id_tipo_ocorrencia, 
    tipo.nm_tipo_ocorrencia, 
FROM 
    tb_ocorrencia_log o
    LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
WHERE
    tipo.id_tipo_ocorrencia in (
        3,  -- fissura
        4,  -- fc2
        6,  -- fc3
        7,  -- afundamento
        8,  -- panela
        9,  -- remendo
        10, -- exsudacao
        11, -- escorregamento
        12, -- desgaste
        13, -- quebra-bordo
    )
;
