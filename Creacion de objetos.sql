-- =============================================
-- Author:		Carlos Alberto Roa Vique 
-- Create date: 2020-05-31
-- Description:	Creacion de la base de datos y sus objetos
-- =============================================

/*CREACION DE LA BASE DE DATOS*/
USE [master]
GO
CREATE DATABASE [Instituto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Instituto', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Instituto.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Instituto_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Instituto_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Instituto] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Instituto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

USE [Instituto]
GO

/* CREACION DE LA TABLA CURSO*/
CREATE TABLE [dbo].[curso](
	[cur_id] [int] IDENTITY(1,1) NOT NULL,
	[cur_nombre] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_curso] PRIMARY KEY CLUSTERED 
(
	[cur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/* CREACION DE LA TABLA PROGRAMA*/
CREATE TABLE [dbo].[programa](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_programa] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/* CREACION DE LA TABLA PROGRAMA_CURSO*/
CREATE TABLE [dbo].[programa_curso](
	[pro_id] [int] NOT NULL,
	[cur_id] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[programa_curso]  WITH NOCHECK ADD  CONSTRAINT [FK_programa_cuarso_curso] FOREIGN KEY([cur_id])
REFERENCES [dbo].[curso] ([cur_id])
GO

ALTER TABLE [dbo].[programa_curso] CHECK CONSTRAINT [FK_programa_cuarso_curso]
GO

ALTER TABLE [dbo].[programa_curso]  WITH CHECK ADD  CONSTRAINT [FK_programa_curso_programa] FOREIGN KEY([pro_id])
REFERENCES [dbo].[programa] ([pro_id])
GO

ALTER TABLE [dbo].[programa_curso] CHECK CONSTRAINT [FK_programa_curso_programa]
GO

/* CREACION DE LA TABLA ALUMNO*/
CREATE TABLE [dbo].[alumno](
	[alum_id] [int] IDENTITY(1,1) NOT NULL,
	[alum_nombre] [varchar](50) NOT NULL,
	[alum_apellido] [varchar](50) NOT NULL,
	[alum_cedula] [int] NOT NULL,
	[alum_fecha_nacimiento] [datetime] NOT NULL,
	[alum_correo] [varchar](100)  NOT NULL,
 CONSTRAINT [PK_alumno] PRIMARY KEY CLUSTERED 
(
	[alum_id] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1) ON [PRIMARY]
) ON [PRIMARY]

GO
/* CREACION DE LA TABLA ALUMNO_CURSO*/
CREATE TABLE [dbo].[alumno_curso](
	[ac_id] [int] IDENTITY(1,1) NOT NULL,
	[alum_id] [int] NOT NULL,
	[cur_id] [int] NOT NULL,
	[per_id] [int] NOT NULL,
	[ac_nota] [float]  NULL,
 CONSTRAINT [PK_alumno_curso] PRIMARY KEY CLUSTERED 
(
	[ac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[alumno_curso]  WITH CHECK ADD  CONSTRAINT [FK_alumno_curso_alumno] FOREIGN KEY([alum_id])
REFERENCES [dbo].[alumno] ([alum_id])
GO

ALTER TABLE [dbo].[alumno_curso] CHECK CONSTRAINT [FK_alumno_curso_alumno]
GO

ALTER TABLE [dbo].[alumno_curso]  WITH NOCHECK ADD  CONSTRAINT [FK_alumno_curso_curso] FOREIGN KEY([cur_id])
REFERENCES [dbo].[curso] ([cur_id])
GO

ALTER TABLE [dbo].[alumno_curso] CHECK CONSTRAINT [FK_alumno_curso_curso]
GO


/*SE CARGAN LOS VALORES DE LAS TABLAS REFERENCIA*/
INSERT INTO curso (cur_nombre) values ('MATEMÁTICAS BÁSICAS')
INSERT INTO curso (cur_nombre) values ('LÓGICA MATEMÁTICA') 
INSERT INTO curso (cur_nombre) values ('MATEMÁTICAS DISCRETAS') 
INSERT INTO curso (cur_nombre) values ('FUNDAMENTOS DE PROGRAMACIÓN') 
INSERT INTO curso (cur_nombre) values ('INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS') 
INSERT INTO curso (cur_nombre) values ('EST. DEL PENSAMIENTO 1 (PROCESOS LÓGICOS DE EXPRESIÓN)') 
INSERT INTO curso (cur_nombre) values ('ELECTIVA 1') 
INSERT INTO curso (cur_nombre) values ('INTRODUCCIÓN AL DERECHO') 
INSERT INTO curso (cur_nombre) values ('DERECHO ROMANO I') 
INSERT INTO curso (cur_nombre) values ('DERECHO CONSTITUCIONAL I') 
INSERT INTO curso (cur_nombre) values ('DERECHO CIVIL') 
INSERT INTO curso (cur_nombre) values ('MATEMÁTICA APLICADA AL DERECHO') 
INSERT INTO curso (cur_nombre) values ('LEA I') 
INSERT INTO curso (cur_nombre) values ('INGLÉS I') 
INSERT INTO curso (cur_nombre) values ('ELECTIVA LIBRE I') 
INSERT INTO curso (cur_nombre) values ('BIOLOGÍA MOLECULAR Y CELULAR') 
INSERT INTO curso (cur_nombre) values ('FUNDAMENTOS DE BIOCIENCIAS') 
INSERT INTO curso (cur_nombre) values ('LECTURA, ESCRITURA Y ARGUMENTACIÓN') 
INSERT INTO curso (cur_nombre) values ('INDIVIDUO Y COMUNIDAD') 
INSERT INTO curso (cur_nombre) values ('SEMINARIO DE FILOSOFÍA E HISTORIA DE LAS CIENCIAS I') 
INSERT INTO curso (cur_nombre) values ('INTRODUCCIÓN AL ENFOQUE BIOPSICOSOCIAL Y CULTURAL') 
INSERT INTO curso (cur_nombre) values ('ELECTIVA LIBRE I') 

INSERT INTO programa (pro_nombre) values ('Ingeniería de Sistemas') 
INSERT INTO programa (pro_nombre) values ('Derecho') 
INSERT INTO programa (pro_nombre) values ('Medicina') 

INSERT INTO programa_curso (pro_id,cur_id) values (1,1) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,2) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,3) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,4) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,5) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,6) 
INSERT INTO programa_curso (pro_id,cur_id) values (1,7) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,8) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,9) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,10) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,11) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,12) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,13) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,14) 
INSERT INTO programa_curso (pro_id,cur_id) values (2,15) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,16) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,17) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,18) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,19) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,20) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,21) 
INSERT INTO programa_curso (pro_id,cur_id) values (3,22) 

/*CREACION DE PROCEDIMIENTOS ALMACENADOS*/
GO
/********************************************************************************************
* PROCEDURE:    SP_RELACION_ALUMNO_CURSOS
* Descripción:  Realiza la relacion de los cursos del programa con el alumno
* Parámetros:   PAR_alum_id = identificados del alumno, PAR_pro_id = identificador del programa 
* Retorna:        
*******************************************************************************************
SP_RELACION_ALUMNO_CURSOS 1,2
*/ 
CREATE PROCEDURE SP_RELACION_ALUMNO_CURSOS 
@par_alum_id INT,
@par_pro_id INT
AS
BEGIN  
	INSERT INTO alumno_curso (alum_id,cur_id,per_id)
	 SELECT @par_alum_id, cur_id, 1 FROM programa_curso WHERE pro_id = @par_pro_id 
END

GO

/********************************************************************************************
* PROCEDURE:    SP_EDITAR_PROGRAMA_ALUMNO
* Descripción:  Desactiva los cursos actuales y   relacion de los cursos del nuevo programa con el alumno
* Parámetros:   PAR_alum_id = identificados del alumno, PAR_pro_id = identificador del programa 
* Retorna:        
*******************************************************************************************
SP_RELACION_ALUMNO_CURSOS 1,2
*/ 
CREATE PROCEDURE SP_EDITAR_PROGRAMA_ALUMNO 
@par_alum_id INT,
@par_pro_id INT
AS
BEGIN  
	UPDATE alumno_curso SET per_id = 0 WHERE alum_id = @par_alum_id

	INSERT INTO alumno_curso (alum_id,cur_id,per_id)
	 SELECT @par_alum_id, cur_id, 1 FROM programa_curso WHERE pro_id = @par_pro_id 
END

GO

/********************************************************************************************
* PROCEDURE:    SP_CONSULTAR_ALUMNO_CURSOS
* Descripción:  Consultar la relacion de los cursos del programa con el alumno
* Parámetros:   PAR_alum_id = identificados del alumno
* Retorna:        
*******************************************************************************************
SP_CONSULTAR_ALUMNO_CURSOS 1
*/ 
CREATE PROCEDURE SP_CONSULTAR_ALUMNO_CURSOS 
@par_alum_id INT
AS
BEGIN  
	 SELECT al.alum_nombre,al.alum_apellido,pr.pro_nombre,cu.cur_nombre
	 FROM alumno_curso ac
	 INNER JOIN alumno al
	 ON ac.alum_id = al.alum_id
	 INNER JOIN curso cu
		 INNER JOIN programa_curso pc
			INNER JOIN programa pr
			ON pc.pro_id = pr.pro_id
		 ON cu.cur_id = pc.cur_id
	 ON ac.cur_id = cu.cur_id
	 WHERE al.alum_id = @par_alum_id and ac.per_id > 0
END

GO
/*CREACION DE PROCEDIMIENTOS ALMACENADOS*/
GO
/********************************************************************************************
* PROCEDURE:    FUN_CalcEdad
* Descripción:  Calcula la edad exacta
* Parámetros:   @dt1 = Fecha inicia, @dt2 = fecha Final  
* Retorna:        
*******************************************************************************************
DECLARE
	@dt1 date = '19890428', 
	@dt2 date = getdate();
SELECT dbo.FUN_CalcEdad(@dt1, @dt2) AS Edad;
*/ 
CREATE FUNCTION FUN_CalcEdad(
@dt1 date,
@dt2 date
)
RETURNS INT
AS
BEGIN
	declare @edad int;
	set @edad = 
	(select DATEDIFF([year], @dt1, @dt2) - 
	CASE 
	WHEN (MONTH(@dt2) * 100) + DAY(@dt2) < (MONTH(@dt1) * 100) + DAY(@dt1) THEN 1
	ELSE 0
	END);
	
	RETURN @edad;

END;
GO
