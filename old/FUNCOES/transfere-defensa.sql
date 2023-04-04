-- PROCESSO DE TRANSFERIR DEFENSA PARA O BANCO

-- Cria uma temp tabela que segura os valores da query
DROP TABLE IF EXISTS defensa;
CREATE TABLE defensa (log integer not null, tipo tinyint unsigned, sentido tinyint unsigned, detalhe tinyint unsigned);

-- Insere na tabela todas as DEFENSAS
INSERT INTO defensa(log, tipo, sentido, detalhe)
  SELECT p.id_log, t.id_detalhe_ocorrencia, s.id_detalhe_ocorrencia, d.id_tipo_ocorrencia
	FROM tb_ocorrencia_log p
    LEFT JOIN (SELECT * FROM tb_ocorrencia_log WHERE id_tipo_ocorrencia = 50) t ON p.id_log = t.id_log
    LEFT JOIN (SELECT * FROM tb_ocorrencia_log WHERE id_tipo_ocorrencia = 54) s ON p.id_log = s.id_log
    LEFT JOIN (SELECT * FROM tb_ocorrencia_log WHERE id_tipo_ocorrencia = 51) d ON p.id_log = d.id_log
    WHERE p.id_tipo_ocorrencia IN (50, 51, 54)
    GROUP BY p.id_log;
    
-- QUICK FIXES
DELETE from defensa where tipo is null;
update defensa set sentido = 48 WHERE sentido is null;

UPDATE defensa
 SET quantitativo =
 CASE
	WHEN sentido = 48 THEN 1
    WHEN sentido = 49 THEN 1
    WHEN sentido = 50 THEN 2
 END;


-- 7 594 912
SELECT * from defensa GROUP BY tipo, sentido, detalhe ORDER BY tipo, sentido, detalhe;
SELECT count(*) from defensa where sentido is null;
SELECT * from defensa where quantitativo IS NULL;

SELECT * from defensa




