# Aplicación para generar los ATS SRI Ecuador

## Oracle Forms 10g
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


## Oracle Forms 6i
