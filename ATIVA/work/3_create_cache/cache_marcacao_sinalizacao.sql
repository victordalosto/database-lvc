-- COPIA OS DADOS BRUTOS DO LEVANTAMENTO LVC PARA O CACHE DE MARCACOES
DROP TABLE IF EXISTS cache_sinalizacao;
CREATE TABLE IF NOT EXISTS cache_sinalizacao (
    id_log integer,
    id_tipo_ocorrencia smallint,
    id_detalhe_ocorrencia smallint
);


INSERT INTO cache_sinalizacao
SELECT  
    o.id_log, 
    o.id_tipo_ocorrencia, 
    tipo.nm_tipo_ocorrencia, 
    o.id_detalhe_ocorrencia,
    det.nm_detalhe_ocorrencia
FROM 
    tb_ocorrencia_log o
    LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
WHERE
    tipo.id_tipo_ocorrencia in (
        33, -- lombada
        34, -- barreira eletronica
        36, -- semaforo
        37, -- iluminacao
        64, -- faixa pedestre
        65, -- postos (gasolina, servico)
        48, -- placa vertical estado (boa, regular, ruim)
        49, -- placa vertical tipo (advertencia, ...)
        50, -- defensa classf. (metalica, new jersey)
        51, -- defensa defeito.
        54, -- defensa localizacao (direito, esquerdo, ambos)
        46, -- faixa horizontal eixo (boa, regular, ruim), 
        47, -- faixa horizontal borda (boa, regular, ruim),
        63, -- faixa eixo (continua, tracejada), 
        66  -- vegetacao (rasa, media, densa)
    )
;
