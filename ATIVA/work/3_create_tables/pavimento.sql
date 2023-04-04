-- OAES
SELECT id_log, 
	   MAX(tipo) AS nome 
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (68, 69, 70, 71, 72, 73) THEN det.nm_detalhe_ocorrencia END) AS tipo
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (69)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
	) queryOAES
GROUP BY id_log
