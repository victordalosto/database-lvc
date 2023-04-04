-- PROCESSO DE TRANSFERIR SINALIZACAO PARA O BANCO - PT2/2

-- Cria uma temp tabela que segura os valores da query
DROP TABLE IF EXISTS defeito;
CREATE TABLE defeito(log INTEGER NOT NULL, tipo tinyint unsigned not null);

-- Insere na tabela todas as ocorrencias de POSTOS
INSERT INTO defeito
   SELECT p.id_log, p.id_tipo_ocorrencia
		FROM tb_ocorrencia_log p
        WHERE p.id_tipo_ocorrencia IN (7, 8, 13);

-- DEPLOY
INSERT INTO dnit.defeito(log, tipo)
		SELECT log, tipo FROM ciclo2020.defeito ;
        
INSERT INTO tipo VALUES (7, 'AFUNDAMENTO'), (8, 'PANELA'), (13, 'QUEBRA DE BORDO');
