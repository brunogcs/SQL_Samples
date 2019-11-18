/*============================================================================================================================================
																								Step 1: CREATE TEMPORARY TABLE
==============================================================================================================================================*/

/*
create table #test_transaction
(
 id_tt					int not null primary key --identity(1,1)
,numero_tt			int
,nome_numero_tt varchar(100)
)

DROP TABLE #test_transaction

select * from #test_transaction
*/

/*============================================================================================================================================
																								Step 2: TESTING AN TRANSACTION
==============================================================================================================================================*/

BEGIN TRAN INSERT_test_transaction

INSERT INTO #test_transaction VALUES (4,4,'QUATRO')

IF @@ERROR = 0 
COMMIT;
ELSE
ROLLBACK;