USE [BDQuality]
GO

/****** Object:  UserDefinedFunction [dbo].[[fun_autorizacion_retencion]]    Script Date: 22/03/2017 22:44:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* SQLINES EVALUATION VERSION TRUNCATES VARIABLE NAMES AND COMMENTS. */
/* OBTAIN A LICENSE AT WWW.SQLINES.COM FOR FULL CONVERSION. THANK YOU. */


alter FUNCTION [dbo].[fun_autorizacion_retencion](
    @p_numero as VARCHAR(20))
  RETURNS VARCHAR(100)
AS
BEGIN
  DECLARE @v_autorizacion              VARCHAR(100);
  select @v_autorizacion =ele.NUMERO_AUTORIZACION 
  from ELE_DOCUMENTO_ELECTRONICO ele
  where ele.codigo='RET'
  and ele.NUMERO=@p_numero;

  IF (@v_autorizacion IS NULL) BEGIN	
	set @v_autorizacion='9999999999';
  end 


RETURN @v_autorizacion;

END;

GO


