--------------------------------------------------------
--  DDL for View V_SRI_ANULADOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_SRI_ANULADOS" ("ID", "CODIGO", "NUMERO", "TIPO_COMPROBANTE", "ANIO", "MES", "ESTABLECIMIENTO", "PUNTO_EMISION", "SECUNCIAL", "AUTORIZACION") AS 
  with data as(
SELECT rownum id,
  COD_DOCUMENTO codigo,
  NUM_FACTURA numero,
  '18' tipo_comprobante,
  TO_CHAR(FECHA_FACTURA,'rrrr') anio,
  TO_CHAR(FECHA_FACTURA,'mm') mes,
  NVL(pkg_sri.fun_get_establecimiento_venta(COD_DOCUMENTO,NUM_FACTURA),'999') establecimiento,
  NVL(pkg_sri.fun_get_punto_emision_venta(COD_DOCUMENTO,NUM_FACTURA),'999') punto_emision,
  NUM_FACTURA secuncial,
  NVL(pkg_sri.fun_get_autorizacion_venta(COD_DOCUMENTO,NUM_FACTURA),'9999999999') autorizacion
FROM fac_factura_c
WHERE cod_empresa   ='01'
AND cod_documento   ='FAC'
AND NVL(estado,'G') ='A'
UNION
SELECT rownum,
  'RET',
  NUM_RETENCION,
  '07',
  TO_CHAR(FECHA_RETENCION,'rrrr') anio,
  TO_CHAR(FECHA_RETENCION,'mm') mes,
  NVL(pkg_sri.fun_get_establecimiento_venta('RET',NUM_RETENCION),'999') establecimiento,
  NVL(pkg_sri.fun_get_punto_emision_venta('RET',NUM_RETENCION),'999') punto_emision,
  NUM_RETENCION secuncial,
  NVL(pkg_sri.fun_get_autorizacion_venta('RET',NUM_RETENCION),'9999999999') autorizacion
FROM ban_retencion_c
WHERE cod_empresa   ='01'
AND NVL(estado,'G') ='A'
)
select  id,
  codigo,
   numero,
  tipo_comprobante,
  anio,
  mes,
  establecimiento,
  punto_emision,
   secuncial,
   autorizacion
  from data;
