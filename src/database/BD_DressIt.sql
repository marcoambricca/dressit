USE [master]
GO
/****** Object:  Database [Dressit]    Script Date: 24/5/2024 10:44:51 ******/
CREATE DATABASE [Dressit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dressit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Dressit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dressit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Dressit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dressit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dressit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dressit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dressit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dressit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dressit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dressit] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dressit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dressit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dressit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dressit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dressit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dressit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dressit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dressit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dressit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dressit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dressit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dressit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dressit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dressit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dressit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dressit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dressit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dressit] SET RECOVERY FULL 
GO
ALTER DATABASE [Dressit] SET  MULTI_USER 
GO
ALTER DATABASE [Dressit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dressit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dressit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dressit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dressit] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dressit', N'ON'
GO
ALTER DATABASE [Dressit] SET QUERY_STORE = OFF
GO
USE [Dressit]
GO
/****** Object:  User [Dressit]    Script Date: 24/5/2024 10:44:51 ******/
CREATE USER [Dressit] FOR LOGIN [Dressit] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 24/5/2024 10:44:51 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Dressit]
GO
/****** Object:  Table [dbo].[BookmarksXUser]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookmarksXUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idPost] [int] NOT NULL,
 CONSTRAINT [PK_BookmarksXUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowXUser]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowXUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuarioSeguidor] [int] NOT NULL,
	[idUsuarioSeguido] [int] NOT NULL,
 CONSTRAINT [PK_Seguidores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idWear] [int] NOT NULL,
	[idCreator] [int] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[creationDate] [date] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsXUser]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsXUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idPost] [int] NOT NULL,
 CONSTRAINT [PK_PostsXUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagXPost]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagXPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPost] [int] NOT NULL,
	[idTag] [int] NOT NULL,
 CONSTRAINT [PK_TagXPost] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pfp] [varchar](50) NULL,
	[gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wears]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wears](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[wearType] [int] NOT NULL,
	[gender] [int] NOT NULL,
	[imgPath] [varchar](max) NULL,
 CONSTRAINT [PK_Wear] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WearTypes]    Script Date: 24/5/2024 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WearTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_WearTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FollowXUser] ON 

INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (2, 6, 7)
INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (3, 6, 8)
INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (4, 7, 6)
SET IDENTITY_INSERT [dbo].[FollowXUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([id], [name]) VALUES (1, N'masculino')
INSERT [dbo].[Genders] ([id], [name]) VALUES (2, N'femenino')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (6, N'ian', N'ian', N'ian@gmail.com', NULL, N'male')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (7, N'marco', N'marco', N'marco@gmail.com', NULL, N'male')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (8, N'pol', N'pol', N'pol@marco', NULL, N'male')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wears] ON 

INSERT [dbo].[Wears] ([id], [name], [wearType], [gender], [imgPath]) VALUES (1, N'pantalon', 2, 1, NULL)
INSERT [dbo].[Wears] ([id], [name], [wearType], [gender], [imgPath]) VALUES (2, N'remera', 1, 2, NULL)
INSERT [dbo].[Wears] ([id], [name], [wearType], [gender], [imgPath]) VALUES (3, N'pantalon', 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[Wears] OFF
GO
SET IDENTITY_INSERT [dbo].[WearTypes] ON 

INSERT [dbo].[WearTypes] ([id], [name]) VALUES (1, N'remero')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (2, N'pant')
SET IDENTITY_INSERT [dbo].[WearTypes] OFF
GO
ALTER TABLE [dbo].[BookmarksXUser]  WITH CHECK ADD  CONSTRAINT [FK_BookmarksXUser_Posts] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[BookmarksXUser] CHECK CONSTRAINT [FK_BookmarksXUser_Posts]
GO
ALTER TABLE [dbo].[BookmarksXUser]  WITH CHECK ADD  CONSTRAINT [FK_BookmarksXUser_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[BookmarksXUser] CHECK CONSTRAINT [FK_BookmarksXUser_Users]
GO
ALTER TABLE [dbo].[FollowXUser]  WITH CHECK ADD  CONSTRAINT [FK_Seguidores_Usuarios] FOREIGN KEY([idUsuarioSeguidor])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[FollowXUser] CHECK CONSTRAINT [FK_Seguidores_Usuarios]
GO
ALTER TABLE [dbo].[FollowXUser]  WITH CHECK ADD  CONSTRAINT [FK_Seguidores_Usuarios1] FOREIGN KEY([idUsuarioSeguido])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[FollowXUser] CHECK CONSTRAINT [FK_Seguidores_Usuarios1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([idCreator])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Post_Wear] FOREIGN KEY([idWear])
REFERENCES [dbo].[Wears] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Post_Wear]
GO
ALTER TABLE [dbo].[PostsXUser]  WITH CHECK ADD  CONSTRAINT [FK_PostsXUser_Posts] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[PostsXUser] CHECK CONSTRAINT [FK_PostsXUser_Posts]
GO
ALTER TABLE [dbo].[PostsXUser]  WITH CHECK ADD  CONSTRAINT [FK_PostsXUser_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[PostsXUser] CHECK CONSTRAINT [FK_PostsXUser_Users]
GO
ALTER TABLE [dbo].[TagXPost]  WITH CHECK ADD  CONSTRAINT [FK_TagXPost_Posts] FOREIGN KEY([idPost])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[TagXPost] CHECK CONSTRAINT [FK_TagXPost_Posts]
GO
ALTER TABLE [dbo].[TagXPost]  WITH CHECK ADD  CONSTRAINT [FK_TagXPost_Tags] FOREIGN KEY([idTag])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TagXPost] CHECK CONSTRAINT [FK_TagXPost_Tags]
GO
ALTER TABLE [dbo].[Wears]  WITH CHECK ADD  CONSTRAINT [FK_Wear_Genders] FOREIGN KEY([gender])
REFERENCES [dbo].[Genders] ([id])
GO
ALTER TABLE [dbo].[Wears] CHECK CONSTRAINT [FK_Wear_Genders]
GO
ALTER TABLE [dbo].[Wears]  WITH CHECK ADD  CONSTRAINT [FK_Wear_WearTypes] FOREIGN KEY([wearType])
REFERENCES [dbo].[WearTypes] ([id])
GO
ALTER TABLE [dbo].[Wears] CHECK CONSTRAINT [FK_Wear_WearTypes]
GO
USE [master]
GO
ALTER DATABASE [Dressit] SET  READ_WRITE 
GO
