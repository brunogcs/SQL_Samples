/************************************************************************************************************************************************
																											CRIANDO TABELA LOG DE ERROS
*************************************************************************************************************************************************/
/*
	CREATE TABLE TRATAMENTO_ERRO_BSILVA(
	  ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	 ,DATAERRO	DATETIME
	 ,ERRORLINE VARCHAR(50)
	 ,ERRORMESSAGE VARCHAR(1000)
	 ,ERRORNUMBER VARCHAR(50)
	 ,ERRORPROCEDURE VARCHAR(500)
	 ,ERRORSEVERITY VARCHAR(1000)
	 ,ERRORSTATE VARCHAR(50)
	 ,SOLUCAO VARCHAR(1000)
	)

	DELETE TRATAMENTO_ERRO_BSILVA
*/
/************************************************************************************************************************************************
																									CRIANDO PROCEDURE PARA ALIMENTAR LOG
*************************************************************************************************************************************************/
/*
IF OBJECT_ID('[SP_TRATAMENTO_ERRO_BSILVA]', 'P') IS NOT NULL
	DROP PROCEDURE [SP_TRATAMENTO_ERRO_BSILVA];
GO

CREATE PROCEDURE [SP_TRATAMENTO_ERRO_BSILVA]
AS
INSERT INTO [TRATAMENTO_ERRO_BSILVA] 
SELECT 
 GETDATE()					AS DATAERRO
,ERROR_LINE()				AS ERRORLINE
,ERROR_MESSAGE()		AS ERRORMESSAGE
,ERROR_NUMBER()			AS ERRORNUMBER
,ERROR_PROCEDURE()	AS ERRORPROCEDURE

,CASE 
		 WHEN ERROR_SEVERITY() >=0 AND ERROR_SEVERITY() <=9		THEN '0-9: Mensagens informativas que retornam informa��es de status ou reportam erros que n�o sejam severos'
		 WHEN ERROR_SEVERITY() =10														THEN '10 : Mensagens informativas que retornam informa��es de status ou reportam erros que n�o sejam severos'

		 WHEN ERROR_SEVERITY() =11														THEN '11 : Erros que podem ser corrigidos pelo usu�rio - Indica que um determinado objeto ou entidade n�o existe'
		 WHEN ERROR_SEVERITY() =12														THEN '12 : Erros que podem ser corrigidos pelo usu�rio - Severidade especial para consultas que n�o usam bloqueio por causa de dicas de consulta especiais'
		 WHEN ERROR_SEVERITY() =13														THEN '13 : Erros que podem ser corrigidos pelo usu�rio - Indica erros de deadlock de transa��o.'
		 WHEN ERROR_SEVERITY() =14														THEN '14 : Erros que podem ser corrigidos pelo usu�rio - Indica erros relacionados � seguran�a, como uma permiss�o negada'
		 WHEN ERROR_SEVERITY() =15														THEN '15 : Erros que podem ser corrigidos pelo usu�rio - Indica erros de sintaxe no comando Transact-SQL'
		 WHEN ERROR_SEVERITY() =16														THEN '16 : Erros que podem ser corrigidos pelo usu�rio - Indica erros gerais que podem ser corrigidos pelo usu�rio'

		 WHEN ERROR_SEVERITY() =17														THEN 'DBA 17 : Indica erros de software que n�o podem ser corrigidos pelo usu�rio - Indica que a instru��o fez o SQL Server ficar sem recursos'
		 WHEN ERROR_SEVERITY() =18														THEN 'DBA 18 : Indica erros de software que n�o podem ser corrigidos pelo usu�rio - Indica um problema no software Mecanismo de Banco de Dados'
		 WHEN ERROR_SEVERITY() =19														THEN 'DBA 19 : Indica erros de software que n�o podem ser corrigidos pelo usu�rio - Indica que um limite do Mecanismo de Banco de Dados n�o configur�vel foi excedido e que o processo em lotes atual foi encerrado'

		 WHEN ERROR_SEVERITY() =20														THEN 'DBA 20 : Indique problemas de sistema que s�o erros fatais - Indica que uma instru��o encontrou um problema. Como o problema afetou apenas a tarefa atual, � improv�vel que o banco de dados tenha sido danificado'
		 WHEN ERROR_SEVERITY() =21														THEN 'DBA 21 : Indique problemas de sistema que s�o erros fatais - Indica que foi encontrado um problema que afeta todas as tarefas no banco de dados atual, mas � improv�vel que o banco de dados tenha sido danificado'
		 WHEN ERROR_SEVERITY() =22														THEN 'DBA 22 : Indique problemas de sistema que s�o erros fatais - Indica que a tabela ou o �ndice especificado na mensagem foi danificado por um problema de software ou hardware.'
		 WHEN ERROR_SEVERITY() =23														THEN 'DBA 23 : Indique problemas de sistema que s�o erros fatais - Indica que a integridade do banco de dados inteiro est� em risco por um problema de software ou hardware'
		 WHEN ERROR_SEVERITY() =24														THEN 'DBA 24 : Indique problemas de sistema que s�o erros fatais - Indica uma falha de m�dia. O administrador de sistema pode ter que restaurar o banco de dados. Tamb�m pode ser necess�rio contatar o seu fornecedor de hardware'
 END AS ERRORSEVERITY


,ERROR_STATE()			AS ERRORSTATE


,CASE
			WHEN ERROR_NUMBER() = '8134' THEN 'NULLIF(divisor, 0)'
 END AS 'SOLUCAO';
 */
/************************************************************************************************************************************************
																										CRIANDO PROCEDURE PARA TESTAR LOG
*************************************************************************************************************************************************/
/*
IF OBJECT_ID('[SP_TRATAMENTO_ERRO_BSILVA_SAMPLE]', 'P') IS NOT NULL
	DROP PROCEDURE [SP_TRATAMENTO_ERRO_BSILVA_SAMPLE];
GO
CREATE PROCEDURE [SP_TRATAMENTO_ERRO_BSILVA_SAMPLE]
AS
begin try
select 357/0;
end try
begin catch
SELECT 'Erro adicionado ao LOG';
EXEC [SP_TRATAMENTO_ERRO_BSILVA];
end catch
*/
/************************************************************************************************************************************************
																										CRIANDO PROCEDURE PARA TESTAR LOG
*************************************************************************************************************************************************/
EXEC [SP_TRATAMENTO_ERRO_BSILVA_SAMPLE]

SELECT * FROM TRATAMENTO_ERRO_BSILVA