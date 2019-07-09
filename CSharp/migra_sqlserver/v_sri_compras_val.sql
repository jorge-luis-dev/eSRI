SELECT     d.TipoDocumento as codigo,
d.folio as numero,YEAR(d.Fecha) as anio,
MONTH(d.Fecha) as mes,
'01' as sustento,(CASE len(d.entidad)  
					WHEN 13 THEN  '01'  
					WHEN 10 THEN  '02'  
					ELSE '03' END) as tipo_documento
,d.Entidad as documento,
'NO' as relacionado,
(case len(d.Entidad)
	when 13 then '01'
	else '03' end) as tipo_comprobante,
CONVERT(VARCHAR(10), d.fecha, 103) as fecha,
SUBSTRING(d.Texto1, 1, 3) as establecimiento,
SUBSTRING(d.Texto1, 4, 3) as punto_emision,
RIGHT('000000000'+SUBSTRING(d.Texto1, 7, 9),9) as secuencial,
d.Texto2 as autorizacion,
0 base_no_iva,
0 base_iva_0,/*si*/
0 base_graba,/*si*/
0 base_exenta,
0 ice,
0 iva,
0 reembolso,
d.Texto5 numero_retencion,
d.estado,
d.Correlativo
FROM         Documento d INNER JOIN
DocumentoVal v ON d.Empresa = v.Empresa 
AND d.TipoDocumento = v.TipoDocumento 
AND d.Correlativo = v.Correlativo
where d.Empresa='Activefun'
and d.TipoDocumento in (
'FACTURA DEBITO BANCARIO',
'CAJA CHICA NO DEDUCIBLES',
'FACTURA GASTOS',
'FACTURA ACTIVOS FIJOS',
'FACTURA BIENES',
'FACTURA GASTOS FE',
'FAC. SERVICIOS BASICOS',
'FACTURA BIENES FE'
/*,
'NOTA CREDITO COMPRA SERVICIOS',
'NOTA CREDITO COMPRA SERVICIOS FE',
'NOTA CREDITO COMPRA BIENES'
*/
)
and isnull(d.estado,'S')<>'A'
and YEAR(d.Fecha) =2016
and MONTH(d.Fecha)=12
and d.Folio=1377197;
