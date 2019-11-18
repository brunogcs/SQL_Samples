/*============================================================================================================================================
																								Step 1: CREATE TYPE TABLE
==============================================================================================================================================*/
CREATE TYPE [TY_TYPE_TABLE] AS TABLE(
  TY_material							varchar(8)
,	TY_planta               varchar(4)
, TY_teorico							decimal(16,6)
, TY_medida								varchar(2)
, TY_estoque              decimal(18,3)
, TY_faturado             decimal(15,3)
, TY_materia							varchar(4000)
)
GO