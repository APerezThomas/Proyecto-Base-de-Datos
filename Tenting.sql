
USE SUPERMERCADO_Grupo7
GO

-----------------------------------------------TESTING ENTREGA N°3-------------------------------------------------
----------------------------------SUCURSALES

---FUNCIONA

exec esquema_Sucursal.insertarSucursal 'Gotham City','Lomas del Mirador','Venancio Flores 261',
'B1752 Lomas del Mirador','Provincia de Buenos Aires','9 a 12','23434341'
go
exec esquema_Sucursal.insertarSucursal 'Metropolis','Gregorio de Laferrere','Av. Gral. Rojo 345',
'B1755 Gregorio de Laferrere','Provincia de Buenos Aires','12 a 18','23434342'
go
exec esquema_Sucursal.insertarSucursal 'Ciudad Central','Virrey del Pino','Maximo Herrera 5767',
'B1763 Virrey del Pino','Provincia de Buenos Aires','18 a 23','23434343'
go
exec esquema_Sucursal.insertarSucursal 'Ciudad Costera','Virrey del Pino','Maximo Herrera 5767',
'B1763 Virrey del Pino','Provincia de Misiones','18 a 23','23434343'
go
select* from esquema_Sucursal.sucursales
go

exec esquema_Sucursal.modificarSucursal 4,'Gotham City','Lomas del Mirador','Venancio Flores 261',
'B1752 Lomas del Mirador','Provincia de Mendoza','8 a 14','23434341'
go
exec esquema_Sucursal.modificarSucursal 5,'Metropolis','Gregorio de Laferrere','Piedra Buena 6028',
'B1757 Gregorio de Laferrere','Provincia de Buenos Aires','6 a 18','23333342'
go
select* from esquema_Sucursal.sucursales
go

exec esquema_Sucursal.eliminarSucursal 7
go
select* from esquema_Sucursal.sucursales
go

---NO FUNCIONA

--No se pudo insertar la nueva sucursal porque ya existe esta misma direccion
exec esquema_Sucursal.insertarSucursal 'Yangon','x','Av. Brig. Gral. Juan Manuel de Rosas 3634',
'B1754 San Justo','Provincia de Buenos Aires','9 a 12','23434341'
go

------Tambien fallan si el ID es NULL: Se debe enviar el ID de la sucursal
exec esquema_Sucursal.modificarSucursal @id = NULL,@ciudad = 'CABA',@reemplazadaX = 'fam',@calleYNum = 'Mendoza 234',
@localidadYCodPostal = 'Belgrano',@provincia = 'Buenos Aires',@horario = '12 a 16',@telefono = '23434341'
go
exec esquema_Sucursal.eliminarSucursal @id = NULL
go
--No se puede modificar la sucursal ya que no existe la sucursal con ID 5
exec esquema_Sucursal.modificarSucursal 7,'Ciudad Costera','Virrey del Pino','Maximo Herrera 5767','B1763 Virrey del Pino',
'Provincia de Misiones','18 a 23','23434343'
go

--No se pude eliminar la sucursal ya que no existe la sucursal con ID 5
exec esquema_Sucursal.eliminarSucursal 7
go

----------------------------------EMPLEADOS

---FUNCIONA

exec esquema_Persona.insertarEmpleado 257035,'Bruce','Wayne',45042979,'Zapata 5664', 'Lomas del Mirador',
'Buenos Aires',24215,'Cajero','Naypyitaw','TT','BruceWayne@gmail.com','trabajo@gmail.com'
go
exec esquema_Persona.modificarEmpleado 16,257035,'Bruce Wayne','Diaz',45042979,'Venancio Flores 261', 'Lomas del Mirador',
'Buenos Aires',24215,'Repositor','Mandalay','TM','Batman@gmail.com','Batmantrabajo@gmail.com'
go
exec esquema_Persona.ObtenerEmpleadoDesencriptado 16
go
exec esquema_Persona.eliminarEmpleado  16,257035
go

---NO FUNCIONA

--Ya existe un empleado con el mismo legajo o número de documento.
exec esquema_Persona.insertarEmpleado 257035,'Bruce','Wayne',45042979,'Zapata 5664', 'Lomas del Mirador',
'Buenos Aires',24215,'Cajero','Naypyitaw','TT','BruceWayne@gmail.com','trabajo@gmail.com'
go

--La sucursal Ciudad de Mexico no existe.
exec esquema_Persona.insertarEmpleado 257035,'Bruce','Wayne',45042979,'Zapata 5664', 'Lomas del Mirador',
'Buenos Aires',24215,'Cajero','Ciudad de Mexico','TT','BruceWayne@gmail.com','trabajo@gmail.com'
go

--Una vez que se elimino y se quiere volver a eliminar: No existe empleado con legajo 257035 y ID 16
exec esquema_Persona.eliminarEmpleado  16,257035
go

--Se debe enviar el legajo y el ID del empleado
exec esquema_Persona.eliminarEmpleado  NULL,NULL
go

--El empleado con el ID y legajo especificados no existe 
exec esquema_Persona.modificarEmpleado 16,257035,'Bruce Wayne','Diaz',45042979,'Venancio Flores 261', 'Lomas del Mirador',
'Buenos Aires',24215,'Repositor','Mandalay','TM','Batman@gmail.com','Batmantrabajo@gmail.com'
go

--Se debe enviar el legajo y el ID del empleado.
exec esquema_Persona.modificarEmpleado NULL,NULL,'Bruce Wayne','Diaz',45042979,'Venancio Flores 261', 'Lomas del Mirador',
'Buenos Aires',24215,'Repositor','Mandalay','TM','Batman@gmail.com','Batmantrabajo@gmail.com'
go

--La sucursal Ciudad Esmeralda no existe.
exec esquema_Persona.modificarEmpleado 16,257035,'Bruce Wayne','Diaz',45042979,'Venancio Flores 261', 'Lomas del Mirador',
'Buenos Aires',24215,'Repositor','Ciudad Esmeralda','TM','Batman@gmail.com','Batmantrabajo@gmail.com'
go



----------------------------------TIPO DE CLIENTE

---FUNCIONA

exec esquema_Persona.insertarTipoDeCliente 'Member','0000000.' 
go
exec esquema_Persona.insertarTipoDeCliente 'Normal','18367382.'
go
exec esquema_Persona.insertarTipoDeCliente 'Regular','1478893.'
go
exec esquema_Persona.insertarTipoDeCliente 'Premium','1493830.'
go
exec esquema_Persona.insertarTipoDeCliente 'Negativo','0809809.'
go
select* from esquema_Persona.cliente
go

exec esquema_Persona.modificarTipoDeCliente 1,'Miembro','1111111.'
go
exec esquema_Persona.modificarTipoDeCliente 3,'Regular','8888888.'
go
exec esquema_Persona.modificarTipoDeCliente 5,'Negativo 2.0','999999.'
go
select* from esquema_Persona.cliente
go

exec esquema_Persona.eliminarTipoDeCliente 5
go
select* from esquema_Persona.cliente
go

---NO FUNCIONA

-- Ya existe un tipo de cliente con el nombre especificado
exec esquema_Persona.insertarTipoDeCliente 'Normal','18367382'
go

------Tambien fallan si el ID es NULL: Se debe enviar el ID del tipo de cliente 
exec esquema_Persona.modificarTipoDeCliente @id = NULL,@tipoCliente = 'Miembro',@Descripcion = '1234'
go
exec esquema_Persona.eliminarTipoDeCliente @id = NULL 
go
-- No existe el tipo de cliente con ese ID 
exec esquema_Persona.modificarTipoDeCliente 5,'Miembro','1234.'
go

-- No existe el tipo de cliente con ID 4
exec esquema_Persona.eliminarTipoDeCliente 5 
go


----------------------------------MEDIOS DE PAGO

---FUNCIONA
exec esquema_operaciones.insertarMedioDePago 'Check','Cheque'
go
exec esquema_operaciones.insertarMedioDePago 'MODO','Billetera Virtual'
go
exec esquema_operaciones.insertarMedioDePago 'Cuenta DNI','Billetera Virtual'
go
select* from esquema_operaciones.MediosDePago
go

exec esquema_operaciones.modificarMedioDePago 6,'Mercado Pago','Billetera Virtual'
go
select* from esquema_operaciones.MediosDePago
go

exec esquema_operaciones.eliminarMedioDePago 4
go
select* from esquema_operaciones.MediosDePago
go

---NO FUNCIONA

-- El medio de pago ya existe
exec esquema_operaciones.insertarMedioDePago 'Mercado Pago','Billetera Virtual'
go

------Tambien fallan si el ID es NULL: Se debe enviar el ID del Medio de Pago
exec esquema_operaciones.modificarMedioDePago @id = NULL, @MedioDePago = 'Check',@NombreEs = 'Cheque'
go
exec esquema_operaciones.eliminarMedioDePago @id = NULL
go

-- No existe el id de medios de pago con ID 5
exec esquema_operaciones.modificarMedioDePago 4, 'Check','Cheque'
go

-- No existe el id de medios de pago con ID 5
exec esquema_operaciones.eliminarMedioDePago 8
go

----------------------------------LINEA DE PRODUCTO

---FUNCIONA

exec esquema_Producto.insertarLineaDeProducto  1, 'perfumria','jabon'
go
exec esquema_Producto.insertarLineaDeProducto  2, 'perfumria','acondicionador'
go
exec esquema_Producto.insertarLineaDeProducto  3, 'Almacen','yogurt con cereales mixtos'
go
exec esquema_Producto.insertarLineaDeProducto  4, 'Almacen','agua mineral sin gas'
go
select* from esquema_Producto.LineaDeProducto
go

exec esquema_Producto.modificarLineaDeProducto 149, 'Almacen','jabon'
go
exec esquema_Producto.modificarLineaDeProducto 151, 'Almacen','yogurt con rocklets'
go
exec esquema_Producto.modificarLineaDeProducto 152, 'Almacen','agua mineral con gas'
go
select* from esquema_Producto.LineaDeProducto 
go

exec esquema_Producto.eliminarLineaDeProducto 152
go
select* from esquema_Producto.LineaDeProducto
go
---NO FUNCIONA

------Tambien fallan si el ID es NULL: Se debe enviar el ID del Producto
exec esquema_Producto.insertarLineaDeProducto  @idProducto = NULL, @lineaDeProducto = 'perfumria',
@productoDescrip = 'acondicionador'
go

-- La línea de producto ya existe para el producto con ID 2
exec esquema_Producto.insertarLineaDeProducto  2, 'perfumria','acondicionador'
go

------Tambien fallan si el ID es NULL: Se debe enviar el ID de la Linea de Producto
exec esquema_Producto.modificarLineaDeProducto @id = NULL , @lineaProducto = 'almacen',@productoDescrip = 'jabon'
go
exec esquema_Producto.eliminarLineaDeProducto @id = NULL
go

-- No existe la línea de producto con ID 200
exec esquema_Producto.modificarLineaDeProducto 200, 'almacen','jabon'
go

--No existe el id de línea de producto 200 
exec esquema_Producto.eliminarLineaDeProducto 200
go


----------------------------------PRODUCTO
--FUNCIONA

exec esquema_Producto.insertarProducto 6428, 'limpieza cocina','Cif Bioactive',2.40, 0.15,'L',
'2022-08-04 12:30',NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL
go
exec esquema_Producto.insertarProducto NULL, NULL, NULL, NULL,NULL, NULL, NULL,78, 'Salsa de Soja',
'Tarantino','Condimentos','12 cajas',12.50, NULL, NULL 
go
exec esquema_Producto.insertarProducto NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL,
'Samsung A30',200000.00
go
select * from esquema_Producto.Producto 
go

exec esquema_Producto.modificarProducto 6530,6428,'limpieza cocina y baño', 'Cifs Bioactive',4.40, 0.29,'L',
'2022-09-11 08:30',NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL
go
exec esquema_Producto.modificarProducto 6531, NULL, NULL, NULL, NULL,NULL, NULL, NULL,78,'Salsa marina',
'Quentin Tarantino','Condimentos','29 cajas',69.50, NULL, NULL 
go
exec esquema_Producto.modificarProducto 6532, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, 
NULL, NULL, NULL,NULL, NULL,'Samsung S21',500000.00
go
select * from esquema_Producto.Producto 
go

exec esquema_Producto.eliminarProducto 6530
exec esquema_Producto.eliminarProducto 6531
exec esquema_Producto.eliminarProducto 6532
select * from esquema_Producto.Producto 
go

--NO FUNCIONA

--ya existe un producto con el idCatalogo 6428. El id debe ser único.
exec esquema_Producto.insertarProducto 6428, 'limpieza cocina','Cif Bioactive',2.40, 0.15,'L','2022-08-04 12:30',
NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL
go

--Ya existe un producto con el idImportado 78. El id debe ser único.
exec esquema_Producto.insertarProducto NULL, NULL, NULL, NULL,NULL, NULL, NULL,78, 'Salsa de Soja',
'Tarantino','Condimentos','12 cajas',12.50, NULL, NULL 
go

--Ya existe un producto electrónico con el mismo nombre y precio. Nombre: Samsung A30, Precio: 200000.00
exec esquema_Producto.insertarProducto NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, 
NULL, NULL, NULL,NULL, NULL,'Samsung A30',200000.00
go

--No existe un producto con el idCatalogo 6428. Verifique el identificador
exec esquema_Producto.modificarProducto  6530,6428,'limpieza cocina y baño', 'Cifs Bioactive',4.40, 0.29,'L',
'2022-09-11 08:30',NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL

--No existe el producto con ID 6530
exec esquema_Producto.eliminarProducto 6530
go

----------------------------------VENTA

--TABLA VENTAS

---FUNCIONA

EXEC esquema_Ventas.insertarVentas  631457, 'A', 'Yangon', 'Regular', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '0000008986865';
GO 
EXEC esquema_Ventas.insertarVentas  10029457, 'B', 'Naypyitaw', 'Miembro', 'Female', 
'Macbook Pro Laptop', 1693200.00, 1, '2024-11-13', '09:15:00', 'Cash', 257024, '0928198772';
GO
EXEC esquema_Ventas.insertarVentas  1082374, 'C', 'Metropolis', 'Premium', 'Male', 
'Frambuesas',2.29 , 1, '2024-12-13', '10:15:00', 'Mercado Pago', 257024, '23870000997';
GO
EXEC esquema_Ventas.insertarVentas  226313076, 'A', 'Gotham City', 'Normal', 'Female', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:50:00', 'Ewallet',257021 , '00006639865';
GO
SELECT * FROM esquema_Ventas.ventasRegistradas
GO


---NO FUNCIONA 

--Ya existe una venta con el idFactura 631457
EXEC esquema_Ventas.insertarVentas  631457, 'A', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '0000008986865';
GO

--Ya existe una venta con el idFactura 226313076
EXEC esquema_Ventas.insertarVentas  226313076, 'A', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '0000008986865';
GO

--El tipo de factura debe ser 'A', 'B' o 'C'. Valor recibido: J
EXEC esquema_Ventas.insertarVentas  2998448, 'J', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '0000008986865';
GO

--Ya existe un registro con el identificador 0000008986865 en la tabla de ventas.
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '0000008986865';
GO

--No existe esta sucursal Jangon.
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Jangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '01480923840';
GO

--No existe este tipo de cliente Normalizado.
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Yangon', 'Normalizado', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '01480923840';
GO

--No existe este producto Frambuesas con ese precio unitario
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Yangon', 'miembro', 'Male', 
'Frambuesas', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',257021 , '01480923840';
GO

--No existe este medio de pago Cuenta DNI
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Cuenta DNI',257021 , '01480923840';
GO

--No existe un empleado con el legajo 25.
EXEC esquema_Ventas.insertarVentas  2998448, 'A', 'Yangon', 'miembro', 'Male', 
'Especias Cajun del chef Anton', 22.00, 4, '2024-11-13', '10:45:00', 'Ewallet',25 , '01480923840';
GO

--PRUEBA TABLA DETALLE VENTAS

---FUNCIONA

EXEC esquema_operaciones.insertarDetalleDeVenta  1001, 102,'Especias Cajun del chef Anton', 22.00, 4,1
GO
EXEC esquema_operaciones.insertarDetalleDeVenta  1003,104,'Frambuesas',2.29 , 1,3
GO
EXEC esquema_operaciones.insertarDetalleDeVenta  1004, 105,'Especias Cajun del chef Anton', 22.00, 4,1
GO
SELECT * FROM esquema_operaciones.DetalleDeVenta
GO

--NO FUNCIONA

--Se debe enviar EL id de venta y el id del producto
EXEC esquema_operaciones.insertarDetalleDeVenta  @VentaID = NULL, @Codigo = 104,@Descripcion = 'Frambuesas',
@PrecioUnitario = 2.29 ,@Cantidad = 1, @idProducto = NULL
GO

--El ID de producto proporcionado no existe en la tabla Producto
EXEC esquema_operaciones.insertarDetalleDeVenta  1003,104,'Frambuesas',2.29 , 1,938475848
GO

--El ID de Ventas no existe
EXEC esquema_operaciones.insertarDetalleDeVenta  77437,104,'Frambuesas',2.29 , 1,3
GO

--El codigo de venta ya existe 104
EXEC esquema_operaciones.insertarDetalleDeVenta  1003,104,'Frambuesas',2.29 , 1,3
GO
SELECT * FROM esquema_Ventas.ventasRegistradas
GO


--PRUEBA TABLA INSERTAR FACTURA

---FUNCIONA

EXEC esquema_operaciones.insertarFactura 1001,631457, '2024-11-13', '10:45:00',
257021, 456.66 , 'A','Yangon','Ewallet','PAGADA'
GO
EXEC esquema_operaciones.insertarFactura 1002,10029457, '2024-11-13', '09:15:00',
257024, 1693200.00 , 'B','Naypyitaw','Cash','CANCELADA'
GO  
EXEC esquema_operaciones.insertarFactura 1003,1082374,'2024-12-13','10:15:00',
257024,345.8,'C','Metropolis','Mercado Pago','PAGADA'
GO
EXEC esquema_operaciones.insertarFactura 1004,226313076,'2024-11-13','10:50:00',
257021,8748,'A','Gotham City','Ewallet','PAGADA'
GO
SELECT * FROM esquema_operaciones.Factura
GO

---NO FUNCIONA

--Se debe enviar EL id de venta y el nro de factura
EXEC esquema_operaciones.insertarFactura @VentaID = NULL,@idFactura = NULL,@FechaEmision = '2024-11-13',
@HoraEmision = '10:50:00',@IdEmpleado = 257021,@Total = 8748,@TipoDeFactura = 'A',@CiudadDeSucursal = 'Gotham City',
@MedioDePago = 'Ewallet', @Estado = 'PAGADA'
GO

--El medio de pago no existe
EXEC esquema_operaciones.insertarFactura 1004,226313076,'2024-11-13','10:50:00',
257021,8748,'A','Gotham City','Cheque','PAGADA'
GO

--El ID de Ventas no existe 20000
EXEC esquema_operaciones.insertarFactura 20000,226313076,'2024-11-13','10:50:00',
257021,8748,'A','Gotham City','Ewallet','PAGADA'
GO

--El número de factura 226313076 ya existe. El número de factura debe ser único.
EXEC esquema_operaciones.insertarFactura 1004,226313076,'2024-11-13','10:50:00',
257021,8748,'A','Gotham City','Ewallet','PAGADA'
GO

---ELIMINAR VENTA CON SU FACTURA Y DETALLE

---FUNCIONA

exec esquema_Ventas.eliminarVenta 1001
GO
exec esquema_Ventas.eliminarVenta 1002
GO
exec esquema_Ventas.eliminarVenta 1003
GO
exec esquema_Ventas.eliminarVenta 1004
GO
SELECT * from esquema_Ventas.ventasRegistradas
GO

exec esquema_operaciones.eliminarFactura 1
go 
exec esquema_operaciones.eliminarFactura 2
go 
exec esquema_operaciones.eliminarFactura 3
go 
SELECT * FROM esquema_operaciones.Factura
GO

exec esquema_operaciones.eliminarDetalleDeVenta 1
go
exec esquema_operaciones.eliminarDetalleDeVenta 2
go
exec esquema_operaciones.eliminarDetalleDeVenta 3
go

SELECT * FROM esquema_operaciones.DetalleDeVenta
GO

---NO FUNCIONA

--Los IDs ya no existen en sus tablas
exec esquema_Ventas.eliminarVenta 1001
GO
exec esquema_operaciones.eliminarFactura 1
go 
exec esquema_operaciones.eliminarDetalleDeVenta 1
go

--Se mandaron valores NULL
exec esquema_Ventas.eliminarVenta @VentaID = NULL
GO
exec esquema_operaciones.eliminarFactura @FacturaID = NULL
go 
exec esquema_operaciones.eliminarDetalleDeVenta @DetalleID = NULL
go

-----------------------------------------------TESTING DE ENTREGA NRO 4--------------------------------------------------------------------

----------IMPORTAR MEDIOS DE PAGO:
EXEC esquema_operaciones.importarMediosDePago 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx',
@nombreHoja = 'medios de pago$'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Error al importar los medios de pago: Uno o más medios de pago ya existen en la tabla. 
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_operaciones.importarMediosDePago 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx'
GO

-----------IMPORTAR EMPLEADOS:
EXEC esquema_Persona.importarEmpleado 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx',
@nombreHoja = 'Empleados$'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existen empleados con el mismo Legajo, DNI o CUIL en la tabla.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_Persona.importarEmpleado @nombreHoja = 'Empleados$'
go

-----------IMPORTAR IMPORTADOS:
EXEC esquema_Producto.importarImportados 
@RutaArchivo ='C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Productos\Productos_importados.xlsx',
@nombreHoja = 'Listado de Productos$'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Uno o más IdProducto ya existen en la tabla Producto.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_Producto.importarImportados @nombreHoja = 'Listado de Productos$'
go 

-----------IMPORTAR ELECTRICO:
EXEC esquema_Producto.importarElectronico   
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Productos\Electronic accessories.xlsx', 
@nombreHoja ='Sheet1$', @DolarOficial=996
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existen productos electrónicos con el mismo nombre y precio en la tabla.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_Producto.importarElectronico   
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Productos\Electronic accessories.xlsx'
GO

-----------IMPORTAR LINEA PRODUCTO:
EXEC esquema_Producto.importarLineDeProducto 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx', 
@nombreHoja = 'Clasificacion productos'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existen registros con la misma Línea de Producto y Producto en la tabla.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_Producto.importarLineDeProducto @nombreHoja = 'Clasificacion productos'
go

-----------IMPORTAR CATALOGO:
EXEC esquema_Producto.importarCatalogo 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Productos\catalogo.csv'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existe uno o más del mismo id de catálogo en la tabla.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA RUTA DEL ARCHIVO
EXEC esquema_Producto.importarCatalogo 
GO

-----------IMPORTAR SUCURSAL:
EXEC esquema_Sucursal.importarSucursal 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx',
@nombreHoja = 'sucursal$'
GO
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existen registros con la misma ciudad, localidad, calle y provincia en la tabla destino.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA O LA HOJA O LA RUTA DEL ARCHIVO
EXEC esquema_Sucursal.importarSucursal 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Informacion_complementaria.xlsx'
GO

-----------IMPORTAR VENTAS REGISTRADAS:
EXEC esquema_Ventas.importarVentasRegistradas 
@RutaArchivo = 'C:\Users\PC\Desktop\supermercado\Proyecto-SupermercadoBueno\TP_integrador_Archivos\TP_integrador_Archivos\Ventas_registradas.csv'
go
-- Si vuelvo a ejecutar el EXEC, se produce un fallo: Ya existe una factura con el mismo idFactura en la tabla destino.
-- No se pueden insertar duplicados.

-- FALLA PORQUE NO MANDE LA RUTA DEL ARCHIVO
EXEC esquema_Ventas.importarVentasRegistradas 
GO

---------------------------------------------------TESTING ENTREGA NRO 5--------------------------------------------------

----------OBTENER EMPLEADO (Desencripta el empleado)

---FUNCIONA

exec esquema_Persona.ObtenerEmpleadoDesencriptado 1
GO
exec esquema_Persona.ObtenerEmpleadoDesencriptado 2
GO
exec esquema_Persona.ObtenerEmpleadoDesencriptado 3
GO

---NO FUNCIONA

--Se debe enviar el ID del empleado
exec esquema_Persona.ObtenerEmpleadoDesencriptado NULL
GO

--No se encontró ningún empleado con el ID proporcionado.
exec esquema_Persona.ObtenerEmpleadoDesencriptado 80
GO


----------INSERTAR NOTA DE CREDITO

-- Asignar el rol Supervisor a un usuario
EXEC sp_addrolemember 'Supervisor', 'MartinaGarcia';
SELECT IS_ROLEMEMBER('Supervisor', 'MartinaGarcia') AS RolVerificado;

exec esquema_operaciones.insertarNotaDeCredito 750678428, 'A', 'Member', '2019-01-06',5.00 , 'Vencido'
GO
exec esquema_operaciones.insertarNotaDeCredito 123191176, 'A', 'Member', '2019-01-27',1.30 , 'Vencido'
GO
SELECT *
FROM esquema_operaciones.NotaDeCredito

---NO FUNCIONA

--Ya existe la nota de credito con la factura 123191176.
exec esquema_operaciones.insertarNotaDeCredito 123191176, 'A', 'Member', '2019-01-27',1.30 , 'Vencido'
GO

--El idFactura 1 especificado no existe.
exec esquema_operaciones.insertarNotaDeCredito 1, 'A', 'Member', '2019-01-27',1.30 , 'Vencido'
GO

--El Tipo de Cliente X especificado no existe.
exec esquema_operaciones.insertarNotaDeCredito 373737910, 'A', 'X', '2019-01-27',1.30 , 'Vencido'
GO

EXEC sp_addrolemember 'Supervisor', 'ThomasPerez';
SELECT IS_ROLEMEMBER('Supervisor', 'ThomasPerez') AS RolVerificado;

--Solo los supervisores pueden insertar en la tabla NotasDeCredito.
exec esquema_operaciones.insertarNotaDeCredito 373737910, 'A', 'X', '2019-01-27',1.30 , 'Vencido'
GO

-----------------------------------------PRUEBA DE EJECUCION REPORTES-------------------------------------------------------
-----------Llamada reporte mensual

---FUNCIONA

EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 3, @Año = 2019;
GO
EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 2, @Año = 2019;
GO
EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 1, @Año = 2019;
GO
---NO FUNCIONA

--El mes 80 no es valido, debe estar entre 1 y 12
EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 80, @Año = 2019;
GO

--El año 8 no es valido, debe estar entre 1900 y el año actual.
EXEC esquema_Ventas.GenerarReporteMensualXML @Mes = 1, @Año = 8;
GO

-----------Llamada reporte trimestral

--FUNCIONA
EXEC esquema_Ventas.GenerarReporteTrimestralXML @Trimestre = 1, @Año = 2019;
GO

---NO FUNCIONA

--El trimestre debe estar entre 1 y 4.
EXEC esquema_Ventas.GenerarReporteTrimestralXML @Trimestre = 5, @Año = 2019;
GO

--El año 19 no es valido, debe estar entre 1900 y el año actual.
EXEC esquema_Ventas.GenerarReporteTrimestralXML @Trimestre = 1, @Año = 19;
GO

-----------Llamada reporte por rango fechas

---FUNCIONA

EXEC esquema_Ventas.GenerarReportePorRangoFechasXML '2019-01-01', '2019-03-20';
GO

---NO FUNCIONA

--La fecha de inicio no puede ser posterior a la fecha de fin.
EXEC esquema_Ventas.GenerarReportePorRangoFechasXML '2019-03-20', '2019-01-01';
GO

-----------Llamada reporte por rango fechas extendido

---FUNCIONA

EXEC esquema_Ventas.GenerarReporteVentasExtendidoXML 
    '2019-01-01',         -- FechaInicio
    '2019-03-01',         -- FechaFin
    '2019-01-01',         -- MesAño (aca pasas un valor de fecha)
    '2019-02-01',         -- FechaEspecifica
    'Yangon';             -- SucursalCiudad
GO

EXEC esquema_Ventas.GenerarReporteVentasExtendidoXML 
    '2019-01-01',         -- FechaInicio
    '2019-03-20',         -- FechaFin
    '2019-01-01',         -- MesAño (aca pasas un valor de fecha)
    '2019-02-01',         -- FechaEspecifica
    'Naypyitaw';          -- SucursalCiudad
GO

EXEC esquema_Ventas.GenerarReporteVentasExtendidoXML 
    '2019-01-01',         -- FechaInicio
    '2019-03-20',         -- FechaFin
    '2019-01-01',         -- MesAño (aca pasas un valor de fecha)
    '2019-02-01',         -- FechaEspecifica
    'Mandalay';           -- SucursalCiudad
GO
