CREATE DATABASE ClaseUno 
GO 
USE ClaseUno
CREATE TABLE Areas(
ID smallint primary key identity (1,1),
Nombre varchar (50) not null, 
Presupuesto money not null check (presupuesto > 0),
Mail varchar (120) not null unique,
)

CREATE  TABLE Empleados (
ID bigint primary key not null,
IDArea smallint null foreign key references Areas(ID), 
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Nacimeinto date not null
)