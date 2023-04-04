-- TRANSFERE OS DADOS DE SINALIZACAO PARA A TABELA EM DEPLOY 
     
DROP TABLE if exists cachepardal;
CREATE TABLE cachepardal(
		    id integer primary key,
			nome char(25),
            condicao char(25),
            km integer,
            uf char(2),
            br char(3),
            x double,
            y double);

CREATE INDEX nome on cachepardal(nome);
CREATE INDEX condicao on cachepardal(condicao);
CREATE INDEX UF on cachepardal(uf);
CREATE INDEX BR on cachepardal(br);
CREATE INDEX km on cachepardal(km);

INSERT INTO cachepardal 
	SELECT s.id, t.nome as nome, d.nome as detalhe, l.km, 
                tr.uf, tr.br, l.x, l.y 
            FROM Sinalizacao s
            LEFT JOIN tipo    t ON s.tipo = t.id
            LEFT JOIN condicao d ON s.condicao = d.id
            LEFT JOIN log     l ON s.log  = l.id
            LEFT JOIN trecho  tr ON l.trecho = tr.id
               WHERE tr.ano = 2021
               AND t.id = 101
            ORDER BY tr.uf, tr.br,l.km;
	
    
