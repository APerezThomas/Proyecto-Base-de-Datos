# 🛒 Proyecto Base de Datos Supermercado - Grupo7

Este proyecto implementa un **sistema de gestión para un supermercado** utilizando **SQL Server**.
Incluye creación de la base de datos, tablas y esquemas, procedimientos almacenados, seguridad y roles, reportes XML, importación de datos externos, backups automáticos y scripts de testing.

---

## 📂 Archivos Incluidos

### 🔹 **Base de Datos y Tablas**

* **`Tablas.sql`**

  * Creación de la base de datos `SUPERMERCADO_Grupo7`.
  * Definición de esquemas:

    * `esquema_Persona`
    * `esquema_Producto`
    * `esquema_Sucursal`
    * `esquema_operaciones`
    * `esquema_Ventas`
  * Creación de tablas principales con claves primarias y foráneas:

    * `Producto`, `LineaDeProducto`, `Cliente`, `Empleado` (con campos encriptados).
    * `Sucursales`, `Factura`, `NotaDeCredito`, `VentasRegistradas`, `DetalleDeVenta`, `MediosDePago`.

*DER de la Base de Datos*
<img width="2000" height="1684" alt="image" src="https://github.com/user-attachments/assets/cc27fa42-2d59-4883-bf5b-e6d236855eca" />

### 🔹 Procedimientos CRUD

* **`Stored_Procedure.sql`**

  * Procedimientos de **alta, baja y modificación** para:

    * Empleados (con encriptación).
    * Tipos de Cliente.
    * Medios de Pago.
    * Líneas de Producto.
    * Sucursales.
    * Productos.
  * Uso de transacciones, validaciones y `RAISERROR`.

### 🔹 Importación de Datos

* **Los archivos a importar estan comprimidos en `Archivos.rar`**
* **`Importar_Archivos.sql`**

  * Procedimientos para importar desde Excel/CSV con `OPENROWSET` y `BULK INSERT`:

    * `importarMediosDePago`
    * `importarEmpleado` (con encriptación y asociación de sucursal).
    * `importarImportados`, `importarElectronico`, `importarCatalogo`.
    * `importarLineDeProducto`
    * `importarSucursal`
  * Uso de tablas temporales y validaciones de existencia de archivos.

### 🔹 **Seguridad y Roles**

* **`Seguridad_DataBase.sql`**

  * Creación de **logins y usuarios**:

    * `MartinaGarcia` (Supervisor).
    * `ThomasPerez` (Cajero).
  * Definición de **roles**:

    * `Supervisor` → administración y reportes.
    * `Cajero` → ventas y facturación.
  * **Restricciones mediante TRIGGER**:

    * Solo el rol `Supervisor` puede insertar en `NotaDeCredito`.
  * Procedimientos para **desencriptar datos sensibles de empleados**.

### 🔹 **Reportes**

* **`Reportes.sql`**
  Procedimientos para generar **reportes en XML**:

  * `GenerarReporteMensualXML` → ventas totales por día de la semana.
  * `GenerarReporteTrimestralXML` → ventas por mes y turno.
  * `GenerarReportePorRangoFechasXML` → productos más vendidos en un rango.
  * `GenerarReporteVentasExtendidoXML` → incluye:

    * Ventas por sucursal y producto.
    * Top 5 productos más/menos vendidos.
    * Detalle por fecha y sucursal.

### 🔹 **Backup y Restauración**

* **`Backup_DataBase.sql`**
  Implementa el **esquema de respaldo**:

  * Crea el esquema `esquema_Respaldo`.
  * Procedimiento **`sp_BackupDatabases`**:

    * Soporta **Full (`F`)**, **Diferencial (`D`)** y **Log (`L`)**.
    * Genera automáticamente 7 archivos `.bak` (uno por día de la semana) con el formato:

      ```
      SUPERMERCADO_Grupo7_FULL_DiaX.bak
      ```
  * Procedimiento **`sp_RestoreDatabases`** para restaurar desde un archivo `.bak`.
  * Para que el respaldo sea automatico se debe programar un `ejecutable`.
  * Ejemplo de uso:

    ```sql
    EXEC esquema_Respaldo.sp_BackupDatabases 
         @databaseName = 'SUPERMERCADO_Grupo7', 
         @backupType = 'F', 
         @backupLocation = 'C:\Backup\';
         
    EXEC esquema_Respaldo.sp_RestoreDatabases 
         @path = N'C:\Backup\SUPERMERCADO_Grupo7_FULL_Dia5.bak', 
         @dateBaseName = 'SUPERMERCADO_Grupo7';
    ```
    <img width="2000" height="2829" alt="image" src="https://github.com/user-attachments/assets/e602cc06-174e-4031-868e-3f4d0e51bc51" />


### 🔹 **Testing**

* **`Tenting.sql`**
  Script de pruebas:

  * Inserción, modificación y eliminación en tablas principales.
  * Ejecución de importaciones externas (CSV/Excel).
  * Validación de errores y restricciones.
  * Prueba de reportes XML.

---

## 🛠️ Requisitos

* **DBMS:** SQL Server 2019 o superior. Mirar [informe de descarga de SQL](https://github.com/APerezThomas/Proyecto-Base-de-Datos/blob/main/Informe_de_Descarga_de_SQL.pdf).
* **Base de datos:** `SUPERMERCADO_Grupo7`.
* **Permisos:** usuario con rol `sysadmin` para crear logins, roles, triggers y ejecutar backups.
* **Archivos externos:** ajustar rutas de CSV/Excel en los procedimientos de importación (ejemplo: `C:\Users\PC\Desktop\...`).
* **Proveedor OLEDB**: `Microsoft.ACE.OLEDB.12.0` o `Microsoft.ACE.OLEDB.16.0` habilitado.

---

## 🚀 Cómo Usar

1. **Crear y configurar la BD:**

   ```sql
   USE master;
   CREATE DATABASE SUPERMERCADO_Grupo7;
   GO
   ```

2. **Ejecutar scripts en el siguiente orden:**

   1. `Tablas.sql` → crea base y tablas.
   2. `Stored_Procedure.sql` → CRUD.
   3. `Importar_Archivos.sql` → importaciones.
   4. `Seguridad_DataBase.sql` → logins, roles y trigger.
   5. `Reportes.sql` → reportes XML.
   6. `Backup_DataBase.sql` → backup y restauración.
   7. `Tenting.sql` → pruebas funcionales.

3. **Ejemplo de ejecución de reportes:**

   ```sql
   EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 3, @Año = 2019;
   EXEC esquema_Ventas.GenerarReporteTrimestralXML @Trimestre = 1, @Año = 2019;
   EXEC esquema_Ventas.GenerarReportePorRangoFechasXML '2019-01-01', '2019-03-20';
   ```

---

## 🔒 **Seguridad y Roles**

* **Supervisor:** control total (ventas, productos, sucursales, reportes, backups).
* **Cajero:** permisos limitados (ventas, facturación).
* **Trigger `ValidarInsercionDeSupervisor`:** evita inserciones en `NotaDeCredito` de usuarios sin rol Supervisor.

---

## 📊 **Funcionalidades Clave**

* Importación masiva de datos desde **Excel/CSV**.
* Encriptación y desencriptación de datos sensibles de empleados.
* Manejo robusto de errores con `TRY...CATCH` y `RAISERROR`.
* Reportes avanzados en **formato XML**.
* Respaldo y restauración automática de la base de datos.
* Integridad referencial asegurada mediante **claves foráneas** y validaciones.

---
