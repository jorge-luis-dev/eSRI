CREATE OR REPLACE PACKAGE PKG_SRI
AS
  PROCEDURE pro_ats_compras(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_ats_ventas(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_ats_anulados(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_pago_exterior(
      pId_detalle_compra NUMBER,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_retencion(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_retencion_detalle(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_forma_pago_compra(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2);
  PROCEDURE pro_forma_pago_venta(
      pIdDetalleVenta NUMBER,
      pDocumento      VARCHAR2,
      pAno            VARCHAR2,
      pMes            VARCHAR2,
      pMensaje OUT VARCHAR2);
  FUNCTION fun_verifica_electronico(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2;
  FUNCTION fun_get_establecimiento_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2;
  PROCEDURE pro_establecimiento_venta(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2);
  FUNCTION fun_informante(
      pMensaje OUT VARCHAR2)
    RETURN VARCHAR2;
  PROCEDURE pro_get_info_comprobante(
      pTipoComprobante VARCHAR2,
      pNumero          NUMBER,
      pEstablecimiento OUT VARCHAR2,
      pPuntoEmision OUT VARCHAR2,
      pAutorizacion OUT VARCHAR2);
  PROCEDURE pro_modificado(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2);
  FUNCTION fun_get_fecha_comprobante(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN DATE;
  FUNCTION fun_get_total_compra(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN NUMBER;
  PROCEDURE pro_get_retencion_venta(
      pDocumento VARCHAR2,
      pAno       VARCHAR2,
      pMes       VARCHAR2,
      pRetencionIVA OUT NUMBER,
      pRetencionRenta OUT NUMBER);
  PROCEDURE pro_reembolso(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2);
  FUNCTION fun_get_punto_emision_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2;
  FUNCTION fun_get_autorizacion_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2;
END PKG_SRI;
/
CREATE OR REPLACE PACKAGE BODY PKG_SRI
AS
  PROCEDURE pro_ats_compras(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2)
  AS
    CURSOR c_documentos
    IS
      SELECT CODIGO ,
        NUMERO ,
        ANO ,
        MES ,
        SUSTENTO ,
        TIPO_DOCUMENTO ,
        DOCUMENTO ,
        RELACIONADO ,
        TIPO_COMPROBANTE ,
        fecha,
        ESTABLECIMIENTO ,
        PUNTO_EMISION ,
        SECUENCIAL ,
        AUTORIZACION ,
        BASE_NO_IVA ,
        BASE_IVA_0 ,
        BASE_GRABA ,
        BASE_EXENTA ,
        ICE ,
        IVA ,
        REEMBOLSO
      FROM V_SRI_COMPRAS
      WHERE ANO=pAno
      AND mes  =pMes;
    CURSOR c_retencion_iva(pCodigo VARCHAR2,pNumero NUMBER)
    IS
      SELECT CODIGO ,
        NUMERO ,
        NUMERO_RETENCION ,
        TIPO ,
        CODIGO_SRI ,
        VALOR_BASE ,
        PORCENTAJE ,
        VALOR_RETENIDO
      FROM V_SRI_RETENCION
      WHERE tipo='IVA'
      AND CODIGO=pCodigo
      AND NUMERO=pNumero;
    vIdCompra        NUMBER;
    vNumeroRetencion NUMBER;
    vR10             NUMBER;
    vR20             NUMBER;
    vR30             NUMBER;
    vR50             NUMBER;
    vR70             NUMBER;
    vR100            NUMBER;
  BEGIN
    DELETE SRI_DETALLE_COMPRA
    WHERE ANIO      =pAno
    AND mes         =pMes
    AND IDINFORMANTE=pInformante;
    FOR d IN c_documentos
    LOOP
      vIdCompra:=S_SRI_COMPRA.NEXTVAL;
      BEGIN
        vR10  :=0;
        vR20  :=0;
        vR30  :=0;
        vR50  :=0;
        vR70  :=0;
        vR100 :=0;
        FOR r IN c_retencion_iva(d.CODIGO, d.NUMERO)
        LOOP
          vNumeroRetencion :=r.NUMERO_RETENCION;
          IF r.PORCENTAJE   =10 THEN
            vR10           :=r.VALOR_RETENIDO;
          elsif r.PORCENTAJE=20 THEN
            vR20           :=r.VALOR_RETENIDO;
          elsif r.PORCENTAJE=30 THEN
            vR30           :=r.VALOR_RETENIDO;
          elsif r.PORCENTAJE=50 THEN
            vR50           :=r.VALOR_RETENIDO;
          elsif r.PORCENTAJE=70 THEN
            vR70           :=r.VALOR_RETENIDO;
          elsif r.PORCENTAJE=100 THEN
            vR100          :=r.VALOR_RETENIDO;
          END IF;
        END LOOP;
      EXCEPTION
      WHEN OTHERS THEN
        pMensaje:=d.CODIGO||' '||d.NUMERO||' RET '||vNumeroRetencion||' '||sqlerrm;
        RETURN;
      END;
      BEGIN
        INSERT
        INTO SRI_DETALLE_COMPRA
          (
            ID,
            IDINFORMANTE,
            ANIO,
            MES,
            CODSUSTENTO,
            TPIDPROV,
            IDPROV,
            TIPOCOMPROBANTE,
            PARTEREL,
            FECHAREGISTRO,
            ESTABLECIMIENTO,
            PUNTOEMISION,
            SECUENCIAL,
            FECHAEMISION,
            AUTORIZACION,
            BASENOGRAIVA,
            BASEIMPONIBLE,
            BASEIMPGRAV,
            BASEIMPEXE,
            MONTOICE,
            MONTOIVA,
            VALRETBIEN10,
            VALRETSERV20,
            VALORRETBIENES,
            VALRETSERV50,
            VALORRETSERVICIOS,
            VALRETSERV100,
            TOTBASESIMPREEMB,
            CODIGO,
            NUMERO
          )
          VALUES
          (
            vIdCompra,
            pInformante,
            d.ano,
            d.mes,
            d.SUSTENTO,
            d.TIPO_DOCUMENTO,
            d.DOCUMENTO,
            d.TIPO_COMPROBANTE,
            d.RELACIONADO,
            d.fecha,
            d.ESTABLECIMIENTO ,
            d.PUNTO_EMISION ,
            d.SECUENCIAL ,
            d.fecha,
            d.AUTORIZACION,
            NVL(d.BASE_NO_IVA,0),
            NVL(d.BASE_IVA_0,0),
            NVL(d.BASE_GRABA,0),
            NVL(d.BASE_EXENTA,0),
            NVL(d.ICE,0),
            NVL(d.IVA,0),
            NVL(vR10,0),
            NVL(vR20,0),
            NVL(vR30,0),
            NVL(vR50,0),
            NVL(vR70,0),
            NVL(vR100,0),
            NVL(d.REEMBOLSO,0),
            d.CODIGO ,
            d.NUMERO
          );
      EXCEPTION
      WHEN OTHERS THEN
        pMensaje:=d.CODIGO||' '||d.NUMERO||' '||sqlerrm;
        RETURN;
      END;
      DECLARE
        pMensajePago             VARCHAR(2000);
        pMensajeRetencion        VARCHAR(2000);
        pMensajeRetencionDetalle VARCHAR(2000);
        pMensajeFormaPago        VARCHAR(2000);
        pMensajeModificado       VARCHAR(2000);
        pMensajeReembolso        VARCHAR(2000);
      BEGIN
        pro_pago_exterior(vIdCompra,pMensajePago);
        IF d.TIPO_COMPROBANTE='41' THEN
          pro_reembolso( vIdCompra, d.CODIGO, d.NUMERO,pMensajeReembolso);
        END IF;
        IF d.CODIGO IN ('CPA','ENI','NDP') AND d.TIPO_COMPROBANTE!='41' THEN
          pro_retencion( vIdCompra, d.CODIGO, d.NUMERO, pMensajeRetencion);
          pro_retencion_detalle(vIdCompra, d.CODIGO, d.NUMERO, pMensajeRetencionDetalle);
        END IF;
        pro_forma_pago_compra(vIdCompra, d.CODIGO, d.NUMERO, pMensajeFormaPago);
        IF d.CODIGO='SAI' THEN
          pro_modificado(vIdCompra ,d.CODIGO, d.NUMERO,pMensajeModificado);
        END IF;
        IF pMensajePago IS NOT NULL THEN
          pMensaje      :=pMensajePago;
          ROLLBACK;
          RETURN;
        elsif pMensajeRetencion IS NOT NULL THEN
          pMensaje              :=pMensajeRetencion;
          ROLLBACK;
          RETURN;
        elsif pMensajeRetencionDetalle IS NOT NULL THEN
          pMensaje                     :=pMensajeRetencionDetalle;
          ROLLBACK;
          RETURN;
        elsif pMensajeFormaPago IS NOT NULL THEN
          pMensaje              :=pMensajeFormaPago;
          ROLLBACK;
          RETURN;
        elsif pMensajeModificado IS NOT NULL THEN
          pMensaje               :=pMensajeModificado;
          ROLLBACK;
          RETURN;
        elsif pMensajeReembolso IS NOT NULL THEN
          pMensaje              :=pMensajeReembolso;
          ROLLBACK;
          RETURN;
        END IF;
      END;
    END LOOP;
    COMMIT;
  END pro_ats_compras;
  PROCEDURE pro_ats_ventas
    (
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2
    )
  AS
    CURSOR c_documentos
    IS
      SELECT ANIO,
        MES,
        TIPO_DOCUMENTO,
        DOCUMENTO,
        RELACIONADO,
        TIPO_COMPROBANTE,
        TIPO_EMISION,
        RAZON_social,
        COUNT(*) numero_comprobantes,
        SUM(BASE_NO_IVA) BASE_NO_IVA,
        SUM(BASE_IVA_0) BASE_IVA_0,
        SUM(BASE_IVA) BASE_IVA,
        SUM(IVA) IVA,
        SUM(ICE) ICE,
        SUM(RETENCION_IVA) RETENCION_IVA,
        SUM(RETENCION_RENTA) RETENCION_RENTA
      FROM V_SRI_VENTAS
      WHERE ANIO=pAno
      AND mes   =pMes
      GROUP BY ANIO,
        MES,
        TIPO_DOCUMENTO,
        DOCUMENTO,
        RELACIONADO,
        TIPO_COMPROBANTE,
        TIPO_EMISION,
        RAZON_social;
    vIdVenta        NUMBER;
    vRetencionIVA   NUMBER;
    vRetencionRenta NUMBER;
  BEGIN
    DELETE SRI_DETALLE_venta
    WHERE ANIO      =pAno
    AND mes         =pMes
    AND IDINFORMANTE=pInformante;
    FOR d IN c_documentos
    LOOP
      vIdVenta:=S_SRI_VENTA.NEXTVAL;
      BEGIN
        vRetencionIVA  :=0;
        vRetencionRenta:=0;
        pro_get_retencion_venta( d.DOCUMENTO, d.ANIO, d.MES, vRetencionIVA, vRetencionRenta);
        INSERT
        INTO SRI_DETALLE_VENTA
          (
            ID,
            IDINFORMANTE,
            ANIO,
            MES,
            TPIDCLIENTE,
            IDCLIENTE,
            PARTERELVTAS,
            TIPOCOMPROBANTE,
            TIPOEMISION,
            NUMEROCOMPROBANTES,
            BASENOGRAIVA,
            BASEIMPONIBLE,
            BASEIMPGRAV,
            MONTOIVA,
            MONTOICE,
            VALORRETIVA,
            VALORRETRENTA,
            TIPOCLIENTE,
            DENOCLI
          )
          VALUES
          (
            vIdVenta,
            pInformante,
            d.ANIO,
            d.MES,
            d.TIPO_DOCUMENTO,
            d.DOCUMENTO,
            d.RELACIONADO,
            d.TIPO_COMPROBANTE,
            d.TIPO_EMISION,
            d.numero_comprobantes,
            d.BASE_NO_IVA,
            d.BASE_IVA_0,
            d.BASE_IVA,
            d.IVA,
            d.ICE,
            DECODE(d.TIPO_COMPROBANTE,'18',NVL(vRetencionIVA,0),0),
            DECODE(d.TIPO_COMPROBANTE,'18',NVL(vRetencionRenta,0),0),
            '01',
            d.razon_social
          );
        IF d.TIPO_COMPROBANTE IN ('18','41') THEN
          pro_forma_pago_venta ( vIdVenta, d.DOCUMENTO,d.ANIO,d.MES,pMensaje );
        END IF;
      EXCEPTION
      WHEN OTHERS THEN
        pMensaje:=d.DOCUMENTO||' '||sqlerrm;
        ROLLBACK;
        RETURN;
      END;
    END LOOP;
    pro_establecimiento_venta( pInformante, pAno , pMes , pMensaje );
    COMMIT;
  END pro_ats_ventas;
  PROCEDURE pro_ats_anulados
    (
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2
    )
  AS
  BEGIN
    DELETE SRI_DETALLE_ANULADO
    WHERE ANIO      =pAno
    AND mes         =pMes
    AND IDINFORMANTE=pInformante;
    INSERT
    INTO SRI_DETALLE_ANULADO
      (
        ID,
        IDINFORMANTE,
        ANIO,
        MES,
        CODIGO,
        NUMERO,
        TIPOCOMPROBANTE,
        ESTABLECIMIENTO,
        PUNTOEMISION,
        SECUENCIALINICIO,
        SECUENCIALFIN,
        AUTORIZACION
      )
    SELECT ID,
      pInformante,
      ANIO,
      MES,
      CODIGO,
      NUMERO,
      TIPO_COMPROBANTE,
      ESTABLECIMIENTO,
      PUNTO_EMISION,
      SECUNCIAL,
      SECUNCIAL,
      AUTORIZACION
    FROM V_SRI_ANULADOS
    WHERE anio=pAno
    AND MES   =pMes;
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    pMensaje:=sqlerrm||' '||SQLCODE;
    ROLLBACK;
  END pro_ats_anulados;
  PROCEDURE pro_pago_exterior(
      pId_detalle_compra NUMBER,
      pMensaje OUT VARCHAR2 )
  AS
  BEGIN
    INSERT
    INTO SRI_PAGO_EXTERIOR
      (
        ID_DETALLE_COMPRA,
        PAGOLOCEXT,
        PAISEFECPAGO,
        APLICCONVDOBTRIB,
        PAGEXTSUJRETNORLEG
      )
      VALUES
      (
        pId_detalle_compra,
        '01',
        'NA',
        'NA',
        'NA'
      );
  END pro_pago_exterior;
  FUNCTION fun_informante
    (
      pMensaje OUT VARCHAR2
    )
    RETURN VARCHAR2
  AS
    i sri_informante%rowtype;
    vCountInformante NUMBER;
    vInformante      VARCHAR2(20);
  BEGIN
    BEGIN
      SELECT ruc,
        titulo4
      INTO i.IDINFORMANTE,
        i.RAZONSOCIAL
      FROM gnr_datos_generales;
    EXCEPTION
    WHEN OTHERS THEN
      pMensaje:=sqlerrm||' '||SQLCODE;
      RETURN ':(';
    END;
    SELECT COUNT(*)
    INTO vCountInformante
    FROM SRI_INFORMANTE
    WHERE IDINFORMANTE =i.IDINFORMANTE;
    IF vCountInformante=0 THEN
      INSERT
      INTO SRI_INFORMANTE
        (
          IDINFORMANTE,
          RAZONSOCIAL
        )
        VALUES
        (
          i.IDINFORMANTE,
          i.RAZONSOCIAL
        );
      COMMIT;
    END IF;
    RETURN i.IDINFORMANTE;
  END fun_informante;
  PROCEDURE pro_retencion
    (
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2
    )
  AS
    CURSOR c_retencion
    IS
      SELECT r.COD_DOCUMENTO,
        r.NUM_DOCUMENTO,
        r.NUM_RETENCION,
        r.FECHA_RETENCION
      FROM BAN_RETENCION_C r
      WHERE r.COD_DOCUMENTO =pCodigo
      AND r.NUM_DOCUMENTO   =pNumero
      AND NVL(r.ESTADO,'G')<>'A';
    vEstablecimiento VARCHAR2(10);
    vPuntoEmision    VARCHAR2(10);
    vSecuencial      VARCHAR2(20);
    vNumeroRetencion NUMBER;
    vAutorizacion    VARCHAR2(100);
    vExiste          BOOLEAN:=false;
    vCountRetencion  NUMBER :=0;
  BEGIN
    FOR r IN c_retencion
    LOOP
      vNumeroRetencion  :=r.NUM_RETENCION;
      vAutorizacion     :=PKG_SRI.fun_verifica_electronico('RET',vNumeroRetencion);
      IF vAutorizacion  IS NOT NULL THEN
        vEstablecimiento:=SUBSTR(TO_CHAR(vNumeroRetencion,'fm000000000000000'),1,3);
        vPuntoEmision   :=SUBSTR(TO_CHAR(vNumeroRetencion,'fm000000000000000'),4,3);
        vSecuencial     :=SUBSTR(TO_CHAR(vNumeroRetencion,'fm000000000000000'),7,9);
      ELSE
        pro_get_info_comprobante('RET',vNumeroRetencion,vEstablecimiento,vPuntoEmision,vAutorizacion);
        vSecuencial :=SUBSTR(TO_CHAR(vNumeroRetencion,'fm000000000000000'),7,9);
      END IF;
      INSERT
      INTO SRI_RETENCION
        (
          ID_DETALLE_COMPRA,
          ESTABRETENCION1,
          PTOEMIRETENCION1,
          SECRETENCION1,
          AUTRETENCION1,
          FECHAEMIRET1
        )
        VALUES
        (
          pIdDetalleCompra,
          vEstablecimiento,
          vPuntoEmision,
          vSecuencial,
          vAutorizacion,
          r.FECHA_RETENCION
        );
      vExiste        :=true;
      vCountRetencion:=vCountRetencion+1;
    END LOOP;
    IF vCountRetencion > 1 THEN
      pMensaje        :=pCodigo||' '||pNumero||' RET '||vNumeroRetencion||' Existe más de una retención';
      RETURN;
    END IF;
    /*
    IF vExiste=false THEN
    INSERT
    INTO SRI_RETENCION
    (
    ID_DETALLE_COMPRA,
    ESTABRETENCION1,
    PTOEMIRETENCION1,
    SECRETENCION1,
    AUTRETENCION1,
    FECHAEMIRET1
    )
    VALUES
    (
    pIdDetalleCompra,
    '999',
    '999',
    '999999999',
    '9999999999',
    fun_get_fecha_comprobante(pCodigo,pNumero)
    );
    END IF;
    */
  EXCEPTION
  WHEN OTHERS THEN
    pMensaje:=pCodigo||' '||pNumero||' RET '||vNumeroRetencion||' '||sqlerrm;
  END pro_retencion;
  PROCEDURE pro_retencion_detalle
    (
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2
    )
  AS
    CURSOR c_retencion_renta
      (
        pCodigo VARCHAR2,pNumero NUMBER
      )
    IS
      SELECT CODIGO ,
        NUMERO ,
        NUMERO_RETENCION ,
        TIPO ,
        CODIGO_SRI ,
        VALOR_BASE ,
        PORCENTAJE ,
        VALOR_RETENIDO
      FROM V_SRI_RETENCION
      WHERE tipo='RENTA'
      AND CODIGO=pCodigo
      AND NUMERO=pNumero;
    vNumeroRetencion NUMBER;
    vExiste          BOOLEAN:=false;
  BEGIN
    FOR r IN c_retencion_renta(pCodigo,pNumero)
    LOOP
      vNumeroRetencion:=r.NUMERO_RETENCION;
      INSERT
      INTO SRI_DETALLE_RETENCION
        (
          ID_DETALLE_COMPRA,
          CODRETAIR,
          BASEIMPAIR,
          PORCENTAJEAIR,
          VALRETAIR
        )
        VALUES
        (
          pIdDetalleCompra,
          r.CODIGO_SRI,
          r.VALOR_BASE,
          r.PORCENTAJE,
          r.VALOR_RETENIDO
        );
      vExiste:=true;
    END LOOP;
    IF vExiste=false THEN
      INSERT
      INTO SRI_DETALLE_RETENCION
        (
          ID_DETALLE_COMPRA,
          CODRETAIR,
          BASEIMPAIR,
          PORCENTAJEAIR,
          VALRETAIR
        )
        VALUES
        (
          pIdDetalleCompra,
          332,
          fun_get_total_compra(pCodigo,pNumero),
          0,
          0
        );
    END IF;
  EXCEPTION
  WHEN OTHERS THEN
    pMensaje:=pCodigo||' '||pNumero||' RET '||vNumeroRetencion||' '||sqlerrm;
  END pro_retencion_detalle;
  PROCEDURE pro_forma_pago_compra
    (
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2
    )
  AS
    vSuma      NUMBER;
    vFormaPago VARCHAR2(20);
  BEGIN
    SELECT BASENOGRAIVA+BASEIMPONIBLE+BASEIMPGRAV+BASEIMPEXE+MONTOICE+MONTOIVA
    INTO vSuma
    FROM SRI_DETALLE_COMPRA
    WHERE id     =pIdDetalleCompra;
    IF vSuma    >=1000 AND vSuma <5000 THEN
      vFormaPago:='20';
    elsif vSuma >=5000 THEN
      vFormaPago:='20';
    ELSE
      RETURN;
    END IF;
    INSERT
    INTO SRI_FORMA_PAGO_COMPRA
      (
        ID_DETALLE,
        CODIGO
      )
      VALUES
      (
        pIdDetalleCompra,
        vFormaPago
      );
  END pro_forma_pago_compra;
  PROCEDURE pro_forma_pago_venta
    (
      pIdDetalleVenta NUMBER,
      pDocumento      VARCHAR2,
      pAno            VARCHAR2,
      pMes            VARCHAR2,
      pMensaje OUT VARCHAR2
    )
  AS
    CURSOR c_forma_pago
    IS
      SELECT P.CODIGO,
        C.DOCUMENTO
      FROM V_FORMA_PAGO_FACTURA P
      INNER JOIN V_CLIENTE C
      ON P.CLIENTE               = C.COD_CLIENTE
      WHERE TO_CHAR(FECHA,'RRRR')=pAno
      AND TO_CHAR(FECHA,'MM')    =pMes
      AND C.DOCUMENTO            =pDocumento
      GROUP BY P.CODIGO,
        C.DOCUMENTO;
  BEGIN
    FOR f IN c_forma_pago
    LOOP
      INSERT
      INTO SRI_FORMA_PAGO_VENTA
        (
          ID_DETALLE,
          CODIGO
        )
        VALUES
        (
          pIdDetalleVenta,
          f.CODIGO
        );
    END LOOP;
  END pro_forma_pago_venta;
  FUNCTION fun_verifica_electronico
    (
      pCodigo VARCHAR2,
      pNumero VARCHAR2
    )
    RETURN VARCHAR2
  AS
    vAutorizacion VARCHAR2
    (
      100
    )
    ;
  BEGIN
    SELECT NUMERO_AUTORIZACION
    INTO vAutorizacion
    FROM ELE_DOCUMENTO_ELECTRONICO
    WHERE codigo=pCodigo
    AND NUMERO  =pNumero;
    RETURN vAutorizacion;
  EXCEPTION
  WHEN no_data_found THEN
    RETURN NULL;
  WHEN OTHERS THEN
    RETURN NULL;
  END fun_verifica_electronico;
  FUNCTION fun_get_establecimiento_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2
  AS
    vEstablecimiento VARCHAR2(10);
    vPuntoEmision    VARCHAR2(10);
    vAutorizacion    VARCHAR2(100);
  BEGIN
    IF LENGTH(pNumero)>=13 THEN
      vEstablecimiento:=SUBSTR(TO_CHAR(pNumero,'fm000000000000000'),1,3);
    ELSE
      PKG_SRI.PRO_GET_INFO_COMPROBANTE(pCodigo,pNumero,vEstablecimiento,vPuntoEmision,vAutorizacion);
    END IF;
    RETURN vEstablecimiento;
  END fun_get_establecimiento_venta;
  PROCEDURE pro_establecimiento_venta(
      pInformante VARCHAR2,
      pAno        VARCHAR2,
      pMes        VARCHAR2,
      pMensaje OUT VARCHAR2)
  AS
    CURSOR c_establecimiento_venta
    IS
      SELECT ESTABLECIMIENTO,
        NVL(SUM(DECODE(codigo,'FAC',BASE_NO_IVA,'DVC',BASE_NO_IVA*-1,'NCC',BASE_NO_IVA*-1)) + SUM(DECODE(codigo,'FAC',BASE_IVA_0,'DVC',BASE_IVA_0*-1,'NCC',BASE_IVA_0*-1)) + SUM(DECODE(codigo,'FAC',BASE_IVA,'DVC',BASE_IVA*-1,'NCC',BASE_IVA*-1)),0) ventas,
        TIPO_EMISION
      FROM V_SRI_VENTAS
      WHERE ANIO=pAno
      AND mes   =pMes
      GROUP BY ESTABLECIMIENTO,
        TIPO_EMISION;
  BEGIN
    DELETE SRI_VENTA_ESTABLECIMIENTO
    WHERE ANIO      =pAno
    AND mes         =pMes
    AND IDINFORMANTE=pInformante;
    FOR e IN c_establecimiento_venta
    LOOP
      BEGIN
        INSERT
        INTO SRI_VENTA_ESTABLECIMIENTO
          (
            IDINFORMANTE,
            CODESTAB,
            VENTASESTAB,
            ANIO,
            MES
          )
          VALUES
          (
            pInformante,
            e.ESTABLECIMIENTO,
            DECODE(e.TIPO_EMISION,'E',0,e.ventas),
            pAno,
            pMes
          );
      EXCEPTION
      WHEN OTHERS THEN
        pMensaje:='Establecimiento '||e.ESTABLECIMIENTO||' '||sqlerrm;
      END;
    END LOOP;
  END pro_establecimiento_venta;
  PROCEDURE pro_get_info_comprobante
    (
      pTipoComprobante VARCHAR2,
      pNumero          NUMBER,
      pEstablecimiento OUT VARCHAR2,
      pPuntoEmision OUT VARCHAR2,
      pAutorizacion OUT VARCHAR2
    )
  AS
  BEGIN
    SELECT ESTABLECIMIENTO,
      PUNTOEMISION,
      AUTORIZACION
    INTO pEstablecimiento,
      pPuntoEmision,
      pAutorizacion
    FROM SRI_SERIECOMPROBANTE_D
    WHERE TIPO_COMPROBANTE=pTipoComprobante
    AND pNumero BETWEEN numero_inicial AND numero_final
    AND ESTADO='A';
  EXCEPTION
  WHEN no_data_found THEN
    pEstablecimiento:='999';
    pPuntoEmision   :='999';
    pAutorizacion   :='9999999999';
  WHEN too_many_rows THEN
    pEstablecimiento:='999';
    pPuntoEmision   :='999';
    pAutorizacion   :='9999999999';
  WHEN OTHERS THEN
    pEstablecimiento:='999';
    pPuntoEmision   :='999';
    pAutorizacion   :='9999999999';
  END pro_get_info_comprobante;
  PROCEDURE pro_modificado(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2)
  AS
    CURSOR c_modificado
    IS
      SELECT CODIGO_DOCUMENTO ,
        NUMERO_DOCUMENTO ,
        TIPO_DOCUMENTO ,
        NUMERO ,
        AUTORIZACION
      FROM CXP_DOCUMENTOS_MODIFICADOS
      WHERE CODIGO_DOCUMENTO=pCodigo
      AND NUMERO_DOCUMENTO  =pNumero;
    vExiste BOOLEAN        :=false;
  BEGIN
    FOR m IN c_modificado
    LOOP
      INSERT
      INTO SRI_MODIFICADO
        (
          ID_DETALLE_COMPRA,
          DOCMODIFICADO,
          ESTABMODIFICADO,
          PTOEMIMODIFICADO,
          SECMODIFICADO,
          AUTMODIFICADO
        )
        VALUES
        (
          pIdDetalleCompra,
          TO_CHAR(m.TIPO_DOCUMENTO,'fm00'),
          SUBSTR(m.NUMERO,1,3) ,
          SUBSTR(m.NUMERO,5,3) ,
          SUBSTR(m.NUMERO,9,9) ,
          m.AUTORIZACION
        );
      vExiste:=true;
    END LOOP;
    IF vExiste=false THEN
      INSERT
      INTO SRI_MODIFICADO
        (
          ID_DETALLE_COMPRA,
          DOCMODIFICADO,
          ESTABMODIFICADO,
          PTOEMIMODIFICADO,
          SECMODIFICADO,
          AUTMODIFICADO
        )
        VALUES
        (
          pIdDetalleCompra,
          '01',
          '999' ,
          '999',
          '999999999' ,
          '9999999999'
        );
    END IF;
  EXCEPTION
  WHEN OTHERS THEN
    pMensaje:='Modificado '||pCodigo||' '||pNumero||' '||sqlerrm;
  END pro_modificado;
  FUNCTION fun_get_fecha_comprobante
    (
      pCodigo VARCHAR2,
      pNumero VARCHAR2
    )
    RETURN DATE
  AS
    vFecha DATE;
  BEGIN
    SELECT FECHAEMISION
    INTO vFecha
    FROM SRI_DETALLE_COMPRA
    WHERE CODIGO=pCodigo
    AND NUMERO  =pNumero;
    RETURN vFecha;
  EXCEPTION
  WHEN OTHERS THEN
    RETURN ADD_MONTHS(sysdate,-1);
  END fun_get_fecha_comprobante;
  FUNCTION fun_get_total_compra(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN NUMBER
  AS
    vTotal NUMBER;
  BEGIN
    SELECT BASEIMPEXE+BASEIMPGRAV+BASEIMPONIBLE+BASENOGRAIVA
    INTO vTotal
    FROM SRI_DETALLE_COMPRA
    WHERE CODIGO=pCodigo
    AND NUMERO  =pNumero;
    RETURN vTotal;
  EXCEPTION
  WHEN OTHERS THEN
    RETURN 0;
  END fun_get_total_compra;
  PROCEDURE pro_get_retencion_venta(
      pDocumento VARCHAR2,
      pAno       VARCHAR2,
      pMes       VARCHAR2,
      pRetencionIVA OUT NUMBER,
      pRetencionRenta OUT NUMBER)
  AS
  BEGIN
    SELECT SUM(r.RETENCION_IVA),
      SUM(r.RETENCION)
    INTO pRetencionIVA,
      pRetencionRenta
    FROM CXC_PAGO_CONTADO r
    INNER JOIN V_CLIENTE c
    ON r.COD_EMPRESA                     = c.COD_EMPRESA
    AND r.COD_CLIENTE                    = c.COD_CLIENTE
    WHERE c.DOCUMENTO                    =pDocumento
    AND TO_CHAR(r.FECHA_DOCUMENTO,'rrrr')=pAno
    AND TO_CHAR(r.FECHA_DOCUMENTO,'mm')  =pMes
    GROUP BY c.DOCUMENTO,
      TO_CHAR(r.FECHA_DOCUMENTO,'rrrr'),
      TO_CHAR(r.FECHA_DOCUMENTO,'mm');
  EXCEPTION
  WHEN OTHERS THEN
    pRetencionIVA  :=0;
    pRetencionRenta:=0;
  END pro_get_retencion_venta;
  PROCEDURE pro_reembolso(
      pIdDetalleCompra NUMBER,
      pCodigo          VARCHAR2,
      pNumero          NUMBER,
      pMensaje OUT VARCHAR2)
  AS
  BEGIN
    INSERT INTO SRI_REEMBOLSO
    SELECT pIdDetalleCompra,
      '01',
      TIPO_DOCUMENTO,
      DOCUMENTO,
      ESTABLECIMIENTO,
      PUNTO_EMISION,
      SECUENCIAL,
      FECHA,
      AUTORIZACION,
      BASE_IVA_0,
      BASE_GRABA,
      BASE_NO_IVA,
      BASE_EXENTA,
      ICE,
      IVA
    FROM V_SRI_COMPRAS
    WHERE codigo=pCodigo
    AND numero  =pNumero;
  EXCEPTION
  WHEN OTHERS THEN
    pMensaje:='Reembolso '||pCodigo||' '||pNumero||' '||sqlerrm;
  END pro_reembolso;
  FUNCTION fun_get_punto_emision_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2
  AS
    vEstablecimiento VARCHAR2(10);
    vPuntoEmision    VARCHAR2(10);
    vAutorizacion    VARCHAR2(100);
  BEGIN
    IF LENGTH(pNumero)>=13 THEN
      vEstablecimiento:=SUBSTR(TO_CHAR(pNumero,'fm000000000000000'),4,3);
    ELSE
      PKG_SRI.PRO_GET_INFO_COMPROBANTE(pCodigo,pNumero,vEstablecimiento,vPuntoEmision,vAutorizacion);
    END IF;
    RETURN vPuntoEmision;
  END fun_get_punto_emision_venta;
  FUNCTION fun_get_autorizacion_venta(
      pCodigo VARCHAR2,
      pNumero VARCHAR2)
    RETURN VARCHAR2
  AS
    vEstablecimiento VARCHAR2(10);
    vPuntoEmision    VARCHAR2(10);
    vAutorizacion    VARCHAR2(100);
  BEGIN
    PKG_SRI.PRO_GET_INFO_COMPROBANTE(pCodigo,pNumero,vEstablecimiento,vPuntoEmision,vAutorizacion);
    RETURN vAutorizacion;
  END fun_get_autorizacion_venta;
END PKG_SRI;
/
