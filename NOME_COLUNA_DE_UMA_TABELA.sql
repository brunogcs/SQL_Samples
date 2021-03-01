--Conseguir nome das colunas em tabela comum
SELECT COUNT(COLUMN_NAME) 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_CATALOG = 'database' AND TABLE_SCHEMA = 'dbo'
AND TABLE_NAME = 'NOME_TABELA'

--Conseguir nome das colunas em tabela temporaria
SELECT *
FROM tempdb.sys.columns
WHERE object_id = object_id('tempdb..##NOME_TABELA')