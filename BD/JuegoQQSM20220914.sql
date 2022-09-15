USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 14/9/2022 22:10:32 ******/
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
/****** Object:  Table [dbo].[Jugadores]    Script Date: 14/9/2022 22:10:33 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 14/9/2022 22:10:33 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 14/9/2022 22:10:33 ******/
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

INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (1, N'¿Cada cuánto tiempo se celebran los Juegos Olímpicos?', 1, 1, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (2, N'¿Qué simbolizan los aros olímpicos?', 1, 2, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (3, N'¿Dónde se originaron los Juegos Olímpicos?', 1, 3, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (4, N'¿En qué ciudad española se han celebrado los Juegos Olímpicos?', 1, 4, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (5, N'¿En dónde se hacen los próximos Juegos Olímpicos en 2024?', 1, 5, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (6, N'¿Quién tiene más medallas olímpicas en natación?', 1, 6, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (7, N'¿Dónde se celebraron las Olimpiadas del año 1984?
', 2, 7, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (8, N'¿Qué atleta tiene actualmente el récord del mundo de 100 metros lisos?', 2, 8, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (9, N'¿A partir de qué año empezaron a participar las mujeres en los Juegos Olímpicos?', 2, 9, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (10, N'¿Qué famoso atleta olímpico es conocido como “El Hijo del Viento”?', 2, 10, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (11, N'El deportista argentino Santiago Lange es campeón de...', 2, 11, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (12, N'¿Qué le dieron como premio al primer atleta ganador de los Juegos Olímpicos?', 2, 12, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (13, N'¿Quién fue el fundador de los Juegos Olímpicos Modernos?', 3, 13, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (14, N'¿Qué atleta de color consiguió cuatro medallas de oro en los JJOO de Berlín’36?', 3, 14, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (15, N'¿Desde cuándo se realizan los Juegos Olímpicos de la Juventud?', 3, 15, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (16, N'Walter Perez, deportista argentino, fue medalla en...', 3, 16, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (17, N'¿Quién fue el primer atleta de los Juegos Olímpicos antiguos? ', 3, 17, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (18, N'¿En qué año se empezaron a realizar los Juegos Olímpicos de Invierno?', 3, 18, N'ES')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (19, N'Where did ORT come from?', 1, 1, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (20, N'What is the meaning of the acronym ORT?', 1, 2, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (21, N'What is the meaning of ORT?', 1, 3, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (22, N'In how many countries is there an ORT institute?', 1, 4, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (23, N'When was ORT founded?', 1, 5, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (24, N'Which of these isn’t a pillar of ORT?', 1, 6, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (25, N'In which of this countries doesn''t exist an ORT school?', 2, 7, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (26, N'What skill is developed in the STEM Summer School?', 2, 8, N'EN')
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad], [Orden], [Idioma]) VALUES (27, N'In February 2021, ORT delivered critical and medical supplies for Covid to …', 2, 9, N'EN')
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

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A', N'2 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B', N'4 años', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C', N'5 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 1, N'D', N'6 años', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'A', N'No simbolizan nada, es solo un dibujo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'B', N'Los 5 valores más importantes: Paz, Amor, Respeto, Amistad y Tolerancia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 2, N'C', N'Los 5 Continentes: Europa, Asia, África, América y Oceanía.', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 2, N'D', N'Dioses del olimpo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'A', N'Antigua Grecia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 3, N'B', N'Italia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 3, N'C', N'España', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 3, N'D', N'Estados Unidos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 4, N'A', N'Madrid', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 4, N'B', N'Barcelona', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 4, N'C', N'Sevilla', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 4, N'D', N'Valencia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 5, N'A', N'Paris', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 5, N'B', N'Sydney', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 5, N'C', N'Moscu', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 5, N'D', N'Shangai', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 6, N'A', N'Mark Spitz', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 6, N'B', N'Matt Biondi', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 6, N'C', N'Michael Phelps', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 6, N'D', N'Ryan Lochte', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 7, N'A', N'Pekin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 7, N'B', N'Seul', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 7, N'C', N'Montreal', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 7, N'D', N'Los Ángeles', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 8, N'A', N'Carl Lewis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 8, N'B', N'Usuain Bolt', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 8, N'C', N'Asafa Powel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 8, N'D', N'Mo Farah', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 9, N'A', N'1896', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 9, N'B', N'1900', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 9, N'C', N'1920', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 9, N'D', N'Las mujeres siempre han podido participar de los JJOO', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 10, N'A', N'Carl Lewis', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 10, N'B', N'Serguéi Bubka', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 10, N'C', N'Oscar Pistorius', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 10, N'D', N'Usain Bolt', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 11, N'A', N'Kitesorf', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 11, N'B', N'Vela', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 11, N'C', N'Remo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (52, 11, N'D', N'Windsurf', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 12, N'A', N'Medalla', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 12, N'B', N'Monedas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 12, N'C', N'Tierras', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 12, N'D', N'Corona de Olivos', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (57, 13, N'A', N'Baron Courdin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 13, N'B', N'Baron de Mounchasen', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 13, N'C', N'Baron Pierre de Coubertin', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 13, N'D', N'Baron B', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (62, 14, N'A', N'Luz Long', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (63, 14, N'B', N'Jesse Owens', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (64, 14, N'C', N'John Woodruff', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (65, 14, N'D', N'Abebe Bikila', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (66, 15, N'A', N'2007', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (67, 15, N'B', N'2010', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (68, 15, N'C', N'2014', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (69, 15, N'D', N'2018', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (70, 16, N'A', N'Judo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (71, 16, N'B', N'Tenis de mesa', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (72, 16, N'C', N'Atletismo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (73, 16, N'D', N'Ciclismo', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (74, 17, N'A', N'Lucido, Guerrero', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (75, 17, N'B', N'Pena, Carpintero', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (76, 17, N'C', N'Corebo, Panadero', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (77, 17, N'D', N'Cirilo, Artesano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (78, 18, N'A', N'1900', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (79, 18, N'B', N'1924', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (80, 18, N'C', N'1980', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (81, 18, N'D', N'1992', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (82, 19, N'A', N'Israel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (83, 19, N'B', N'Russia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (84, 19, N'C', N'Germany', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (85, 19, N'D', N'Poland', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (86, 20, N'A', N'Organization of Russians and Turks', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (87, 20, N'B', N'Organization to Rearrange Tools (for work)', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (88, 20, N'C', N'Obshchestvo Remeslennogo zemledelcheskogo Truda', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (89, 20, N'D', N'Obshchestvo Reorganizatsii Truda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (90, 21, N'A', N'Society of agricultural and craft work', 1)
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
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (114, 27, N'A', N'Brazil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (115, 27, N'B', N'Cuba', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (116, 27, N'C', N'Chile', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (117, 27, N'D', N'Venezuela', 0)
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
