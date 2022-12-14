USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 18/9/2022 12:53:11 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JuegoQQSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoQQSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoQQSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoQQSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoQQSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoQQSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoQQSM] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoQQSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoQQSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoQQSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoQQSM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 18/9/2022 12:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[PozoGanado] [int] NOT NULL,
	[ComodinDobleChance] [bit] NOT NULL,
	[Comodin50] [bit] NOT NULL,
	[ComodinSaltear] [bit] NOT NULL,
	[Idioma] [varchar](2) NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 18/9/2022 12:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](200) NOT NULL,
	[NivelDificultad] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Idioma] [varchar](2) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 18/9/2022 12:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[OpcionRespuesta] [char](1) NOT NULL,
	[TextoRespuesta] [varchar](200) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (1, N'¿Dónde se originó ORT?', 1, 1, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (2, N'¿Cuál es el significado de las siglas ORT?
', 1, 2, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (3, N'¿Cuál es el significado de ORT?', 1, 3, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (4, N'¿En cuántos países hay una escuela de ORT?', 1, 4, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (5, N'¿Cuándo se fundó ORT?', 1, 5, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (6, N'¿Cuál de estos no es un pilar de ORT?', 1, 6, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (7, N'¿En cuál de estos países no existe una escuela ORT?', 2, 7, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (8, N'¿Qué habilidad se desarrolla en la Escuela de Verano STEM?
', 2, 8, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (9, N'¿Quién es el director general y CEO de ORT mundial?', 2, 9, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (10, N'¿Cuántas sedes tiene ORT en Argentina?', 2, 10, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (11, N'¿Cuántas orientaciones hay en ORT Almagro', 2, 11, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (12, N'¿Cómo se llama el joven emprendedor egresado de ORT Argentina que recientemente saltó a la fama?
', 2, 12, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (13, N'
¿En qué año ORT se vio obligada a cerrar sus operaciones en la Unión Soviética?', 3, 13, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (14, N'¿Por qué ORT se convirtió en un “Pasaporte a la Vida”?
', 3, 14, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (15, N'En 1960 se solicitó a la ORT que emprendiera programas de formación técnica en...', 3, 15, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (16, N'¿En qué país ORT recibió permiso para operar en la provincia de Gondar en 1977?', 3, 16, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (17, N'
En 1991 ORT volvió a Rusia tras una ausencia de...', 3, 17, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (18, N'¿En qué año ORT fundó la red educativa World ORT Kadima Mada en Israel?', 3, 18, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (19, N'Where did ORT come from?', 1, 1, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (20, N'What is the meaning of the acronym ORT?', 1, 2, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (21, N'What is the meaning of ORT?', 1, 3, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (22, N'In how many countries is there an ORT institute?', 1, 4, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (23, N'When was ORT founded?', 1, 5, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (24, N'Which of these isn’t a pillar of ORT?', 1, 6, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (25, N'In which of this countries doesn''t exist an ORT school?', 2, 7, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (26, N'What skill is developed in the STEM Summer School?', 2, 8, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (27, N'Who is the General Director and CEO of World ORT?', 2, 9, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (28, N'How many institutes does ORT Argentina have?', 2, 10, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (29, N'How many orientations are there here in ORT Almagro?', 2, 11, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (30, N'What is the name of the young entrepreneur graduated from ORT Argentina who recently became famous?', 2, 12, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (31, N'In which year ORT was forced to close down its operations in the Soviet Union?', 3, 13, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (32, N'Why did ORT become a “Passport to Life”?', 3, 14, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (33, N'In 1960 ORT was asked to undertake technical training programs in …', 3, 15, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (34, N'In which country ORT received permission to operate in Gondar province in 1977?', 3, 16, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (35, N'In 1991 ORT returned to Russia after an absence of …', 3, 17, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (36, N'In which year ORT founded the World ORT Kadima Mada educational network in Israel?', 3, 18, N'EN')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A', N'Israel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B', N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C', N'Alemania', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 1, N'D', N'Polonia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'A', N'Organization of Russians and Turks', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'B', N'Organization to Rearrange Tools (for work)', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 2, N'C', N'Obshestvo Remeslennogo i zemledelcheskogo Truda', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 2, N'D', N'Obshchestvo Reorganizatsii Truda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'A', N'Sociedad de trabajo agrícola y artesanal', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 3, N'B', N'Sociedad de formación técnica', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 3, N'C', N'Sociedad del trabajo para el futuro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 3, N'D', N'Sociedad educativa para la vida laboral', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 4, N'A', N'21', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 4, N'B', N'58', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 4, N'C', N'55', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 4, N'D', N'73', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 5, N'A', N'22 de Agosto de 1880', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 5, N'B', N'25 de Agosto de 1890', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 5, N'C', N'27 de Agosto de 1880', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 5, N'D', N'19 de Agosto de 1890', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 6, N'A', N'Educación para la Vida
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 6, N'B', N'Ciudadania global
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 6, N'C', N'Tecnología e Innovación
', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 6, N'D', N'Experiencia judía
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 7, N'A', N'Brasil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 7, N'B', N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 7, N'C', N'Moldavia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 7, N'D', N'Rumania', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 8, N'A', N'Robótica', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 8, N'B', N'Ciencia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 8, N'C', N'Arte', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 8, N'D', N'Agricultura', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 9, N'A', N'Daniel Tysman
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 9, N'B', N'Dan Green
', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 9, N'C', N'Alexei Semenov', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 9, N'D', N'Vladimir Dribinskiy
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 10, N'A', N'4', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 10, N'B', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 10, N'C', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 10, N'D', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 11, N'A', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 11, N'B', N'6', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 11, N'C', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (52, 11, N'D', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 12, N'A', N'Ben Zimbron Perez', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 12, N'B', N'Avigal Zyman', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 12, N'C', N'Nicole Nissan', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 12, N'D', N'Mateo Salvatto', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (57, 13, N'A', N'1928', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 13, N'B', N'1937', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 13, N'C', N'1938', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 13, N'D', N'1989', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (62, 14, N'A', N'Durante los pogroms rusos, brindó una gran ayuda
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (63, 14, N'B', N'Durante el holocausto, brindó una gran ayuda', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (64, 14, N'C', N'Después de los pogroms rusos, ayudó a la gente a escapar de allí', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (65, 14, N'D', N'Antes del holocausto, ayudó a la gente a escapar de Europa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (66, 15, N'A', N'Medio Oriente', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (67, 15, N'B', N'África', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (68, 15, N'C', N'Argentina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (69, 15, N'D', N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (70, 16, N'A', N'Somalia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (71, 16, N'B', N'Kenya', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (72, 16, N'C', N'Nigeria', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (73, 16, N'D', N'Etiopia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (74, 17, N'A', N'93 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (75, 17, N'B', N'43 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (76, 17, N'C', N'53 años', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (77, 17, N'D', N'63 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (78, 18, N'A', N'2010', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (79, 18, N'B', N'2007', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (80, 18, N'C', N'2005', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (81, 18, N'D', N'2003', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (82, 19, N'A', N'Israel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (83, 19, N'B', N'Russia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (84, 19, N'C', N'Germany', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (85, 19, N'D', N'Poland', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (86, 20, N'A', N'Organization of Russians and Turks', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (87, 20, N'B', N'Organization to Rearrange Tools (for work)', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (88, 20, N'C', N'Obshestvo Remeslennogo i zemledelcheskogo Truda', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (89, 20, N'D', N'Obshchestvo Reorganizatsii Truda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (90, 21, N'A', N'Society for trades and agricultural labour', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (91, 21, N'B', N'Technical Training Society', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (92, 21, N'C', N'Work society for the future', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (93, 21, N'D', N'Educational society for working life', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (94, 22, N'A', N'21', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (95, 22, N'B', N'58', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (96, 22, N'C', N'55', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (97, 22, N'D', N'73', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (98, 23, N'A', N'August 22, 1880', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (99, 23, N'B', N'August 25, 1890', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (100, 23, N'C', N'August 27, 1880', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (101, 23, N'D', N'August 19, 1890', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (102, 24, N'A', N'Education for Life', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (103, 24, N'B', N'Global Citizenship', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (104, 24, N'C', N'Technology and Innovation', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (105, 24, N'D', N'Jewish Experience', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (106, 25, N'A', N'Brazil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (107, 25, N'B', N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (108, 25, N'C', N'Moldova', 0)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (109, 25, N'D', N'Romania', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (110, 26, N'A', N'Robotics', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (111, 26, N'B', N'Science', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (112, 26, N'C', N'Art', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (113, 26, N'D', N'Agriculture', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (114, 27, N'A', N'Daniel Tysman
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (115, 27, N'B', N'Dan Green', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (116, 27, N'C', N'Alexei Semenov', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (117, 27, N'D', N'Vladimir Dribinskiy
', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (118, 28, N'A', N'4', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (119, 28, N'B', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (120, 28, N'C', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (121, 28, N'D', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (122, 29, N'A', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (123, 29, N'B', N'6', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (124, 29, N'C', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (125, 29, N'D', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (126, 30, N'A', N'Ben Zimbron Perez', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (127, 30, N'B', N'Avigal Zyman', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (128, 30, N'C', N'Nicole Nissan', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (129, 30, N'D', N'Mateo Salvatto', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (130, 31, N'A', N'1928', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (131, 31, N'B', N'1937', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (132, 31, N'C', N'1938', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (133, 31, N'D', N'1989', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (134, 32, N'A', N'During the russian pogroms, it gave a great help', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (135, 32, N'B', N'During the holocaust, it gave a great help', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (136, 32, N'C', N'After the russian pogroms, it helped people escape from there', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (137, 32, N'D', N'Before the holocaust, it helped people escape from Europe', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (138, 33, N'A', N'Middle East', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (139, 33, N'B', N'Africa', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (140, 33, N'C', N'Argentina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (141, 33, N'D', N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (142, 34, N'A', N'Somalia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (143, 34, N'B', N'Kenya', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (144, 34, N'C', N'Nigeria', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (145, 34, N'D', N'Ethiopia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (146, 35, N'A', N'93 years', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (147, 35, N'B', N'43 years', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (148, 35, N'C', N'53 years', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (149, 35, N'D', N'63 years', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (150, 36, N'A', N'2010', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (151, 36, N'B', N'2007', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (152, 36, N'C', N'2005', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (153, 36, N'D', N'2003', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
