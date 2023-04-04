-- TRANSFERE OS DADOS DE DANOS PARA A TABELA EM DEPLOY 
     
DROP TABLE if exists cachegasolina;
CREATE TABLE cachegasolina(
		    id integer primary key,
			nome char(25),
            km integer,
            uf char(2),
            br char(3),
            x double,
            y double);

CREATE INDEX nome on cachegasolina(nome);
CREATE INDEX UF on cachegasolina(uf);
CREATE INDEX BR on cachegasolina(br);
CREATE INDEX km on cachegasolina(km);


INSERT INTO cachegasolina 
	SELECT s.id, t.nome as nome, l.km, 
                tr.uf, tr.br, l.x, l.y 
            FROM Posto s
            LEFT JOIN tipo    t ON s.tipo = t.id
            LEFT JOIN log     l ON s.log  = l.id
            LEFT JOIN trecho  tr ON l.trecho = tr.id
               WHERE tr.ano = 2021
				AND tipo = 59
            ORDER BY tr.uf, tr.br,l.km;
	
    
