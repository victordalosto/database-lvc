-- TRANSFERE OS DADOS DE DEFENSA PARA A TABELA EM DEPLOY 

DROP TABLE if exists cacheDefensa;
CREATE TABLE cacheDefensa(
		    id integer primary key,
			nome char(25),
            condicao char(25),
            km integer,
            uf char(2),
            br char(3),
            x double,
            y double);


CREATE INDEX nome on cacheDefensa(nome);
CREATE INDEX condicao on cacheDefensa(condicao);
CREATE INDEX UF on cacheDefensa(uf);
CREATE INDEX BR on cacheDefensa(br);
CREATE INDEX km on cacheDefensa(km);

INSERT INTO cacheDefensa 
	SELECT s.id, t.nome as nome, d.nome as detalhe, l.km, 
                tr.uf, tr.br, l.x, l.y 
            FROM defensa s
            LEFT JOIN tipo    t ON s.tipo = t.id
            LEFT JOIN condicao d ON s.condicao = d.id
            LEFT JOIN log     l ON s.log  = l.id
            LEFT JOIN trecho  tr ON l.trecho = tr.id
               WHERE tr.ano = 2021
            ORDER BY tr.uf, tr.br,l.km;
	