--------------------------------------------------------
--  DDL for Table SRI_FORMA_PAGO_VENTA
--------------------------------------------------------
--drop table SRI_FORMA_PAGO_VENTA;
  CREATE TABLE "SRI_FORMA_PAGO_VENTA" 
   (	"ID_DETALLE" NUMBER, 
	"CODIGO" VARCHAR2(20 BYTE)
   ) TABLESPACE "DATOS" ;
--------------------------------------------------------
--  Constraints for Table SRI_FORMA_PAGO_VENTA
--------------------------------------------------------

  ALTER TABLE "SRI_FORMA_PAGO_VENTA" MODIFY ("ID_DETALLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SRI_FORMA_PAGO_VENTA
--------------------------------------------------------

  ALTER TABLE "SRI_FORMA_PAGO_VENTA" ADD CONSTRAINT "FK_SRI_FORMA_PAGO_VENTA" FOREIGN KEY ("ID_DETALLE")
	  REFERENCES "SRI_DETALLE_VENTA" ("ID") ON DELETE CASCADE ENABLE;
