USE [BDQuality]
GO

/****** Object:  View [dbo].[v_sri_compras]    Script Date: 04/05/2017 19:19:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

drop VIEW [dbo].[v_sri_compras]

go

CREATE VIEW [dbo].[v_sri_compras]
AS
select TipoDocumento as codigo,folio as numero,YEAR(Fecha) as anio,MONTH(Fecha) as mes,
'01' as sustento,(CASE len(entidad)  
					WHEN 13 THEN  '01'  
					WHEN 10 THEN  '02'  
					ELSE '03' END) as tipo_documento
,Entidad as documento,
'NO' as relacionado,
(case len(Entidad)
	when 13 then '01'
	else '03' end) as tipo_comprobante,
CONVERT(VARCHAR(10), fecha, 103) as fecha,
SUBSTRING(Texto1, 1, 3) as establecimiento,
SUBSTRING(Texto1, 4, 3) as punto_emision,
RIGHT('000000000'+SUBSTRING(Texto1, 7, 9),9) as secuencial,
Texto2 as autorizacion,
0 base_no_iva,
dbo.fun_get_documento_val(Empresa,TipoDocumento,Correlativo,'BASE_0') base_iva_0,/*si*/
dbo.fun_get_documento_val(Empresa,TipoDocumento,Correlativo,'BASE_12') base_graba,/*si*/
0 base_exenta,
dbo.fun_get_documento_val(Empresa,TipoDocumento,Correlativo,'ICE') ice,
dbo.fun_get_documento_val(Empresa,TipoDocumento,Correlativo,'IVA') iva,
0 reembolso,
Texto5 numero_retencion,
estado
from Documento
where Empresa='Activefun'
and TipoDocumento in (
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
and isnull(estado,'S')<>'A'




GO


