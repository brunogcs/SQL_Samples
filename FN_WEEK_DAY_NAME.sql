/*============================================================================================================================================
																								Step 1: FUNCTION TO PUT	DAY NAME AND MONTH NAME
==============================================================================================================================================*/

/*
CREATE FUNCTION FN_DIA_SEMANA_EXT
(
	@DATA DATETIME
) 
RETURNS VARCHAR (50)  
AS
BEGIN
  DECLARE @DIA INT,
   @DIA_EXT VARCHAR(50)
   
  SELECT @DIA = (DATEPART(DW,@DATA ))
   IF @DIA=1 
    SET @DIA_EXT = concat('Domingo, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
  IF @DIA=2  
     SET @DIA_EXT =concat('Segunda Feira, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
  IF @DIA=3  
     SET @DIA_EXT =concat('Terça Feira, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
  IF @DIA=4  
     SET @DIA_EXT =concat('Quarta-Feira, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
  IF @DIA=5  
     SET @DIA_EXT =concat('Quinta-Feira, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
  IF @DIA=6  
     SET @DIA_EXT =concat('Sexta-Feira, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data)))
  IF @DIA=7  
     SET @DIA_EXT =concat('Sabado, ',convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data))) 
   RETURN @DIA_EXT
END
*/

/*============================================================================================================================================
																													Step 2: EXECUTING TESTS
==============================================================================================================================================*/

set language brazilian
Select FN_DIA_SEMANA_EXT('2019-01-01')