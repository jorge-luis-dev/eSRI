CREATE OR REPLACE PACKAGE pkg_proveedor
AS
   FUNCTION fun_get_documento (pCodigo NUMBER)
      RETURN VARCHAR2;

   FUNCTION fun_get_razon_social (pCodigo NUMBER)
      RETURN VARCHAR2;
END;
/


CREATE OR REPLACE PACKAGE BODY pkg_proveedor
AS
   FUNCTION fun_get_documento (pCodigo NUMBER)
      RETURN VARCHAR2
   AS
      vDocumento   VARCHAR2 (20);
   BEGIN
      SELECT p.DOCUMENTO
        INTO vDocumento
        FROM v_proveedor p
       WHERE p.COD_PROVEEDOR = pCodigo;

      RETURN vDocumento;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN ':( No disponible';
   END;


   FUNCTION fun_get_razon_social (pCodigo NUMBER)
      RETURN VARCHAR2
   AS
      vRazonSocial   VARCHAR2 (200);
   BEGIN
      SELECT p.RAZON_SOCIAL
        INTO vRazonSocial
        FROM v_proveedor p
       WHERE p.COD_PROVEEDOR = pCodigo;

      RETURN vRazonSocial;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN ':( No disponible';                     
   END;
END;
/
