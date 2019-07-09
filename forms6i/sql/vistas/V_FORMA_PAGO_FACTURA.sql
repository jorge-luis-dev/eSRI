--------------------------------------------------------
-- Archivo creado  - miércoles-octubre-12-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View V_FORMA_PAGO_FACTURA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_FORMA_PAGO_FACTURA" ("PAGO", "FORMA_PAGO", "CODIGO", "FACTURA", "PLAZO", "TIEMPO","CLIENTE","FECHA") AS 
SELECT
    NVL(EFECTIVO,0)                          AS pago,
    'SIN UTILIZACION DEL SISTEMA FINANCIERO' AS forma_pago,
    '01'                                     AS codigo,
    num_pago,
    0 PLAZO,
    'Días' TIEMPO,
    COD_CLIENTE cliente,
    FECHA_DOCUMENTO FECHA
  FROM
    CXC_PAGO_CONTADO
  WHERE
    COD_DOCUMENTO    ='FAC'
  AND NVL(EFECTIVO,0)>0
  UNION

  /*
  select 0, 'Dinero electrónico','17' as codigo,num_pago
  from CXC_PAGO_CONTADO
  where COD_DOCUMENTO='FAC'
  union
  */
  SELECT
    NVL(tarjeta,0),
    'TARJETA DE CRÉDITO',
    '19' AS codigo,
    num_pago,
    0,
    'Días',
    COD_CLIENTE,
    FECHA_DOCUMENTO
  FROM
    CXC_PAGO_CONTADO
  WHERE
    COD_DOCUMENTO   ='FAC'
  AND NVL(tarjeta,0)>0
  UNION
  SELECT
    NVL(CHEQUES,0),
    ' OTROS CON UTILIZACION DEL SISTEMA FINANCIERO',
    '20' AS codigo,
    num_pago,
    0,
    'Días',
    COD_CLIENTE,
    FECHA_DOCUMENTO
  FROM
    CXC_PAGO_CONTADO
  WHERE
    COD_DOCUMENTO   ='FAC'
  AND NVL(CHEQUES,0)>0
  UNION
  SELECT
    NVL(DEPOSITO,0),
    ' OTROS CON UTILIZACION DEL SISTEMA FINANCIERO',
    '20' AS codigo,
    num_pago,
    0,
    'Días',
    COD_CLIENTE,
    FECHA_DOCUMENTO
  FROM
    CXC_PAGO_CONTADO
  WHERE
    COD_DOCUMENTO    ='FAC'
  AND NVL(DEPOSITO,0)>0
  UNION
  SELECT
    NVL(f.credito,0),
    ' OTROS CON UTILIZACION DEL SISTEMA FINANCIERO',
    '20' AS codigo,
    f.num_pago,
    (
      SELECT
        max(cxc.DIAS_PLAZO)
      FROM
        CXC_DOC_COBRAR cxc
      WHERE
        cxc.COD_DOCUMENTO  ='FAC'
      AND cxc.NUM_DOCUMENTO=f.num_pago
    ),
    'Días',
    COD_CLIENTE,
    FECHA_DOCUMENTO
  FROM
    CXC_PAGO_CONTADO f
  WHERE
    f.COD_DOCUMENTO   ='FAC'
  AND NVL(f.credito,0)>0
  UNION
  SELECT
    NVL(f.OTROS,0),
    ' OTROS CON UTILIZACION DEL SISTEMA FINANCIERO',
    '20' AS codigo,
    f.num_pago,
    0,
    'Días',
    COD_CLIENTE,
    FECHA_DOCUMENTO
  FROM
    CXC_PAGO_CONTADO f
  WHERE
    f.COD_DOCUMENTO   ='FAC'
  AND NVL(f.OTROS,0)>0;
