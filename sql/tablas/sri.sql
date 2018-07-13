
--------------------------------------------------------
--  DDL for Table SRI_COMPROBANTE_AUTORIZADO
--------------------------------------------------------

  CREATE TABLE "SRI_COMPROBANTE_AUTORIZADO" 
   (	"CODIGO" VARCHAR2(20), 
	"DESCRIPCION" VARCHAR2(500), 
	"ESTADO" VARCHAR2(10) DEFAULT 'ACTIVO'
   )  TABLESPACE "DATOS" ;
--------------------------------------------------------
--  DDL for Table SRI_DETALLE_COMPRA
--------------------------------------------------------

  CREATE TABLE "SRI_FORMA_PAGO" 
   (	"CODIGO" VARCHAR2(10), 
	"DESCRIPCION" VARCHAR2(500), 
	"ESTADO" VARCHAR2(10) DEFAULT 'ACTIVO'
   )   TABLESPACE "DATOS" ;
--------------------------------------------------------
--  DDL for Table SRI_FORMA_PAGO_COMPRA
--------------------------------------------------------
--  DDL for Table SRI_PAGO_EXTERIOR
--------------------------------------------------------


  CREATE TABLE "SRI_TIPO_RETENCION" 
   (	"CODIGO" VARCHAR2(20), 
	"DESCRIPCION" VARCHAR2(500), 
	"ESTADO" VARCHAR2(10) DEFAULT 'ACTIVO'
   ) TABLESPACE "DATOS" ;
--------------------------------------------------------
--  DDL for Table SRI_SUSTENTO_TRIBUTARIO
--------------------------------------------------------

  CREATE TABLE "SRI_SUSTENTO_TRIBUTARIO" 
   (	"CODIGO" VARCHAR2(20), 
	"DESCRIPCION" VARCHAR2(500), 
	"ESTADO" VARCHAR2(10)
   ) TABLESPACE "DATOS" ;
REM INSERTING into SRI_COMPROBANTE_AUTORIZADO
SET DEFINE OFF;
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('01','Factura ','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('02','Nota o boleta de venta ','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('03','Liquidación de compra de Bienes o Prestación de servicios ','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('04','Nota de crédito','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('05','Nota de débito','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('06','Guías de Remisión ','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('07','Comprobante de Retención','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('08','Boletos o entradas a espectáculos públicos','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('09','Tiquetes o vales emitidos por máquinas registradoras','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('11','Pasajes expedidos por empresas de aviación','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('12','Documentos emitidos por instituciones financieras','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('15','Comprobante de venta emitido en el Exterior','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('16','Formulario Único de Exportación (FUE) o Declaración Aduanera Única (DAU) o Declaración Andina de Valor (DAV)','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('18','Documentos autorizados utilizados en ventas excepto N/C N/D ','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('19','Comprobantes de Pago de Cuotas o Aportes','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('20','Documentos por Servicios Administrativos emitidos por Inst. del Estado','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('21','Carta de Porte Aéreo','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('22','RECAP','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('23','Nota de Crédito TC','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('24','Nota de Débito TC','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('41','Comprobante de venta emitido por reembolso','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('42','Documento agente de retención Presuntiva','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('43','Liquidación para Explotación y Exploracion de Hidrocarburos','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('44','Comprobante de Contribuciones y Aportes','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('45','Liquidación por reclamos de aseguradoras','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('47','Nota de Crédito por Reembolso Emitida por Intermediario','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('48','Nota de Débito por Reembolso Emitida por Intermediario','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('49','Proveedor Directo de Exportador Bajo Régimen Especial','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('50','A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('51','N/C A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('52','N/D A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('294','Liquidación de compra de Bienes Muebles Usados','ACTIVO');
Insert into SRI_COMPROBANTE_AUTORIZADO (CODIGO,DESCRIPCION,ESTADO) values ('344','Liquidación de compra de vehículos usados ','ACTIVO');
REM INSERTING into SRI_DETALLE_COMPRA
SET DEFINE OFF;
REM INSERTING into SRI_DETALLE_RETENCION
SET DEFINE OFF;
REM INSERTING into SRI_FORMA_PAGO
SET DEFINE OFF;
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('01','SIN UTILIZACION DEL SISTEMA FINANCIERO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('02','CHEQUE PROPIO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('03','CHEQUE CERTIFICADO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('04','CHEQUE DE GERENCIA','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('05','CHEQUE DEL EXTERIOR','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('06','DÉBITO DE CUENTA','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('07','TRANSFERENCIA PROPIO BANCO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('08','TRANSFERENCIA OTRO BANCO NACIONAL','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('09','TRANSFERENCIA  BANCO EXTERIOR','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('10','TARJETA DE CRÉDITO NACIONAL','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('11','TARJETA DE CRÉDITO INTERNACIONAL','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('12','GIRO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('13','DEPOSITO EN CUENTA (CORRIENTE/AHORROS)','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('14','ENDOSO DE INVERSIÒN','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('15','COMPENSACIÓN DE DEUDAS','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('16','TARJETA DE DÉBITO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('17','DINERO ELECTRÓNICO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('18','TARJETA PREPAGO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('19','TARJETA DE CRÉDITO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('20','OTROS CON UTILIZACION DEL SISTEMA FINANCIERO','ACTIVO');
Insert into SRI_FORMA_PAGO (CODIGO,DESCRIPCION,ESTADO) values ('21','ENDOSO DE TÍTULOS','ACTIVO');
REM INSERTING into SRI_FORMA_PAGO_COMPRA
SET DEFINE OFF;
REM INSERTING into SRI_INFORMANTE
SET DEFINE OFF;
REM INSERTING into SRI_MODIFICADO
SET DEFINE OFF;
REM INSERTING into SRI_PAGO_EXTERIOR
SET DEFINE OFF;
REM INSERTING into SRI_REEMBOLSO
SET DEFINE OFF;
REM INSERTING into SRI_RETENCION
SET DEFINE OFF;
REM INSERTING into SRI_TIPO_RETENCION
SET DEFINE OFF;
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('303','Honorarios profesionales y demás pagos por servicios relacionados con el título profesional','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304','Servicios predomina el intelecto no relacionados con el título profesional','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304A','Comisiones y demás pagos por servicios predomina intelecto no relacionados con el título profesional','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304B','Pagos a notarios y registradores de la propiedad y mercantil por sus actividades ejercidas como tales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304C','Pagos a deportistas, entrenadores, árbitros, miembros del cuerpo técnico por sus actividades ejercidas como tales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304D','Pagos a artistas por sus actividades ejercidas como tales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('304E','Honorarios y demás pagos por servicios de docencia','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('307','Servicios predomina la mano de obra','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('308','Utilización o aprovechamiento de la imagen o renombre','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('309','Servicios prestados por medios de comunicación y agencias de publicidad','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('310','Servicio de transporte privado de pasajeros o transporte público o privado de carga','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('311','Por pagos a través de liquidación de compra (nivel cultural o rusticidad)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('312','Transferencia de bienes muebles de naturaleza corporal','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('312A','Compra de bienes de origen agrícola, avícola, pecuario, apícola, cunícula, bioacuático, y forestal','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('314A','Regalías por concepto de franquicias de acuerdo a Ley de Propiedad Intelectual - pago a personas naturales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('314B','Cánones, derechos de autor,  marcas, patentes y similares de acuerdo a Ley de Propiedad Intelectual – pago a personas naturales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('314C','Regalías por concepto de franquicias de acuerdo a Ley de Propiedad Intelectual  - pago a sociedades','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('314D','Cánones, derechos de autor,  marcas, patentes y similares de acuerdo a Ley de Propiedad Intelectual – pago a sociedades','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('319','Cuotas de arrendamiento mercantil, inclusive la de opción de compra','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('320','Por arrendamiento bienes inmuebles','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('322','Seguros y reaseguros (primas y cesiones)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323','Por rendimientos financieros pagados a naturales y sociedades  (No a IFIs)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323A','Por RF: depósitos Cta. Corriente','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323B1','Por RF:  depósitos Cta. Ahorros Sociedades','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323E','Por RF: depósito a plazo fijo  gravados','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323E2','Por RF: depósito a plazo fijo exentos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323F','Por rendimientos financieros: operaciones de reporto - repos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323G','Por RF: inversiones (captaciones) rendimientos distintos de aquellos pagados a IFIs','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323H','Por RF: obligaciones','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323I','Por RF: bonos convertible en acciones','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323 M','Por RF: Inversiones en títulos valores en renta fija gravados ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323 N','Por RF: Inversiones en títulos valores en renta fija exentos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323 O','Por RF: Intereses pagados a bancos y otras entidades sometidas al control de la Superintendencia de Bancos y de la Economía Popular y Solidaria','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323 P','Por RF: Intereses pagados por entidades del sector público a favor de sujetos pasivos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323Q','Por RF: Otros intereses y rendimientos financieros gravados ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('323R','Por RF: Otros intereses y rendimientos financieros exentos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('324A','Por RF: Intereses en operaciones de crédito entre instituciones del sistema financiero y entidades economía popular y solidaria. ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('324B','Por RF: Por inversiones entre instituciones del sistema financiero y entidades economía popular y solidaria. ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('325','Anticipo dividendos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('325A','Dividendos anticipados préstamos accionistas, beneficiarios o partìcipes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('326','Dividendos distribuidos que correspondan al impuesto a la renta único establecido en el art. 27 de la lrti','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('327','Dividendos distribuidos a personas naturales residentes cuando la sociedad que distribuye aplicó tarifa del 22% IR','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('328','Dividendos distribuidos a sociedades residentes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('329','dividendos distribuidos a fideicomisos residentes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('330','Dividendos gravados distribuidos en acciones (reinversión de utilidades sin derecho a reducción tarifa IR) cuando la sociedad que distribuye aplicó tarifa del 22% IR','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('331','Dividendos exentos distribuidos en acciones (reinversión de utilidades con derecho a reducción tarifa IR) ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332','Otras compras de bienes y servicios no sujetas a retención','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332A','Por la enajenación ocasional de acciones o participaciones y títulos valores','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332B','Compra de bienes inmuebles','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332C','Transporte público de pasajeros','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332D','Pagos en el país por transporte de pasajeros o transporte internacional de carga, a compañías nacionales o extranjeras de aviación o marítimas','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332E','Valores entregados por las cooperativas de transporte a sus socios','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332F','Compraventa de divisas distintas al dólar de los Estados Unidos de América','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332G','Pagos con tarjeta de crédito ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332H','Pago al exterior tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo recap','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('332I','Pago a traves de convenio de debito (Clientes IFI`s)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('333','Enajenación de derechos representativos de capital y otros derechos cotizados en bolsa ecuatoriana','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('334','Enajenación de derechos representativos de capital y otros derechos no cotizados en bolsa ecuatoriana','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('335','Por loterías, rifas, apuestas y similares','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('336','Por venta de combustibles a comercializadoras','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('337','Por venta de combustibles a distribuidores','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('338','Compra local de banano a productor','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('339','Liquidación impuesto único a la venta local de banano de producción propia','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('340','Impuesto único a la exportación de banano de producción propia - componente 1','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('341','Impuesto único a la exportación de banano de producción propia - componente 2','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('342','Impuesto único a la exportación de banano producido por terceros','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('342A','Impuesto único a la exportación de banano producido por terceros de Asociaciones de micro y pequeños productores hasta 1000 cajas por semana por cada socio.','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('342B','Impuesto único a la exportación de banano producido por terceros de Asociaciones de micro, pequeños y medianos productores','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('343A','Por energía eléctrica','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('343B','Por actividades de construcción de obra material inmueble, urbanización, lotización o actividades similares','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('344','Otras retenciones aplicables el 2%','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('344A','Pago local tarjeta de crédito/ debito reportada por la Emisora de tarjeta de crédito / debito, solo recap','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('346A','Ganancias de capital','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('347','Donaciones en dinero -Impuesto a la donaciones ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('348','Retención a cargo del propio sujeto pasivo por la exportación de concentrados y/o elementos metálicos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('349','Retención a cargo del propio sujeto pasivo por la comercialización de productos forestales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('500','Pago al exterior - Rentas Inmobiliarias','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('501','Pago al exterior - Beneficios Empresariales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('502','Pago al exterior - Servicios Empresariales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('503','Pago al exterior - Navegación Marítima y/o aérea','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504','Pago al exterior- Dividendos distribuidos a personas naturales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504A','Pago al exterior - Dividendos a sociedades no paraiso fiscal cuyo beneficiario efectivo sea una PN residente en el Ecuador- Cuando la sociedad que distribuye aplicó tarifa del 22% IR','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504B','Pago al exterior - Anticipo dividendos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504C','Pago al exterior - Dividendos anticipados préstamos accionistas, beneficiarios o partìcipes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504D','Pago al exterior - Dividendos a fideicomisos no paraiso fiscal cuyo beneficiario efectivo sea una PN residente en el Ecuador','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504E','Pago al exterior- Dividendos distribuidos a personas naturales (paraísos fiscales)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504F','Pago al exterior - Dividendos a sociedades  (paraísos fiscales)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504G','Pago al exterior - Anticipo dividendos  (paraísos fiscales)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('504H','Pago al exterior - Dividendos a fideicomisos  (paraísos fiscales)','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505','Pago al exterior - Rendimientos financieros','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505A','Pago al exterior – Intereses de créditos de Instituciones Financieras del exterior','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505B','Pago al exterior – Intereses de créditos de gobierno a gobierno','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505C','Pago al exterior – Intereses de créditos de organismos multilaterales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505D','Pago al exterior - Intereses por financiamiento de proveedores externos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505E','Pago al exterior - Intereses de otros créditos externos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('505F','Pago al exterior - Otros Intereses y Rendimientos Financieros','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('509','Pago al exterior - Cánones, derechos de autor,  marcas, patentes y similares','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('509A','Pago al exterior - Regalías por concepto de franquicias','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('510','Pago al exterior - Ganancias de capital','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('511','Pago al exterior - Servicios profesionales independientes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('512','Pago al exterior - Servicios profesionales dependientes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('513','Pago al exterior - Artistas','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('513A','Pago al exterior - Deportistas','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('514','Pago al exterior - Participación de consejeros','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('515','Pago al exterior - Entretenimiento Público','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('516','Pago al exterior - Pensiones','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('517','Pago al exterior - Reembolso de Gastos','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('518','Pago al exterior - Funciones Públicas','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('519','Pago al exterior - Estudiantes','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520','Pago al exterior - Otros conceptos de ingresos gravados','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520A','Pago al exterior - Pago a proveedores de servicios hoteleros y turísticos en el exterior','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520B','Pago al exterior - Arrendamientos mercantil internacional','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520D','Pago al exterior - Comisiones por exportaciones y por promoción de turismo receptivo','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520E','Pago al exterior - Por las empresas de transporte marítimo o aéreo y por empresas pesqueras de alta mar, por su actividad.','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520F','Pago al exterior - Por las agencias internacionales de prensa','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('520G','Pago al exterior - Contratos de fletamento de naves para empresas de transporte aéreo o marítimo internacional','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('521','Pago al exterior - Enajenación de derechos representativos de capital y otros derechos ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('522A','Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías con convenio de doble tributación','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('522B','Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías sin convenio de doble tributación','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('522C','Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías en paraísos fiscales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('523A','Pago al exterior - Seguros y reaseguros (primas y cesiones)  con convenio de doble tributación','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('523B','Pago al exterior - Seguros y reaseguros (primas y cesiones) sin convenio de doble tributación','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('523C','Pago al exterior - Seguros y reaseguros (primas y cesiones) en paraísos fiscales','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('524','Pago al exterior - Otros pagos al exterior no sujetos a retención ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('524','Pago al exterior - Otros pagos al exterior no sujetos a retención ','ACTIVO');
Insert into SRI_TIPO_RETENCION (CODIGO,DESCRIPCION,ESTADO) values ('525','Donaciones en dinero -Impuesto a la donaciones ','ACTIVO');
REM INSERTING into SRI_SUSTENTO_TRIBUTARIO
SET DEFINE OFF;
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('01','Crédito Tributario para declaración de IVA (servicios y bienes distintos de inventarios y activos fijos)','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('02','Costo o Gasto para declaración de IR (servicios y bienes distintos de inventarios y activos fijos)','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('03','Activo Fijo - Crédito Tributario para declaración de IVA','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('04','Activo Fijo - Costo o Gasto para declaración de IR','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('05','Liquidación Gastos de Viaje, hospedaje y alimentación Gastos IR (a nombre de empleados y no de la empresa)','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('06','Inventario - Crédito Tributario para declaración de IVA','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('07','Inventario - Costo o Gasto para declaración de IR','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('08','Valor pagado para solicitar Reembolso de Gasto (intermediario)','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('09','Reembolso por Siniestros','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('10','Distribución de Dividendos, Beneficios o Utilidades','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('11','Convenios de débito o recaudación para IFI´s','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('12','Impuestos y retenciones presuntivos','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('13','Valores reconocidos por entidades del sector público a favor de sujetos pasivos','ACTIVO');
Insert into SRI_SUSTENTO_TRIBUTARIO (CODIGO,DESCRIPCION,ESTADO) values ('00','Casos especiales cuyo sustento no aplica en las opciones anteriores','ACTIVO');
commit;