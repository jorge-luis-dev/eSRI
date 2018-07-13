--------------------------------------------------------
--  DDL for Table SRI_DETALLE_RETENCION
--------------------------------------------------------

  CREATE TABLE "SRI_DETALLE_RETENCION" 
   (	"ID_DETALLE_COMPRA" NUMBER, 
	"CODRETAIR" VARCHAR2(10 BYTE), 
	"BASEIMPAIR" NUMBER DEFAULT 0, 
	"PORCENTAJEAIR" NUMBER DEFAULT 0, 
	"VALRETAIR" NUMBER DEFAULT 0
   )  TABLESPACE "DATOS" ;
--------------------------------------------------------
--  Constraints for Table SRI_DETALLE_RETENCION
--------------------------------------------------------

  ALTER TABLE "SRI_DETALLE_RETENCION" MODIFY ("CODRETAIR" NOT NULL ENABLE);
  ALTER TABLE "SRI_DETALLE_RETENCION" MODIFY ("ID_DETALLE_COMPRA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SRI_DETALLE_RETENCION
--------------------------------------------------------

  ALTER TABLE "SRI_DETALLE_RETENCION" ADD CONSTRAINT "FK_SRI_DETALLE_RETENCION" FOREIGN KEY ("ID_DETALLE_COMPRA")
	  REFERENCES "SRI_DETALLE_COMPRA" ("ID") ON DELETE CASCADE ENABLE;
