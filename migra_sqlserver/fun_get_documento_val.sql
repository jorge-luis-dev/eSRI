USE [BDQuality]
GO

/****** Object:  UserDefinedFunction [dbo].[fun_autorizacion_retencion]    Script Date: 05/04/2017 21:39:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* SQLINES EVALUATION VERSION TRUNCATES VARIABLE NAMES AND COMMENTS. */
/* OBTAIN A LICENSE AT WWW.SQLINES.COM FOR FULL CONVERSION. THANK YOU. */


CREATE FUNCTION [dbo].[fun_get_documento_val](
    @p_empresa as VARCHAR(20),
	@p_tipoDocumento as VARCHAR(40),
	@p_correlativo as numeric(9,0),
	@p_nombre as VARCHAR(20))
  RETURNS numeric(11,2)
AS
BEGIN
	DECLARE @v_monto              numeric(11,2);

	select @v_monto=Monto from DocumentoVal
	where Empresa=@p_empresa
	and TipoDocumento=@p_tipoDocumento
	and Correlativo=@p_correlativo
	and Nombre=@p_nombre;

	RETURN @v_monto;
END;


GO


