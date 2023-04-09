-- COPIA OS DADOS BRUTOS DO LEVANTAMENTO LVC PARA O CACHE DE MARCACOES
DROP TABLE IF EXISTS cache_acostamento;
CREATE TABLE IF NOT EXISTS cache_acostamento (
    id_log integer,
    id_tipo_ocorrencia smallint,
    id_detalhe_ocorrencia smallint
);


INSERT INTO cache_acostamento
SELECT  
    o.id_log, 
    o.id_tipo_ocorrencia, 
    o.id_detalhe_ocorrencia
FROM 
    tb_ocorrencia_log o
    LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
WHERE
    tipo.id_tipo_ocorrencia in (
        55, -- acostamento condicao (boa, regular, ruim)
        67, -- acostamento pavimento (nao pavimento, pavimentado)
        84, -- acostamento sentido (ambos, direito, esquerdo)
        61, -- degrau
        68, -- largura (até 2m, maior que 2 m)
        74, -- meio fio condicao (boa, regular, ruim)
        75, -- meio fio sentido (ambos, direito, esquerdo)
        77, -- sarjeta condicoa (boa, regular, ruim)
        78  -- sarjeta sentido (ambos, direito, esquerdo)
    )
;
