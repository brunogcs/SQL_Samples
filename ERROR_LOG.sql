/*============================================================================================================================================
																										Step 1: CREATE ERROR LOG TABLE
==============================================================================================================================================*/
	CREATE TABLE ##GITHUB_ERROR_LOG(
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
/*============================================================================================================================================
																					Step 2: CREATE STORED PROCEDURE TO PUT INFORMATION ON LOG TABLE
==============================================================================================================================================*/
IF OBJECT_ID('[SP_GITHUB_ERROR_LOG]', 'P') IS NOT NULL
	DROP PROCEDURE [SP_GITHUB_ERROR_LOG];
GO

CREATE PROCEDURE [SP_GITHUB_ERROR_LOG]
AS
INSERT INTO [##GITHUB_ERROR_LOG] 
SELECT 
 GETDATE()					AS DATAERRO
,ERROR_LINE()				AS ERRORLINE
,ERROR_MESSAGE()		AS ERRORMESSAGE
,ERROR_NUMBER()			AS ERRORNUMBER
,ERROR_PROCEDURE()	AS ERRORPROCEDURE

,CASE 
		 WHEN ERROR_SEVERITY() >=0 AND ERROR_SEVERITY() <=9		THEN '0-9: Mensagens informativas que retornam informações de status ou reportam erros que não sejam severos'
		 WHEN ERROR_SEVERITY() =10														THEN '10 : Mensagens informativas que retornam informações de status ou reportam erros que não sejam severos'

		 WHEN ERROR_SEVERITY() =11														THEN '11 : Erros que podem ser corrigidos pelo usuário - Indica que um determinado objeto ou entidade não existe'
		 WHEN ERROR_SEVERITY() =12														THEN '12 : Erros que podem ser corrigidos pelo usuário - Severidade especial para consultas que não usam bloqueio por causa de dicas de consulta especiais'
		 WHEN ERROR_SEVERITY() =13														THEN '13 : Erros que podem ser corrigidos pelo usuário - Indica erros de deadlock de transação.'
		 WHEN ERROR_SEVERITY() =14														THEN '14 : Erros que podem ser corrigidos pelo usuário - Indica erros relacionados à segurança, como uma permissão negada'
		 WHEN ERROR_SEVERITY() =15														THEN '15 : Erros que podem ser corrigidos pelo usuário - Indica erros de sintaxe no comando Transact-SQL'
		 WHEN ERROR_SEVERITY() =16														THEN '16 : Erros que podem ser corrigidos pelo usuário - Indica erros gerais que podem ser corrigidos pelo usuário'

		 WHEN ERROR_SEVERITY() =17														THEN 'DBA 17 : Indica erros de software que não podem ser corrigidos pelo usuário - Indica que a instrução fez o SQL Server ficar sem recursos'
		 WHEN ERROR_SEVERITY() =18														THEN 'DBA 18 : Indica erros de software que não podem ser corrigidos pelo usuário - Indica um problema no software Mecanismo de Banco de Dados'
		 WHEN ERROR_SEVERITY() =19														THEN 'DBA 19 : Indica erros de software que não podem ser corrigidos pelo usuário - Indica que um limite do Mecanismo de Banco de Dados não configurável foi excedido e que o processo em lotes atual foi encerrado'

		 WHEN ERROR_SEVERITY() =20														THEN 'DBA 20 : Indique problemas de sistema que são erros fatais - Indica que uma instrução encontrou um problema. Como o problema afetou apenas a tarefa atual, é improvável que o banco de dados tenha sido danificado'
		 WHEN ERROR_SEVERITY() =21														THEN 'DBA 21 : Indique problemas de sistema que são erros fatais - Indica que foi encontrado um problema que afeta todas as tarefas no banco de dados atual, mas é improvável que o banco de dados tenha sido danificado'
		 WHEN ERROR_SEVERITY() =22														THEN 'DBA 22 : Indique problemas de sistema que são erros fatais - Indica que a tabela ou o índice especificado na mensagem foi danificado por um problema de software ou hardware.'
		 WHEN ERROR_SEVERITY() =23														THEN 'DBA 23 : Indique problemas de sistema que são erros fatais - Indica que a integridade do banco de dados inteiro está em risco por um problema de software ou hardware'
		 WHEN ERROR_SEVERITY() =24														THEN 'DBA 24 : Indique problemas de sistema que são erros fatais - Indica uma falha de mídia. O administrador de sistema pode ter que restaurar o banco de dados. Também pode ser necessário contatar o seu fornecedor de hardware'
 END AS ERRORSEVERITY


,ERROR_STATE()			AS ERRORSTATE


,CASE
			WHEN ERROR_NUMBER() = '8134' THEN 'NULLIF(divisor, 0)'
 END AS 'SOLUCAO';
/*============================================================================================================================================
																					Step 3: CREATE STORED PROCEDURE TO TEST THE LOG
==============================================================================================================================================*/
IF OBJECT_ID('[SP_GITHUB_ERROR_LOG_TEST]', 'P') IS NOT NULL
	DROP PROCEDURE [SP_GITHUB_ERROR_LOG_TEST];
GO
CREATE PROCEDURE [SP_GITHUB_ERROR_LOG_TEST]
AS
begin try
select 357/0;
end try
begin catch
SELECT 'Erro adicionado ao LOG';
EXEC [SP_GITHUB_ERROR_LOG];
end catch
/*============================================================================================================================================
																										Step 4: EXECUTING TESTS
==============================================================================================================================================*/
EXEC [SP_GITHUB_ERROR_LOG_TEST]

SELECT * FROM ##GITHUB_ERROR_LOG
