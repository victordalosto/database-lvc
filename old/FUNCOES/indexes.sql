CREATE INDEX snv on trecho (snv);
CREATE INDEX uf on trecho (uf);
CREATE INDEX br ON trecho (br);
CREATE INDEX ano ON trecho(ano);
CREATE INDEX hodometro on log(hodometro);
CREATE INDEX quantitativo on defensa (quantitativo);
CREATE INDEX nm_tipo ON tipo(nome);
CREATE INDEX nm_detalhe on detalhe(nome);

ALTER TABLE log ADD CONSTRAINT trecho FOREIGN KEY (trecho) REFERENCES trecho(id);
ALTER TABLE sinalizacao ADD CONSTRAINT log_sinalizacao FOREIGN KEY (log) REFERENCES log(id);
ALTER TABLE posto ADD CONSTRAINT log_posto FOREIGN KEY (log) REFERENCES log(id);
ALTER TABLE iluminacao ADD CONSTRAINT log_iluminacao FOREIGN KEY (log) REFERENCES log(id);
ALTER TABLE defeito ADD CONSTRAINT log_defeito FOREIGN KEY (log) REFERENCES log(id);
ALTER TABLE defensa ADD CONSTRAINT log_defensa FOREIGN KEY (log) REFERENCES log(id);

ALTER TABLE sinalizacao ADD CONSTRAINT tipo_sinalizacao FOREIGN KEY (tipo) REFERENCES tipo(id);
ALTER TABLE posto ADD CONSTRAINT tipo_posto FOREIGN KEY (tipo) REFERENCES tipo(id);
ALTER TABLE iluminacao ADD CONSTRAINT tipo_iluminacao FOREIGN KEY (tipo) REFERENCES tipo(id);
ALTER TABLE defeito ADD CONSTRAINT tipo_defeito FOREIGN KEY (tipo) REFERENCES tipo(id);
ALTER TABLE defensa ADD CONSTRAINT tipo_defensa FOREIGN KEY (tipo) REFERENCES tipo(id);

ALTER TABLE sinalizacao ADD CONSTRAINT detalhe_sinalizacao FOREIGN KEY (detalhe) REFERENCES detalhe(id);
ALTER TABLE defensa ADD CONSTRAINT detalhe_defensa FOREIGN KEY (detalhe) REFERENCES detalhe(id);

ALTER TABLE sinalizacao ADD UNIQUE UNQ_sinalizacao (log, tipo);
ALTER TABLE defeito ADD UNIQUE UNQ_defeito (log, tipo);
ALTER TABLE defensa ADD UNIQUE UNQ_defensa (log, tipo);
ALTER TABLE iluminacao ADD UNIQUE UNQ_iluminacao (log, tipo);
ALTER TABLE posto ADD UNIQUE UNQ_posto (log, tipo);

OPTIMIZE TABLE trecho;
OPTIMIZE TABLE log;
OPTIMIZE TABLE tipo;
OPTIMIZE TABLE detalhe;
OPTIMIZE TABLE SINALIZACAO;
OPTIMIZE TABLE defensa;
OPTIMIZE TABLE defeito;
OPTIMIZE TABLE posto;
OPTIMIZE TABLE iluminacao;
