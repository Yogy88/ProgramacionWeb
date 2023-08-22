Create database Libreria

use Libreria

-- 4ta linea de tablas

Create table ArtesPlasticas (
id_arte int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_arte),
)

Create table CienciasNaturales (
id_naturales int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_naturales),
)

Create table CienciasSociales (
id_sociales int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_sociales),
)

Create table Diccionarios (
id_diccionarios int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_diccionarios),
)

Create table Informatica (
id_informatica int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_informatica),
)

Create table Lengua (
id_lengua int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_lengua),
)

Create table Manuales (
id_manuales int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_manuales),
)

Create table Matematica (
id_matematica int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_matematica),
)

Create table NivelInicial (
id_inicial int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_inicial),
)

Create table Religion (
id_religion int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_religion),
)

Create table EducacionFisica (
id_EF int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_EF),
)

Create table Historia (
id_historia int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_historia),
)

Create table Matematica_secu (
id_matematica_secu int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_matematica_secu),
)

Create table Ingles (
id_ingles int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_ingles),
)

Create table Otro (
id_otro int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_otro),
)

--3ra linea de tablas


Create table Primaria_EGB (
id_primaria int identity,
id_arte int,
id_naturales int,
id_sociales int,
id_diccionarios int,
id_informatica int,
id_lengua int,
id_manuales int,
id_matematica int,
id_inicial int,
id_religion int,
primary key (id_primaria),
foreign key (id_arte) references ArtesPlasticas (id_arte),
foreign key (id_naturales) references CienciasNaturales (id_naturales),
foreign key (id_sociales) references CienciasSociales (id_sociales),
foreign key (id_diccionarios) references Diccionarios (id_diccionarios),
foreign key (id_informatica) references Informatica (id_informatica),
foreign key (id_lengua) references Lengua (id_lengua),
foreign key (id_manuales) references Manuales (id_manuales),
foreign key (id_matematica) references Matematica (id_matematica),
foreign key (id_inicial) references NivelInicial (id_inicial),
foreign key (id_religion) references Religion (id_religion),
)

Create table Secundaria (
id_secundaria int identity,
id_EF int,
id_historia int,
id_matematica_secu int,
primary key (id_secundaria),
foreign key (id_EF) references EducacionFisica (id_EF),
foreign key (id_historia) references Historia (id_historia),
foreign key (id_matematica_secu) references Matematica_secu (id_matematica_secu),
)

Create table Idiomas (
id_idiomas int identity,
id_ingles int,
id_otro int,
primary key (id_idiomas),
foreign key (id_ingles) references Ingles (id_ingles),
foreign key (id_otro) references Otro (id_otro),
)

Create table Editorial (
id_editorial int identity,
nombre nvarchar,
cantidad int,
precio int,
primary key (id_editorial)
)

--2da linea de tablas



Create table Pedido (
id_pedido int identity,
precio_total int,
modo_entrega nvarchar,
id_primaria int,
id_secundaria int,
id_idiomas int,
id_editorial int,
primary key (id_pedido),
foreign key (id_primaria) references Primaria_EGB (id_primaria),
foreign key (id_secundaria) references Secundaria (id_secundaria),
foreign key (id_idiomas) references Idiomas (id_idiomas),
foreign key (id_editorial) references Editorial (id_editorial)
)


--primera linea de tablas
Create table Usuario(
id_usuario int identity,
Nombre nvarchar,
Apellido nvarchar,
Direccion nvarchar,
Telefono int,
id_pedido int,
Contraseña nvarchar,
primary key (id_usuario),
foreign key (id_pedido)references Pedido (id_pedido)
)



