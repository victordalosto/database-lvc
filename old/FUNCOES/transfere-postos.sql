-- PROCESSO DE TRANSFERIR SINALIZACAO PARA O BANCO - PT2/2

-- Cria uma temp tabela que segura os valores da query
DROP TABLE IF EXISTS postos;
CREATE TABLE postos(log INTEGER NOT NULL, tipo tinyint unsigned not null);

-- Insere na tabela todas as ocorrencias de POSTOS
INSERT INTO postos
   SELECT p.id_log, p.id_detalhe_ocorrencia
		FROM tb_ocorrencia_log p
        WHERE p.id_detalhe_ocorrencia IN (58, 59);

-- DEPLOY
INSERT INTO dnit.postos(log, tipo)
		SELECT log, tipo FROM ciclo2020.postos ;


INSERT INTO tipo VALUES(58, 'POSTO DE SERVICO'), (59, 'POSTO DE GASOLINA'); 