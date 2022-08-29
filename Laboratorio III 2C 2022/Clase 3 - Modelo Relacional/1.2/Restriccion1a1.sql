CREATE DATABASE Restriccion1a1 
GO 
USE Restriccion1a1
CREATE TABLE Coche_empleados(
IDCoche bigint not null primary key,
Patente varchar (20) not null unique, 
Color varchar (50) null
)

CREATE  TABLE Empleados (
IDCoche bigint primary key not null foreign key references Coche_empleados(IDCoche), 
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Nacimeinto date not null
)