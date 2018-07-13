--------------------------------------------------------
--  DDL for Table SRI_FORMA_PAGO_COMPRA
--------------------------------------------------------

  CREATE TABLE "SRI_FORMA_PAGO_COMPRA" 
   (	"ID_DETALLE" NUMBER, 
	"CODIGO" VARCHAR2(20 BYTE)
   ) TABLESPACE "DATOS" ;
--------------------------------------------------------
--  Constraints for Table SRI_FORMA_PAGO_COMPRA
--------------------------------------------------------

  ALTER TABLE "SRI_FORMA_PAGO_COMPRA" MODIFY ("ID_DETALLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SRI_FORMA_PAGO_COMPRA
--------------------------------------------------------

  ALTER TABLE "SRI_FORMA_PAGO_COMPRA" ADD CONSTRAINT "FK_SRI_FORMA_PAGO_COMPRA" FOREIGN KEY ("ID_DETALLE")
	  REFERENCES "SRI_DETALLE_COMPRA" ("ID") ON DELETE CASCADE ENABLE;
