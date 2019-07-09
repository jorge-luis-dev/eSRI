--------------------------------------------------------
--  DDL for View V_SRI_COMPRAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_SRI_COMPRAS" ("CODIGO", "NUMERO", "ANO", "MES", "SUSTENTO", "TIPO_DOCUMENTO", "DOCUMENTO", "RELACIONADO", "TIPO_COMPROBANTE", "FECHA", "ESTABLECIMIENTO", "PUNTO_EMISION", "SECUENCIAL", "AUTORIZACION", "BASE_NO_IVA", "BASE_IVA_0", "BASE_GRABA", "BASE_EXENTA", "ICE", "IVA", "REEMBOLSO") AS 
  with data as(
SELECT i.COD_DOCUMENTO codigo,
  i.NUM_DOCUMENTO numero,
  TO_CHAR(i.FECHA_EMISION, 'rrrr') ano,
  TO_CHAR(i.FECHA_EMISION, 'mm') mes,
  NVL(i.COD_SUSTENTO, '01') sustento,
  DECODE(p.COD_DOCUMENTO, 1, '01', 2, '02', 3, '03', '03') tipo_documento,
  p.DOCUMENTO,
  'NO' relacionado,
  TO_CHAR(NVL(i.COD_TIPOCOMPROBANTE, 1), 'fm00') tipo_comprobante,
  i.FECHA_EMISION fecha,
  SUBSTR(i.REFERENCIA, 1, 3) establecimiento,
  SUBSTR(i.REFERENCIA, 5, 3) punto_emision,
  SUBSTR(i.REFERENCIA, 9, 9) secuencial,
  i.AUTO_CONT_IMPR_DOC autorizacion,
  0 base_no_iva,
  SUM(DECODE(d.PORCENTAJE_IVA,0,d.COSTO_UNITARIO  *d.AUX_CANTIDAD,0)) base_iva_0,
  SUM(DECODE(d.PORCENTAJE_IVA,0,0,d.COSTO_UNITARIO*d.AUX_CANTIDAD)) base_graba,
  0 base_exenta,
  0 ICE,
  i.IVA,
  0 reembolso
FROM INV_MOVIMIENTO_CAB i
INNER JOIN INV_MOVIMIENTO_DTLL d
ON i.COD_EMPRESA    = d.COD_EMPRESA
AND i.COD_DOCUMENTO = d.COD_DOCUMENTO
AND i.NUM_DOCUMENTO = d.NUM_DOCUMENTO
INNER JOIN V_PROVEEDOR p
ON p.COD_EMPRESA      = i.COD_EMPRESA
AND p.COD_PROVEEDOR   = i.COD_PROVEEDOR
WHERE i.COD_DOCUMENTO   = 'ENI'
AND i.COD_MOVIMIENTO IN
  (SELECT inv_transacciones.COD_MOVIMIENTO
  FROM inv_transacciones
  WHERE inv_transacciones.COD_EMPRESA   = '01'
  AND inv_transacciones.DESC_MOVIMIENTO = 'COMPRAS'
  )
AND NVL(i.ESTADO, 'G') <> 'A'
GROUP BY i.COD_DOCUMENTO,
  i.NUM_DOCUMENTO ,
  TO_CHAR(i.FECHA_EMISION, 'rrrr') ,
  TO_CHAR(i.FECHA_EMISION, 'mm') ,
  NVL(i.COD_SUSTENTO, '01') ,
  DECODE(p.COD_DOCUMENTO, 1, '01', 2, '02', 3, '03', '03') ,
  p.DOCUMENTO,
  'NO' ,
  TO_CHAR(NVL(i.COD_TIPOCOMPROBANTE, 1), 'fm00') ,
  i.FECHA_EMISION ,
  SUBSTR(i.REFERENCIA, 1, 3) ,
  SUBSTR(i.REFERENCIA, 5, 3) ,
  SUBSTR(i.REFERENCIA, 9, 9) ,
  i.AUTO_CONT_IMPR_DOC ,
  0 ,
  0 ,
  0 ,
  i.IVA,
  0 
  UNION
  
SELECT d.COD_DOCUMENTO             AS codigo,
  d.NUM_DOCUMENTO                  AS numero,
  TO_CHAR(d.FECHA_EMISION, 'rrrr') AS ano,
  TO_CHAR(d.FECHA_EMISION, 'mm')   AS mes,
  d.COD_SUSTENTO sustento,
  DECODE(p.COD_DOCUMENTO,1,'01',2,'02',3,'03','03') tipo_documento,
  p.DOCUMENTO,
  'NO' relacionado,
  to_char(nvl(d.COD_TIPOCOMPROBANTE,1),'fm00') tipo_comprobante,
  d.FECHA_EMISION fecha,
  SUBSTR(d.referencia,1,3) establecimiento,
  SUBSTR(d.referencia,5,3) punto_emision,
  SUBSTR(d.referencia,9,9) secuencial,
  d.NUMERO_AUTORIZACION_DOC autorizacion,
  0 base_no_iva,
  d.BASE_IMPONIBLE_CERO base_iva_0,
  d.BASE_IMPONIBLE base_graba,
  0 base_exenta,
  0 ICE,
  d.IVA_DOCUMENTO IVA,
  DECODE(d.COD_TIPOCOMPROBANTE,41,d.BASE_IMPONIBLE_CERO+d.BASE_IMPONIBLE,0) reembolso
FROM CXP_DOC_PAGAR d
INNER JOIN V_PROVEEDOR p
ON d.COD_PROVEEDOR  = p.COD_PROVEEDOR
WHERE d.cod_empresa ='01'
AND d.cod_documento ='NDP'
AND d.cod_sustento <>'00'
and nvl(d.ESTADO,'G')<>'A'

union

SELECT e.COD_DOCUMENTO codigo,
e.NUM_DOCUMENTO numero,
TO_CHAR(e.FECHA_DOCUMENTO,'rrrr') ano,
TO_CHAR(e.FECHA_DOCUMENTO,'mm') mes,
e.cod_sustento,
decode(e.COD_PROVEEDOR,null,decode(length(e.RUC_CI),13,'01',10,'02',03),decode(length(pkg_proveedor.fun_get_documento(e.COD_PROVEEDOR)),13,'01',10,'02',03)) tipo_documento,
decode(e.COD_PROVEEDOR,null,e.RUC_CI,pkg_proveedor.fun_get_documento(e.COD_PROVEEDOR)) DOCUMENTO,
'NO' relacionado,
to_char(nvl(e.COD_TIPOCOMPROBANTE,1),'fm00') tipo_comprobante,
e.FECHA_DOCUMENTO fecha,
  SUBSTR(e.actividad,1,3) establecimiento,
  SUBSTR(e.actividad,5,3) punto_emision,
  SUBSTR(e.actividad,9,9) secuencial,
  e.AUTORIZACION,
  0 base_no_iva,
  e.BASE_IMPONIBLE_CERO base_iva_0,
  e.BASE_IMPONIBLE base_graba,
  0 base_exenta,
  0 ICE,
  e.MONTO_IVA iva,
  DECODE(e.COD_TIPOCOMPROBANTE,41,e.BASE_IMPONIBLE_CERO+e.BASE_IMPONIBLE,0) reembolso
FROM ban_egreso e
WHERE e.cod_empresa   ='01'
AND e.cod_sustento   <>'00'--"No aplica" en el ingreso del CPA opcion "Sustento Tibutario"
AND NVL(e.estado,'G')<>'A'
union
SELECT c.cod_documento codigo,
  c.num_documento numero,
  TO_CHAR(c.fecha_emision,'rrrr') anio,
  TO_CHAR(c.fecha_emision,'mm') mes,
  NVL(c.COD_SUSTENTO,'01') sustento,
  DECODE(p.COD_DOCUMENTO,1,'01',2,'02',3,'03','03') tipo_documento,
  p.DOCUMENTO,
  'NO' relacionado,
  TO_CHAR(NVL(c.COD_TIPOCOMPROBANTE,'04'),'fm00') tipo_comprobante,
  c.fecha_emision fecha,
  SUBSTR(c.referencia,1,3) establecimiento,
  SUBSTR(c.referencia,5,3) punto_emision,
  SUBSTR(c.referencia,9,9) secuencial,
  c.auto_cont_impr_doc autorizacion,
  0 base_no_iva,
  SUM(DECODE(d.porcentaje_iva,0,d.costo_total,0)) base_iva_0,

  SUM(DECODE(d.porcentaje_iva,0,0,d.costo_total)) base_graba,
  0 base_exenta,
  0 ICE,
  c.iva,
    0 reembolso
FROM inv_movimiento_cab c,
  inv_movimiento_dtll d,
  V_PROVEEDOR p
WHERE c.cod_empresa   = d.cod_empresa
AND c.cod_documento   = d.cod_documento
AND c.num_documento   = d.num_documento
AND p.COD_EMPRESA     =c.cod_empresa
AND p.COD_PROVEEDOR   =c.COD_PROVEEDOR
AND c.cod_documento   ='SAI'
AND c.cod_movimiento IN
  (SELECT t.cod_movimiento
  FROM inv_transacciones t
  WHERE t.cod_empresa  ='01'
  AND t.desc_movimiento='DEVOL.COMPRAS'
  )
AND NVL(c.estado,'G')               <>'A'
GROUP BY c.cod_documento ,
  c.num_documento ,
  TO_CHAR(c.fecha_emision,'rrrr') ,
  TO_CHAR(c.fecha_emision,'mm') ,
  NVL(c.COD_SUSTENTO,'01') ,
  DECODE(p.COD_DOCUMENTO,1,'01',2,'02',3,'03','03') ,
  p.DOCUMENTO,
  'NO' ,
  TO_CHAR(NVL(c.COD_TIPOCOMPROBANTE,'04'),'fm00') ,
  c.fecha_emision ,
  SUBSTR(c.referencia,1,3) ,
  SUBSTR(c.referencia,5,3) ,
  SUBSTR(c.referencia,9,9) ,
  c.auto_cont_impr_doc ,
  0 ,
  0 ,
  0 ,
  c.iva,
    0 
)
select  CODIGO,
  NUMERO,
   ano,
  mes,
  sustento,
  tipo_documento,
  documento,
  relacionado,
   tipo_comprobante,
   fecha,
   establecimiento,
  punto_emision,
  secuencial,
  autorizacion,
  base_no_iva,
  base_iva_0,
  base_graba,
  base_exenta,
  ice,
  iva,
  reembolso
  from data;
