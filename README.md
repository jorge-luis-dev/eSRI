# Aplicación para generar los ATS SRI Ecuador

## Oracle Forms 10g

NLS_LANG = SPANISH_SPAIN.WE8MSWIN1252

### Configuración
1. Añadir en el archivo orion-web.xml, en C:\ods\j2ee\DevSuite\application-deployments\forms\formsweb.
   ```   
   <virtual-directory virtual-path="/icons" real-path="G:\eSRI\forms10g\iconos" />
   ```
2. En el archivo Registry.dat, en C:\ods\forms\java\oracle\forms\registry, buscar las líneas.
   ```
   default.icons.iconpath=icons/
   default.icons.iconextension=gif
   ```
3. En el archivo default.env, en C:\ods\forms\server, buscar la línea.
   ```
   FORMS_PATH=C:\ods\forms;G:\eSRI\forms10g\formas
   ```
4. Abrir regedit, en la dirección HKEY_LOCAL_MACHINE/SOFTWARE/ORACLE/HKEY_DevSuiteHome, las variables.
   ```
   UI_ICON_EXTENSION	gif
   UI_ICON		G:\eSRI\forms10g\iconos
   REPORTS_PATH	G:\eSRI\forms10g\reportes
   ```
5. En el archivo formsweb.cfg, en C:\ods\forms\server, añadir lo siguiente al final.
```
[sri]
envFile=default.env
form=sri_detalle_compra.fmx
imageBase=DocumentBase
webUtilArchive=frmwebutil.jar,jacob.jar
WebUtilLogging=off
WebUtilLoggingDetail=normal
WebUtilErrorMode=Alert
WebUtilDispatchMonitorInterval=5
WebUtilTrustInternal=true
WebUtilMaxTransferSize=16384
WebUtilMaxTransferSize=16384
baseHTMLjinitiator=webutilbase.htm
baseHTMLjpi=webutilbase.htm
baseHTMLie=webutilbase.htm
baseHTML=webutilbase.htm
archive=frmall.jar
lookAndFeel=oracle
width=100%
height=100%
separateFrame=true
userid=sri/s@xe
pageTitle=eSRI ATS Ecuador
```

```
[roteg]
envFile=default.env
form=roteg.fmx
imageBase=DocumentBase
baseHTML=base.htm
baseHTMLjinitiator=basejpi.htm
baseHTMLjpi=basejpi.htm
archive=frmall.jar
lookAndFeel=oracle
width=100%
height=100%
separateFrame=true
pageTitle=Roteg
```
7. Iniciar servidor Oracle Reports
```
rwserver server=server_name
```
6. En el archivo tnsnames.ora, en C:\ods\network\ADMIN, añadir.
```
xe = 
  (DESCRIPTION = 
    (ADDRESS_LIST = 
        (ADDRESS = 
          (COMMUNITY = tcp.world)
          (PROTOCOL = TCP)
          (Host = 192.168.56.1)
          (Port = 1521)
        )
    )
    (CONNECT_DATA = (SID = xe)
    )
  )
```
### WebUtil Version 1.0.6
1. Copiar el archivo webutil_106\java\frmwebutil.jar en C:\ods\forms\java\
2. Copiar el archivo jacob_18\jacob.jar en C:\ods\forms\java\
3. Copiar los archivo webutil_106\webutil\d2kwut60.dll y webutil_106\webutil\JNIsharedstubs.dll en C:\ods\forms\webutil\
4. Copiar el archivo jacob_18\jacob.dll en C:\ods\forms\webutil\
5. Copiar los archivos webutil_106\java\forms_base_ie.js y webutil_106\java\forms_ie.js en C:\ods\forms\java\
6. Copiar los archivos webutil_106\webutil.olb, webutil_106\webutil.pll y webutil_106\create_webutil_db.sql en C:\ods\forms\
7. Copiar los archivos webutil_106\server\webutiljpi.htm, webutil_106\server\webutiljini.htm, webutil_106\server\webutilbase.htm y webutil_106\server\webutil.cfg en C:\ods\forms\server\
8. Copiar el archivo webutil_106\webutil\sign_webutil.bat en C:\ods\forms\webutil\
9. En el archivo C:\ods\forms\server\default.env, añadir en la variable CLASSPATH la ruta del archivo C:\ods\forms\java\jacob.jar
10. Abrir regedit, en la dirección HKEY_LOCAL_MACHINE/SOFTWARE/ORACLE/HKEY_DevSuiteHome, en la variable FORMS_BUILDER_CLASSPATH, añadir C:\ods\forms\java\jacob.jar
11. Ejecutar en cmd:
```
C:\ods\forms\webutil\sign_webutil.bat C:\ods\forms\java\frmwebutil.jar
C:\ods\forms\webutil\sign_webutil.bat C:\ods\forms\java\jacob.jar
```
12. Conectar con el usuario de base de datos y ejecutar el script, C:\ods\forms\create_webutil_db.sql
13. Abrir Forms Builder el archivo, C:\ods\forms\webutil.pll y en el Menú Archivo, Guardar como y renombrar a WEBUTIL_LIB.pll, compilar y generar el archivo WEBUTIL_LIB.plx.
14. Abrir la forma donde se quiere añadir las funciones de WebUtil.
15. Abrir el archivo, C:\ods\forms\webutil.olb
16. En la Opción Bibliotecas de Objetos, en WEBUTIL clic derecho y Biblioteca de Objetos.
17. En la pestaña WebUtil Objects, arrastrar la opción WEBUTIL a Grupos de Objetos y hacer clic en Subclase.
18. En la opción Bibliotecas Conectadas, botón (+), botón Examinar, buscar el archivo C:\ods\forms\WEBUTIL_LIB.pll y Conectar. Eliminar la ruta de acceso.


## Oracle Forms 6i
