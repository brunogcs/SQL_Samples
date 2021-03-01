--Lidar com campos CHAR
RIGHT('0000000000'+'845094',10)

--Remover Caracteres Invisiveis
LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE([MED_Campo], CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), '')))

--Nome do mês + Ano (Primeira Maiuscula)
upper(left(DATENAME(MONTH, @DATA+'01'),1)) + lower(substring(DATENAME(MONTH, @DATA+'01'),2,len(DATENAME(MONTH, @DATA+'01')))) + ' - ' + LEFT(@DATA,4) 