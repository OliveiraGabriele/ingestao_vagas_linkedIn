WITH totals AS (
    SELECT
        COUNT(*) AS total_vagas,
        COUNT(*) FILTER (WHERE localizacao LIKE '%Remoto%') AS total_trabalho_remoto,
        COUNT(*) FILTER (WHERE localizacao LIKE '%Híbrido%') AS total_hibridas,
        COUNT(*) FILTER (WHERE localizacao LIKE '%Presencial%') AS total_presenciais,
        COUNT(*) FILTER (WHERE categoria = 'Senior') AS total_senior,
        COUNT(*) FILTER (WHERE categoria = 'Pl') AS total_pleno,
        COUNT(*) FILTER (WHERE categoria = 'Junior') AS total_junior,
        COUNT(*) FILTER (WHERE categoria = 'nao especificado') AS total_nao_especificado
    FROM
        db_workspace_shared_account_587791419323.tb_vagas_linkedin
)
SELECT
    total_vagas,
    total_trabalho_remoto,
    total_hibridas,
    total_presenciais,
    total_senior,
    total_pleno,
    total_junior,
    total_nao_especificado,
    ROUND((total_senior * 100.0 / total_vagas), 1) AS percentual_senior,
    ROUND((total_pleno * 100.0 / total_vagas), 1) AS percentual_pleno,
    ROUND((total_junior * 100.0 / total_vagas), 1) AS percentual_junior,
    ROUND((total_nao_especificado * 100.0 / total_vagas), 1) AS percentual_nao_especificado
FROM
    totals;
