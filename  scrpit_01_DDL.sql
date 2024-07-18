CREATE EXTERNAL TABLE IF NOT EXISTS tb_vagas_linkedin (
    nome_vaga STRING,
    empresa STRING,
    localizacao STRING,
    link_vaga STRING,
    categoria string
)
STORED AS PARQUET  
LOCATION 's3://my-gabizinha-bkt-2/linkedin_input/tb_vagas_linkedin/';




