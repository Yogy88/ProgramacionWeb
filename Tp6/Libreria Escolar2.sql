Create database Libreria2
go
use Libreria2
go


--3ra linea de tablas


Create table Area (
id_area int identity,
descripcion nvarchar,
primary key (id_area),
)

Create table Nivel (
id_nivel int identity,
descripcion nvarchar,
primary key (id_nivel),
)

create table Usuario (
id_usuario int identity,
nombre nvarchar,
apellido nvarchar,
direccion nvarchar,
telefono int,
contraseña nvarchar,
dni int,
primary key (id_usuario)
)
go
--2da linea de tablas

Create table Pedido_encabezado (
id_pedido_encabezado int identity,
id_usuario int,
total int,
fecha datetime,
modo_entrega nvarchar,
primary key (id_pedido_encabezado),
foreign key (id_usuario) references Usuario (id_usuario),
)

Create table Libro (
id_libro int identity,
id_area int,
id_nivel int,
descripcion nvarchar,
precio int,
primary key (id_libro),
foreign key (id_area) references Area (id_area),
foreign key (id_nivel) references Nivel (id_nivel),
)
go
--primera linea de tablas

Create table Pedido_detalle (
id_pedido_detalle int identity,
id_pedido_encabezado int,
id_libro int,
subtotal nvarchar,
cantidad int,
primary key (id_pedido_detalle),
foreign key (id_libro) references Libro (id_libro),
foreign key (id_pedido_encabezado) references Pedido_encabezado (id_pedido_encabezado)
)
go




-- Procedimientos Almacenados

--AREAS

CREATE Procedure [dbo].[SP_INSERTAR_AREAS]
(
@descripcion nvarchar
)
as
begin

insert into Area (descripcion) values (@descripcion)

select @@identity
end
go

Create procedure [dbo].[SP_MODIFICAR_AREAS](
@id_area int,
@descripcion nvarchar)
as
begin

update Area set descripcion=@descripcion where id_area=@id_area

end
go

Create procedure [dbo].[SP_ELIMINAR_AREAS](
@id_area int)
as
begin

delete from Area where id_area=@id_area

end
go

Create procedure [dbo].[SP_OBTENER_AREAS] (@id_area int)
as
begin

select * from Area where id_area=@id_area

end
go

--LIBROS

CREATE Procedure [dbo].[SP_INSERTAR_LIBROS]
(@descripcion nvarchar, @precio int)
as
begin

insert into Libro (descripcion) values (@descripcion)
insert into Libro (precio) values (@precio)

select @@identity

end
go

Create procedure [dbo].[SP_MODIFICAR_LIBROS](@id_libro int , @descripcion nvarchar, @precio int)
as
begin

Update Libro set descripcion = @descripcion where id_libro=@id_libro
Update Libro set precio = @precio where id_libro=@id_libro

end
go

Create procedure [dbo].[SP_ELIMINAR_LIBROS](@id_libro int )
as
begin

delete from Libro where id_libro=@id_libro

end
go

Create procedure [dbo].[SP_OBTENER_LIBROS] (@id_area int)
as
begin

select * from Libro where id_area=@id_area

end
go

--NIVEL

CREATE Procedure [dbo].[SP_INSERTAR_NIVEL](@descripcion nvarchar)
as
begin

insert into Nivel (descripcion) values (@descripcion)

select @@identity

end
go

Create procedure [dbo].[SP_MODIFICAR_NIVEL] (@id_nivel int, @descripcion nvarchar)
as
begin

update Nivel set descripcion=@descripcion where id_nivel=@id_nivel

end
go

Create procedure [dbo].[SP_ELIMINAR_NIVEL](@id_nivel int )
as
begin

delete from Nivel where id_nivel=@id_nivel

end
go

Create procedure [dbo].[SP_OBTENER_NIVEL] (@id_nivel int)
as
begin

select * from Nivel where id_nivel=@id_nivel

end
go

--PEDIDO DETALLE

CREATE Procedure [dbo].[SP_INSERTAR_PEDIDO_DETALLE](@subtotal nvarchar, @cantidad int)
as
begin

insert into Pedido_detalle values (@subtotal,@cantidad)

select @@identity

end
go

Create procedure [dbo].[SP_MODIFICAR_PEDIDO_DETALLE] (@id_pedido_detalle int, @subtotal nvarchar, @cantidad int)
as
begin

update Pedido_detalle set subtotal=@subtotal where id_pedido_detalle=@id_pedido_detalle
update Pedido_detalle set cantidad=@cantidad where id_pedido_detalle=@id_pedido_detalle

end
go

Create procedure [dbo].[SP_ELIMINAR_PEDIDO_DETALLE](@id_pedido_detalle int )
as
begin

delete from Pedido_detalle where id_pedido_detalle=@id_pedido_detalle

end
go

Create procedure [dbo].[SP_OBTENER_PEDIDO_DETALLE] (@id_pedido_detalle int)
as
begin

select * from Pedido_detalle where id_pedido_detalle=@id_pedido_detalle

end
go

--PEDIDO ENCABEZADO

CREATE Procedure [dbo].[SP_INSERTAR_PEDIDO_ENCABEZADO](@total int, @fecha datetime, @modo_entrega nvarchar)
as
begin

insert into Pedido_encabezado values (@total,@fecha,@modo_entrega)

select @@identity

end
go

Create procedure [dbo].[SP_MODIFICAR_PEDIDO_ENCABEZADO] (@id_pedido_encabezado int, @total int, @fecha datetime, @modo_entrega nvarchar)
as
begin

update Pedido_encabezado set total=@total where id_pedido_encabezado=@id_pedido_encabezado
update Pedido_encabezado set fecha=@fecha where id_pedido_encabezado=@id_pedido_encabezado
update Pedido_encabezado set modo_entrega=@modo_entrega where id_pedido_encabezado=@id_pedido_encabezado

end
go

Create procedure [dbo].[SP_ELIMINAR_PEDIDO_ENCABEZADO](@id_pedido_encabezado int )
as
begin

delete from Pedido_encabezado where id_pedido_encabezado=@id_pedido_encabezado

end
go

Create procedure [dbo].[SP_OBTENER_PEDIDO_ENCABEZADO] (@id_pedido_encabezado int)
as
begin

select * from Pedido_encabezado where id_pedido_encabezado=@id_pedido_encabezado

end
go

--USUARIO

CREATE Procedure [dbo].[SP_INSERTAR_USUARIO](@nombre nvarchar, @apellido nvarchar, @direccion nvarchar, @telefono int, @contraseña nvarchar)
as
begin

insert into Usuario values (@nombre, @apellido, @direccion, @telefono, @contraseña)

select @@identity

end
go

Create procedure [dbo].[SP_MODIFICAR_PEDIDO_USUARIO](@id_usuario int, @nombre nvarchar, @apellido nvarchar, @direccion nvarchar, @telefono int, @contraseña nvarchar)
as
begin

update Usuario set nombre=@nombre where id_usuario=@id_usuario
update Usuario set apellido=@apellido where id_usuario=@id_usuario
update Usuario set direccion=@direccion where id_usuario=@id_usuario
update Usuario set telefono=@telefono where id_usuario=@id_usuario
update Usuario set contraseña=@contraseña where id_usuario=@id_usuario

end
go

Create procedure [dbo].[SP_ELIMINAR_USUARIO](@id_usuario int )
as
begin

delete from Usuario where id_usuario=@id_usuario

end
go

Create procedure [dbo].[SP_OBTENER_USUARIO] (@id_usuario int)
as
begin

select * from Usuario where id_usuario=@id_usuario

end
go