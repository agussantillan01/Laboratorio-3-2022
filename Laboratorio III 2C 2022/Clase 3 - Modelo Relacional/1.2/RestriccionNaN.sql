CREATE DATABASE RestriccionNaN
GO
USE RestriccionNaN
GO
CREATE TABLE CLASES (
IDCLASE INT NOT NULL PRIMARY KEY, 
TITULO VARCHAR (20) NOT NULL, 
DESCRIPCION VARCHAR (50) NULL
)
GO 
CREATE TABLE ESTUDIANTES (
IDESTUDIANTE INT NOT NULL PRIMARY KEY, 
APELLIDO VARCHAR (50) NOT NULL,
NOMBRE VARCHAR (50) NOT NULL, 
DNI VARCHAR (50) NOT NULL UNIQUE
)
GO
CREATE TABLE MATRICULA (
IDMATRICULA INT NOT NULL PRIMARY KEY,
IDESTUDIANTE INT NOT NULL FOREIGN KEY REFERENCES ESTUDIANTES(IDESTUDIANTE), 
IDCLASE INT NOT NULL FOREIGN KEY REFERENCES CLASES (IDCLASE)
)