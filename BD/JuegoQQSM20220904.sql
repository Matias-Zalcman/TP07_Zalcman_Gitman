USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 4/9/2022 20:19:32 ******/
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
/****** Object:  Table [dbo].[Jugadores]    Script Date: 4/9/2022 20:19:32 ******/
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
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 4/9/2022 20:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](200) NOT NULL,
	[NivelDificultad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 4/9/2022 20:19:32 ******/
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

INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (1, N'¿Cada cuánto tiempo se celebran los Juegos Olímpicos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (2, N'¿Qué simbolizan los aros olímpicos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (3, N'¿Dónde se originaron los Juegos Olímpicos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (4, N'¿En qué ciudad española se han celebrado los Juegos Olímpicos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (5, N'¿En dónde se hacen los próximos Juegos Olímpicos en 2024?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (6, N'¿Quién tiene más medallas olímpicas en natación?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (7, N'¿Dónde se celebraron las Olimpiadas del año 1984?
', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (8, N'¿Qué atleta tiene actualmente el récord del mundo de 100 metros lisos?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (9, N'¿A partir de qué año empezaron a participar las mujeres en los Juegos Olímpicos?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (10, N'¿Qué famoso atleta olímpico es conocido como “El Hijo del Viento”?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (11, N'El deportista argentino Santiago Lange es campeón de...', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿Qué le dieron como premio al primer atleta ganador de los Juegos Olímpicos?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (13, N'¿Quién fue el fundador de los Juegos Olímpicos Modernos?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (14, N'¿Qué atleta de color consiguió cuatro medallas de oro en los JJOO de Berlín’36?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (15, N'¿Desde cuándo se realizan los Juegos Olímpicos de la Juventud?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (16, N'Walter Perez, deportista argentino, fue medalla en...', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (17, N'¿Quién fue el primer atleta de los Juegos Olímpicos antiguos? ', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (18, N'¿En qué año se empezaron a realizar los Juegos Olímpicos de Invierno?', 3)
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
