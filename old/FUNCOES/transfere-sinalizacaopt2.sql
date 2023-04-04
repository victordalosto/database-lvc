-- PROCESSO DE TRANSFERIR SINALIZACAO PARA O BANCO - PT2/2

-- Cria uma temp tabela que segura os valores da query
DROP TABLE IF EXISTS sinalizacao2;
CREATE TABLE sinalizacao2(log INTEGER NOT NULL, tipo tinyint unsigned not null);

-- Insere na tabela todas as ocorrencias de 33-lombada, 34-barreira, 36-semaforo, 37-iluminacao, 64-faixaPedestre
INSERT INTO sinalizacao2
   SELECT p.id_log, p.id_tipo_ocorrencia
		FROM tb_ocorrencia_log p
        WHERE p.id_tipo_ocorrencia IN (33, 34, 36, 37, 64);
        
UPDATE sinalizacao2 SET tipo = 100 where tipo = 33;
UPDATE sinalizacao2 SET tipo = 101 where tipo = 34;
UPDATE sinalizacao2 SET tipo = 102 where tipo = 36;
UPDATE sinalizacao2 SET tipo = 103 where tipo = 37;
UPDATE sinalizacao2 SET tipo = 104 where tipo = 64;

SELECT count(*) from sinalizacao2 where TIPO IN (100, 101, 102, 104);

SELECT count(*) from sinalizacao2 where TIPO IN (103);

-- DEPLOY
INSERT INTO dnit.sinalizacao (log, tipo)
	SELECT c.log, c.tipo FROM ciclo2020.sinalizacao2 c WHERE c.tipo IN (100, 101, 102, 104);

INSERT INTO dnit.iluminacao (log, tipo)
	SELECT c.log, c.tipo FROM ciclo2020.sinalizacao2 c WHERE c.tipo IN (103);


