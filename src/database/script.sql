USE [master]
GO
/****** Object:  Database [Dressit]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  User [Dressit]    Script Date: 7/6/2024 12:03:54 ******/
CREATE USER [Dressit] FOR LOGIN [Dressit] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 7/6/2024 12:03:54 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Dressit]
GO
/****** Object:  Table [dbo].[BookmarksXUser]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 7/6/2024 12:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 7/6/2024 12:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowXUser]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[PostsXUser]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[TagXPost]    Script Date: 7/6/2024 12:03:54 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/6/2024 12:03:54 ******/
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
	[gender] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wears]    Script Date: 7/6/2024 12:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wears](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[wearType] [int] NOT NULL,
	[idGender] [int] NOT NULL,
	[imgPath] [varchar](max) NULL,
	[idColor] [int] NULL,
 CONSTRAINT [PK_Wear] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WearTypes]    Script Date: 7/6/2024 12:03:54 ******/
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
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([id], [name]) VALUES (1, N'red')
INSERT [dbo].[Colors] ([id], [name]) VALUES (2, N'blue')
INSERT [dbo].[Colors] ([id], [name]) VALUES (3, N'grenn')
INSERT [dbo].[Colors] ([id], [name]) VALUES (4, N'yellow')
INSERT [dbo].[Colors] ([id], [name]) VALUES (5, N'black')
INSERT [dbo].[Colors] ([id], [name]) VALUES (6, N'white')
INSERT [dbo].[Colors] ([id], [name]) VALUES (7, N'pink')
INSERT [dbo].[Colors] ([id], [name]) VALUES (8, N'purple')
INSERT [dbo].[Colors] ([id], [name]) VALUES (9, N'orange')
INSERT [dbo].[Colors] ([id], [name]) VALUES (10, N'brown')
INSERT [dbo].[Colors] ([id], [name]) VALUES (11, N'grey')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[FollowXUser] ON 

INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (2, 6, 7)
INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (3, 6, 8)
INSERT [dbo].[FollowXUser] ([id], [idUsuarioSeguidor], [idUsuarioSeguido]) VALUES (4, 7, 6)
SET IDENTITY_INSERT [dbo].[FollowXUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([id], [name]) VALUES (1, N'male')
INSERT [dbo].[Genders] ([id], [name]) VALUES (2, N'female')
INSERT [dbo].[Genders] ([id], [name]) VALUES (3, N'boy')
INSERT [dbo].[Genders] ([id], [name]) VALUES (4, N'girl')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (1, 1, 6, N'pantalon nike men', 15000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (3, 2, 6, N'remera nike men', 10000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (4, 3, 6, N'pantalon nike women', 13000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (14, 6, 6, N'remera nike women', 15000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (15, 7, 6, N'remera adidas men', 15000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (17, 10, 6, N'remera adidas women', 15000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (19, 13, 6, N'pantalon adidas women', 15000, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Posts] ([id], [idWear], [idCreator], [description], [price], [creationDate]) VALUES (21, 4, 6, N'pantalon adidas men', 15000, CAST(N'2024-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (6, N'ian', N'ian', N'ian@gmail.com', NULL, N'male')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (7, N'marco', N'marco', N'marco@gmail.com', NULL, N'male')
INSERT [dbo].[Users] ([id], [username], [password], [email], [pfp], [gender]) VALUES (8, N'pol', N'pol', N'pol@marco', NULL, N'male')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wears] ON 

INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (1, N'pantalon nike men', 4, 1, NULL, 5)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (2, N'remera nike men', 1, 1, NULL, 4)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (3, N'pantalon nike women', 4, 2, NULL, 2)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (4, N'remera nike women', 1, 2, NULL, 3)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (6, N'remera adidas men', 1, 1, NULL, 4)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (7, N'remera adidas women', 1, 2, NULL, 3)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (10, N'pantalon adidas men', 4, 1, NULL, 5)
INSERT [dbo].[Wears] ([id], [name], [wearType], [idGender], [imgPath], [idColor]) VALUES (13, N'pantalon adidas women', 4, 2, NULL, 2)
SET IDENTITY_INSERT [dbo].[Wears] OFF
GO
SET IDENTITY_INSERT [dbo].[WearTypes] ON 

INSERT [dbo].[WearTypes] ([id], [name]) VALUES (1, N'shirt')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (2, N'hoodie')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (3, N'jacket')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (4, N'pant')
INSERT [dbo].[WearTypes] ([id], [name]) VALUES (5, N'short')
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
ALTER TABLE [dbo].[Wears]  WITH CHECK ADD  CONSTRAINT [FK_Wear_Genders] FOREIGN KEY([idGender])
REFERENCES [dbo].[Genders] ([id])
GO
ALTER TABLE [dbo].[Wears] CHECK CONSTRAINT [FK_Wear_Genders]
GO
ALTER TABLE [dbo].[Wears]  WITH CHECK ADD  CONSTRAINT [FK_Wear_WearTypes] FOREIGN KEY([wearType])
REFERENCES [dbo].[WearTypes] ([id])
GO
ALTER TABLE [dbo].[Wears] CHECK CONSTRAINT [FK_Wear_WearTypes]
GO
ALTER TABLE [dbo].[Wears]  WITH CHECK ADD  CONSTRAINT [FK_Wears_Colors] FOREIGN KEY([idColor])
REFERENCES [dbo].[Colors] ([id])
GO
ALTER TABLE [dbo].[Wears] CHECK CONSTRAINT [FK_Wears_Colors]
GO
USE [master]
GO
ALTER DATABASE [Dressit] SET  READ_WRITE 
GO
