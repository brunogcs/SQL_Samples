/*============================================================================================================================================
																								Step 1: EOMONTH (VERSION > 2016 )
==============================================================================================================================================*/

SELECT EOMONTH ( GETDATE(), 0 ) AS Result

/*============================================================================================================================================
																								Step 2: EOMONTH MANUAL FUNCTION (VERSION <= 2016 )
==============================================================================================================================================*/
/*
CREATE FUNCTION [FN_EOMONTH] 
(
  @DATA_REAL                          DATETIME
)

RETURNS  DATE
AS
BEGIN 

DECLARE @DATE_LAST_DAY DATE; 
 
--SELECT EOMONTH ( @date ) AS Result;

select @DATE_LAST_DAY = DATEADD(SECOND,-1,DATEADD(MONTH,DATEDIFF(MONTH,0,@DATA_REAL)+1,0))



RETURN @DATE_LAST_DAY
END
*/



select (DAY(FN_EOMONTH(GETDATE())) - DAY(GETDATE())) AS 'How many days rest until the EOMONTH'
			,DAY(FN_EOMONTH(DATEADD(MM,0,GETDATE())))			AS 'How many days we have in this month'
			,FN_EOMONTH(DATEADD(MM,1,GETDATE()))						AS 'Complete date with the last day'