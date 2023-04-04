-- PROCESSO DE TRANSFERIR SINALIZACAO PARA O BANCO - PT1/2

-- Cria uma temp tabela que segura os valores da query
DROP TABLE IF EXISTS sinalizacao;
CREATE TABLE sinalizacao(log INTEGER NOT NULL, ocorrencia TINYINT unsigned, tipo TINYINT unsigned, det TINYINT unsigned, detalhe TINYINT unsigned);

-- Insere na tabela todas as ocorrencias de 49-'VERTICAL TIPO' e 48-'VERTICAL ESTADO' -- 1702segundos
INSERT INTO sinalizacao(log, ocorrencia, tipo, det, detalhe)
  SELECT p.id_log, t.id_tipo_ocorrencia, t.id_detalhe_ocorrencia, d.id_tipo_ocorrencia, d.id_detalhe_ocorrencia
	FROM tb_ocorrencia_log p
    LEFT JOIN (SELECT * FROM tb_ocorrencia_log WHERE id_tipo_ocorrencia = 49) t ON p.id_log = t.id_log
    LEFT JOIN (SELECT * FROM tb_ocorrencia_log WHERE id_tipo_ocorrencia = 48) d ON p.id_log = d.id_log
    WHERE p.id_tipo_ocorrencia = 48 OR p.id_tipo_ocorrencia = 49
    GROUP BY p.id_log;

-- Query que verifica inconsistencias no banco
SELECT count(*) FROM sinalizacao WHERE ocorrencia is null OR tipo is null OR det is null OR detalhe is null order by log;
SELECT * FROM sinalizacao WHERE ocorrencia is null OR tipo is null OR det is null OR detalhe is null order by log;

-- Alguns fixes na query
DELETE FROM sinalizacao WHERE tipo is null AND detalhe is null;
UPDATE sinalizacao SET detalhe = 30 WHERE detalhe is null;
DELETE FROM sinalizacao WHERE tipo is null;

-- deploy
INSERT INTO dnit.sinalizacao (log, tipo, detalhe)
	SELECT log, tipo, detalhe FROM ciclo2020.sinalizacao;
    
DELETE FROM dnit.sinalizacao
	WHERE tipo IN (65, 67);
	
-- LAST CHECK
SELECT * from dnit.sinalizacao GROUP BY tipo, detalhe order by tipo, detalhe

		