-- acostamento



-- sarjeta
SELECT id_log, 
	   MAX(sentido) AS sentido,
	   MAX(condicao) AS condicao
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (87, 88, 89) THEN det.nm_detalhe_ocorrencia END) AS sentido,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (84, 85, 86) THEN det.nm_detalhe_ocorrencia END) AS condicao
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (
				77, -- CONDICAO SARJETA
				78  -- SENTIDO SARJETA
			)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
	) querySarjeta
GROUP BY id_log


-- meio fio
SELECT id_log, 
	   MAX(sentido) AS sentido,
	   MAX(condicao) AS condicao
	FROM (
		SELECT  
			o.id_log id_log, 
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (79, 80, 81) THEN det.nm_detalhe_ocorrencia END) AS sentido,
			MAX(CASE WHEN det.id_detalhe_ocorrencia IN (76, 77, 78) THEN det.nm_detalhe_ocorrencia END) AS condicao
		FROM 
			tb_ocorrencia_log o
			LEFT JOIN tb_tipo_ocorrencia tipo on tipo.id_tipo_ocorrencia = o.id_tipo_ocorrencia
			LEFT JOIN tb_detalhe_ocorrencia det on det.id_detalhe_ocorrencia = o.id_detalhe_ocorrencia
		WHERE
			o.id_tipo_ocorrencia IN (
				74, -- CONDICAO MEIO-FIO
				75  -- SENTIDO MEIO-FIO
			)
        GROUP BY 
            o.id_log, o.id_tipo_ocorrencia
	) queryMeioFio
GROUP BY id_log