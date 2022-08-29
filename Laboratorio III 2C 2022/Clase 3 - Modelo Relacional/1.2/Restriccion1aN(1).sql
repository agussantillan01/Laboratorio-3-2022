CREATE DATABASE Restriccion1aN
GO 
USE Restriccion1aN
CREATE TABLE Galaxias (
	ID smallint not null primary key, 
	Nombre varchar (50) not null, 
	Masa bigint null, 
	Diametro bigint null
)


CREATE TABLE Planetas (
	IDPlaneta smallint not null primary key, 
	Nombre varchar (50) not null,
	IDGalaxia smallint not null foreign key references Galaxias (ID),
	Masa bigint null, 
	Volumen bigint null,
	Densidad bigint null,
	TempMedia bigint null,
)