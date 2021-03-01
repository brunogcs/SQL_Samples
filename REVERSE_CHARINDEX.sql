DECLARE
	@LINHA					VARCHAR(200) = 'CS01||CS01-FIFA-PES||123456789'

set @LINHA = replace(@LINHA, '*||1||', '')
set @LINHA = replace(@LINHA, '*||2||', '')
set @LINHA = replace(@LINHA, '*||3||', '')

set @LINHA = replace(@LINHA, 'PES01||', '')
set @LINHA = replace(@LINHA, 'FIFA01||', '')
set @LINHA = replace(@LINHA, 'CS01||', '')

SELECT LEFT(@LINHA,len(@LINHA) - (CHARINDEX('||', REVERSE(@LINHA))+1));

SELECT RIGHT(@LINHA,(CHARINDEX('||', REVERSE(@LINHA))-1));