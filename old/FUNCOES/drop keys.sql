SELECT concat('alter table `',table_schema,'`.`',table_name,'` DROP INDEX ',constraint_name,';')
FROM information_schema.table_constraints
WHERE constraint_type='INDEX'
AND table_schema='dnit';

SHOW INDEX FROM sinalizacao;
alter table `dnit`.`defeito` DROP FOREIGN KEY log_defeito;
alter table `dnit`.`defeito` DROP FOREIGN KEY tipo_defeito;
alter table `dnit`.`defensa` DROP FOREIGN KEY detalhe_defensa;
alter table `dnit`.`defensa` DROP FOREIGN KEY log_defensa;
alter table `dnit`.`defensa` DROP FOREIGN KEY tipo_defensa;
alter table `dnit`.`iluminacao` DROP FOREIGN KEY log_iluminacao;
alter table `dnit`.`iluminacao` DROP FOREIGN KEY tipo_iluminacao;
alter table `dnit`.`log` DROP FOREIGN KEY trecho;
alter table `dnit`.`posto` DROP FOREIGN KEY log_posto;
alter table `dnit`.`posto` DROP FOREIGN KEY tipo_posto;
alter table `dnit`.`sinalizacao` DROP FOREIGN KEY detalhe_sinalizacao;
alter table `dnit`.`sinalizacao` DROP FOREIGN KEY log_sinalizacao;

alter table `dnit`.`defensa` DROP PRIMARY KEY;
alter table `dnit`.`detalhe` DROP PRIMARY KEY;
alter table `dnit`.`iluminacao` DROP PRIMARY KEY;
alter table `dnit`.`log` DROP PRIMARY KEY;
alter table `dnit`.`posto` DROP PRIMARY KEY;
alter table `dnit`.`tipo` DROP PRIMARY KEY;
alter table `dnit`.`trecho` DROP PRIMARY KEY;