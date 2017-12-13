USE [BDQuality]
GO

/****** Object:  View [dbo].[v_sri_retenciones_detalle]    Script Date: 03/27/2017 10:58:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


drop VIEW [dbo].[v_sri_retenciones_detalle]
go

CREATE VIEW [dbo].[v_sri_retenciones_detalle]
AS
select numero,codigo_sri,CONVERT(DECIMAL(10,2),round(base_imponible,2)) as base_imponible,
round(porcentaje,0) as porcentaje, 
CONVERT(DECIMAL(10,2),round(valor_retenido,2)) as valor_retenido
from V_INFO_RETENCION_DETALLE



GO


