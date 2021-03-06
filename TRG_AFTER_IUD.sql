/*============================================================================================================================================
																								Step 1: CREATE TEMP TABLE
==============================================================================================================================================*/
/*
create table TRG_BFR_ORIGEM_BSILVA
(
 id_tt					int not null primary key
,numero_tt			int
,nome_numero_tt varchar(100)
)

create table TRG_BFR_DESTINO_BSILVA
(
 id_tt					int not null primary key
,numero_tt			int
,nome_numero_tt varchar(100)
,Acao						char(1)
)
*/
/*============================================================================================================================================
																								Step 2: CREATE THE TRIGGER
==============================================================================================================================================*/
/*
CREATE TRIGGER [TRG_IUD_TEST]  
   ON  TRG_BFR_ORIGEM_BSILVA
   AFTER INSERT,DELETE,UPDATE  
AS   
BEGIN  
  
 SET NOCOUNT ON;  
  
 --insert   
 INSERT INTO TRG_BFR_DESTINO_BSILVA(	id_tt ,	numero_tt ,	nome_numero_tt ,Acao)  
 SELECT i.id_tt ,	i.numero_tt ,	i.nome_numero_tt , 'I'  
 FROM inserted i  
 LEFT JOIN deleted  d ON i.id_tt = d.id_tt 
											and i.numero_tt = d.numero_tt 
											and i.nome_numero_tt = d.nome_numero_tt
 WHERE d.id_tt IS NULL  
  
 --update  
 INSERT INTO TRG_BFR_DESTINO_BSILVA(	id_tt ,	numero_tt ,	nome_numero_tt ,Acao)  
 SELECT i.id_tt ,	i.numero_tt ,	i.nome_numero_tt , 'U'       
 FROM inserted i    
  INNER JOIN deleted d ON i.id_tt = d.id_tt 
											and i.numero_tt = d.numero_tt 
											and i.nome_numero_tt = d.nome_numero_tt
  
 --delete  
 INSERT INTO TRG_BFR_DESTINO_BSILVA(	id_tt ,	numero_tt ,	nome_numero_tt ,Acao)  
 SELECT i.id_tt ,	i.numero_tt ,	i.nome_numero_tt , 'D'      
 FROM deleted d  
  LEFT JOIN inserted i ON i.id_tt = d.id_tt 
											and i.numero_tt = d.numero_tt 
											and i.nome_numero_tt = d.nome_numero_tt
  
 WHERE i.id_tt IS NULL  
   
END  
*/    
/*============================================================================================================================================
																								Step 3: TESTING TRIGGER TRIGGER
==============================================================================================================================================*/

INSERT INTO TRG_BFR_ORIGEM_BSILVA VALUES (2,2,'DOIS')

SELECT * FROM TRG_BFR_DESTINO_BSILVA