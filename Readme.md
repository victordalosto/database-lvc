<h1><strong>Banco de dados LVC</strong></h1>

Este é um repositório contendo as rotinas realizadas para criar o banco de dados LVC, utilizado para consultas de ativos no <strong>DNIT - Departamento Nacional de Infraestrutura e Transporte</strong>.

<br/>

---
<strong>Passo 1</strong>:
Merge nos 2 bancos de dados: 'db_lvc' e 'db_lvc_2020_2021'

 - Criar novo banco: <b>lvc</b>

 - Exportar as marcacoes como csv > <b>Export DATA</b> no SGBD

 - Realizar INSERT dos backups no novo banco usando a seguinte rotina (Tempo estimado: 5 dias)
  <br><i>INSERT INTO ... ON CONFLICT DO NOTHING</i> 

    -> Eu realizei algumas adaptacoes para que os INSERTS pudessem ser otimizados e fossem executado em paralelo usando Batches.
 Usei os scripts armazenados em ./improveImportJava/* para alterar diretamente o CSV para remover os ids em conflitos, evitando que essas colisoes só fossem encontrados com o SGDB que é demorado para isso. (Tempo economizado: 3 dias)

<br/>

---
<strong>Passo 2</strong>:
Realizar correcoes devido a inconsistencias do Sistlev
 - Deletar ids que não foram deletados pela equipe de TI. Correcoes estão na Pasta ./ids/ids_todos

 - Correcoes de cordenadas invertidas (como?) -> Algoritmo pacote:  banco.demo.fixes.FixCordenadasInvertidas 
 <i>(Verifiquei que todas as coordenadas com id_trecho >= 9974 estavam erradas. Além de outras pontuais com id < 7676)</i>

 - Correcoes de inconsistências no banco (??) 

    -> Foreign key de <b>tb_ocorrencia_log</b> foi derrubada por algum motivo, levando ao Sistlev a realizar inserções incorretas no banco

    -> Alguem fez um update errado, levando a existirem marcacoes do tipo 'acostamento' em outros modulos como 'pavimento' e 'sinalizacao', tornando todos os os modulos inconsistentes. 

    -> Algumas marcacoes não estao sendo registradas no banco.

    <b>Esses erros foram corrigidos manualmente, exportando os pontos em KML, analisando visualmente algum outro ano que também foi levantada a atividade e não exisitia essa inconsistência, e realizando a devida substituição.</b>

<br>

---
<strong>Passo 3</strong>:
Criacao de um Modelo unico para tentar representar todas as marcacoes que são realizadas pelo <b>Sistlev</b>.

 - Modelo na pasta <b>./domain/model</b>. Devido ao fato de existirem algumas marcações que não foram realizadas ou ainda estão em processo de adaptação, esse modelo pode resultar em null para algumas colunas, como em <b>condicao</b> ou em <b>lado</b>. No entanto, essa generalizacao facilita, e muito, no processo de padronização e criação de modelos que consultam o banco.
 ```json
 {
    "id": "integer",
    "nome": "char(20)",
    "condicao": "char(20)",
    "lado": "char(20)",
    "km": "integer",
    "sentido": "char(1)",
    "gps_y": "double precision",
    "gps_x": "double precision",
    "uf": "char(3)",
    "br": "char(2)"
}
```
 - As rotinas para a adaptação das marcações no banco para cada um desses modelos estão representados em <b>./3_create_tables/*</b> e <b>./4_new_tables</b>