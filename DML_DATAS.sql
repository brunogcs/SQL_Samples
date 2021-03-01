SET LANGUAGE Portuguese; 
select 
 FORMAT(GETDATE(), 'd', 'pt-br')		AS 'Padr�o de Data Abreviada'
,datename(DAY,GETDATE())						AS 'DIA'
,month(GETDATE())										AS 'M�S'
,datename(MONTH,GETDATE())					AS 'NOME M�S'
,FORMAT(GETDATE(), 'MMM')						AS 'M�S ABREV'
,datename(YEAR,GETDATE())						AS 'ANO'
,FORMAT(GETDATE(), 'D', 'pt-br' )   AS 'Padr�o de Data Completa'
,FORMAT(GETDATE(), 'D')							AS 'DATA EXTENSO - MES'
,FORMAT(GETDATE(), 'f')							AS 'Padr�o de Data/Hora Completa (Hora Abreviada)'
,FORMAT(GETDATE(), 'F')							AS 'Padr�o de Data/Hora Completa (Hora Completa)'
,FORMAT(GETDATE(), 'F')							AS 'Padr�o de Data/Hora Completa (Hora Completa)'
,FORMAT(GETDATE(), 'g')							AS 'Padr�o geral de data/hora (hora abreviada)'
,FORMAT(GETDATE(), 'G')							AS 'Padr�o geral de data/hora (hora completa)'
,FORMAT(GETDATE(), 'm')							AS 'Padr�o de m�s/dia'
,FORMAT(GETDATE(), 'o')							AS 'Padr�o de data/hora de ida e volta'
,FORMAT(GETDATE(), 'r')							AS 'Padr�o RFC1123'
,FORMAT(GETDATE(), 's')							AS 'Padr�o de Data/Hora Classific�vel'
,FORMAT(GETDATE(), 't')							AS 'Padr�o de hora abreviada'
,FORMAT(GETDATE(), 'T')							AS 'Padr�o de hora completa'
,FORMAT(GETDATE(), 'u')							AS 'Padr�o Classific�vel Universal de Data/Hora'
,FORMAT(GETDATE(), 'U')							AS 'Padr�o Universal de Data/Hora Completa'
,FORMAT(GETDATE(), 'y')							AS 'Padr�o ano m�s.'

select * from sys.syslanguages where name = 'Portugu�s'