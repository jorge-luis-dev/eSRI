USE [BDQuality]
GO

/****** Object:  View [dbo].[v_sri_retenciones]    Script Date: 22/03/2017 18:05:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_sri_retenciones]
AS
SELECT     MAX('RET') AS Codigo, Retencion AS Numero, MAX('07') AS CodigoDocumento, MAX(LEFT(Retencion, 3)) AS establecimiento, MAX(SUBSTRING(Retencion, 4, 3)) 
                      AS punto_emision, CASE WHEN len(MAX(retencion)) = 12 THEN MAX(RIGHT(retencion, 6)) WHEN len(MAX(retencion)) = 13 THEN MAX(RIGHT(retencion, 7)) 
                      WHEN len(MAX(retencion)) = 14 THEN MAX(RIGHT(retencion, 8)) ELSE MAX(RIGHT(retencion, 9)) END AS Secuencial, MAX(CONVERT(VARCHAR(10), Fecha_Comp, 103)) AS Fecha, 
                      MAX(TipoDocumento) AS TipoDocumento, MAX(Documento) AS Documento, MAX(RazonSocial) AS RazonSocial,
					  max(dbo.fun_autorizacion_retencion(Retencion)) as autorizacion
FROM         dbo.fe_retenciondetalle
WHERE     (Empresa = 'Activefun')
GROUP BY Retencion





GO


