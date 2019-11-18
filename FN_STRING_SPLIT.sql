/*============================================================================================================================================
																				Step 1: TURN STRING INTO COLUMNS USING A SEPARATOR (VERSION >= 2016 )
==============================================================================================================================================*/

SELECT value FROM STRING_SPLIT( '1;2;3' , ';' );

/*============================================================================================================================================
																				Step 2: TURN STRING INTO COLUMNS USING A SEPARATOR (VERSION <= 2016 )
==============================================================================================================================================*/
/*
CREATE FUNCTION [FN_SplitString]
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(1000)
)
AS
BEGIN
      DECLARE @StartIndex INT, @EndIndex INT

      SET @StartIndex = 1
      IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
      BEGIN
            SET @Input = @Input + @Character
      END

      WHILE CHARINDEX(@Character, @Input) > 0
      BEGIN
            SET @EndIndex = CHARINDEX(@Character, @Input)

            INSERT INTO @Output(Item)
            SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)

            SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
      END

      RETURN
END
*/


DECLARE 
@ID VARCHAR(500) = '1;2;3'
select Item from FN_SplitString(@ID,';')