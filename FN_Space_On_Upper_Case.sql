/*============================================================================================================================================
																										Step 1: FUNCTION SPACE ON UPPER CASE
==============================================================================================================================================*/
/*
CREATE FUNCTION [FN_Space_On_Upper_Case]
(
	@Temp VARCHAR(1000)
)
RETURNS VARCHAR(1000)
AS
BEGIN
DECLARE @KeepValues AS VARCHAR(50)
SET @KeepValues='%[^ ][A-Z]%'
WHILE PATINDEX(@KeepValues COLLATE Latin1_General_Bin,@Temp)>0
SET @Temp=STUFF(@Temp,PATINDEX(@KeepValues COLLATE Latin1_General_Bin,@Temp)+1,0,' ')
RETURN @Temp
END
*/
/*============================================================================================================================================
																										Step 2: EXECUTING TESTS
==============================================================================================================================================*/

select [FN_Space_On_Upper_Case]('saiBarathon')