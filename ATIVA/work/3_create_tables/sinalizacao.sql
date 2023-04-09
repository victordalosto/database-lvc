-- PLACAS VERTICAIS
SELECT id_log id, 
	   MAX(tipo) AS nome, 
	   MAX(estado) AS condicao
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (33, 34, 35, 36, 37, 38, 57) THEN det.nm_detalhe_ocorrencia END) AS tipo,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (30, 32, 44) THEN det.nm_detalhe_ocorrencia END) AS estado
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (48, 49)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
	) querySInalizacoes
GROUP BY id_log



-- DISPOSITIVOS DE SEGURANCA
SELECT id_log, 
	   MAX(nome) AS nome, 
	   MAX(estado) AS condicao,
	   MAX(defeitos) AS defeito
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (39, 40, 41, 43, 46, 47) THEN det.nm_detalhe_ocorrencia END) AS tipo,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (51) THEN det.nm_detalhe_ocorrencia END) AS defeitos,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (48, 49, 50) THEN det.nm_detalhe_ocorrencia END) AS estado
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (50, 51, 54)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
		LIMIT 10
	) queryDispositivosDeSeguranca
GROUP BY id_log


-- VEGETACAO
SELECT  
	o.id_log,
	det.nm_detalhe_ocorrencia
FROM 
	tb_ocorrencia_log o
	LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
	LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
WHERE
	o.id_tipo_ocorrencia = 66


-- FAIXAS
-- POSSIVELMENTE POPULADA 2x no banco
SELECT id_log, 
	   MAX(eixo) AS eixo, 
	   MAX(estado_eixo) AS estado_eixo,
	   MAX(estado_borda) AS estado_borda
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (55, 56) THEN det.nm_detalhe_ocorrencia END) AS eixo,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (26, 27, 45) THEN det.nm_detalhe_ocorrencia END) AS estado_eixo,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (28, 29, 51) THEN det.nm_detalhe_ocorrencia END) AS estado_borda
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (63, 46, 47)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
	) queryFaixas
GROUP BY id_log