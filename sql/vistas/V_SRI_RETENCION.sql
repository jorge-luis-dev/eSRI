--------------------------------------------------------
--  DDL for View V_SRI_RETENCION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_SRI_RETENCION" ("CODIGO", "NUMERO", "NUMERO_RETENCION", "TIPO", "CODIGO_SRI", "VALOR_BASE", "PORCENTAJE", "VALOR_RETENIDO") AS 
  SELECT m.COD_DOCUMENTO as codigo,
  m.NUM_DOCUMENTO as numero,
  m.NUM_RETENCION as numero_retencion,
  t.TIPO_IMPUESTO as tipo,
    t.COD_SRI codigo_sri,
  d.VALOR_BASE,
  d.PORC_RETENCION porcentaje,
  d.VALOR_RETENIDO

FROM BAN_RETENCION_C m
INNER JOIN BAN_RETENCION_D d
ON m.COD_EMPRESA    = d.COD_EMPRESA
AND m.NUM_RETENCION = d.NUM_RETENCION
INNER JOIN BAN_TIPO_RETENCION t
ON t.COD_RETENCION = d.COD_RETENCION
AND t.COD_EMPRESA  = d.COD_EMPRESA
where nvl(m.ESTADO,'G')<>'A';
