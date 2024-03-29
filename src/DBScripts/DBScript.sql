USE [master]
GO
/****** Object:  Database [Hackathon_CommunityForum]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE DATABASE [Hackathon_CommunityForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hackathon_CommunityForum', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hackathon_CommunityForum.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hackathon_CommunityForum_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hackathon_CommunityForum_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hackathon_CommunityForum] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hackathon_CommunityForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET  MULTI_USER 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hackathon_CommunityForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hackathon_CommunityForum] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hackathon_CommunityForum]
GO
/****** Object:  StoredProcedure [dbo].[sp_author_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.post like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_tag_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_tag_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and t.postid=p.postid and t.tagname like '%'+@text+'%' or p.post like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_tag_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_tag_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and p.postid=t.postid and t.tagname like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_tag_title_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_tag_title_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and t.postid=p.postid and t.tagname like '%'+@text+'%' or p.post like '%'+@text+'%' or p.title like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%'
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_tag_title_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_tag_title_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and t.postid=p.postid and p.title like '%'+@text+'%' or t.tagname like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_title_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_title_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.title like '%'+@text+'%' or p.post like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_author_title_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_author_title_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.title like '%'+@text+'%' or u.fname like '%'+@text+'%' or u.lname like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_authorsearch]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_authorsearch]
(@author varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and u.fname like '%'+@author+'%' or u.lname like '%'+@author+'%'
end

GO
/****** Object:  StoredProcedure [dbo].[sp_comments]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_comments]
(@postid int,
@username varchar(50),
@comment nvarchar(max),
@date datetime,
@commentid int output)
As
begin
insert into comment_box values(@postid,@username,@comment,@date)
SET @commentid=SCOPE_IDENTITY()
RETURN @commentid
End

GO
/****** Object:  StoredProcedure [dbo].[sp_getcomments]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getcomments]
(@postid int)
as
begin
select u.fname+' '+u.lname as name,comment,date from comment_box c,userdetails u where postid=@postid and u.username=c.username
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getpost]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getpost]
@postid int
as
begin
select title,post,post_date from blog_post where post_id=@postid
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getpostdetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getpostdetails]
as
begin
select p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getpostdetailsbyuser]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getpostdetailsbyuser]
(@username varchar(25)
)
as
begin
select p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.username=@username;
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getpostmessage]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getpostmessage]
(@postid varchar(100))
as
begin
select post from postdetails where postid=@postid
end


GO
/****** Object:  StoredProcedure [dbo].[sp_logindetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logindetails]
(@username varchar(50))
as
begin
select username,password from userdetails where username=@username;
end

GO
/****** Object:  StoredProcedure [dbo].[sp_postdetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_postdetails]
(@username varchar(50),
@title varchar(500),
@post nvarchar(max),
@date1 datetime,
@postid int output)
as
begin
insert into postdetails values(@username,@title,@post,@date1)
SET @postid=SCOPE_IDENTITY()
RETURN @postid
end

GO
/****** Object:  StoredProcedure [dbo].[sp_postsearch]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_postsearch]
(@post varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.post like '%'+@post+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tag]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tag]
(@tagname varchar(50),
@postid int,
@tagid int output)
as
begin
insert into tag values(@tagname,@postid)
SET @tagid=SCOPE_IDENTITY()
RETURN @tagid
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tag_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tag_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and p.postid=t.postid and p.post like '%'+@text+'%' or t.tagname like '%'+@text+'%'  
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tag_tilte_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tag_tilte_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and t.postid=p.postid and t.tagname like '%'+@text+'%' or p.post like '%'+@text+'%' or p.title like '%'+@text+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tag_title_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tag_title_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and p.postid=t.postid and p.title like '%'+@text+'%' or t.tagname like '%'+@text+'%'  
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tags]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tags]
as
begin
select t.postid,tagname from postdetails p, tag t where p.postid=t.postid
end

GO
/****** Object:  StoredProcedure [dbo].[sp_tagsearch]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_tagsearch]
(@tag varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,t.tagname,p.date1 from userdetails u,postdetails p,tag t where p.username=u.username and p.postid=t.postid and t.tagname like '%'+@tag+'%' 
end


GO
/****** Object:  StoredProcedure [dbo].[sp_title_post_search]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_title_post_search]
(@text varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.post like '%'+@text+'%' or p.title like '%'+@text+'%'  
end

GO
/****** Object:  StoredProcedure [dbo].[sp_titlesearch]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_titlesearch]
(@title varchar(500))
as
begin
select distinct p.postid,p.post,fname+' '+u.lname as name,p.title,p.date1 from userdetails u,postdetails p where p.username=u.username and p.title like '%'+@title+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_userdetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_userdetails]
(@fname varchar(50),
@lname varchar(50),
@username varchar(50),
@password varchar(20),
@emailid varchar(50),
@age int, 
@phno varchar(50))
as
begin
insert into userdetails values(@fname,@lname,@username,@password,@emailid,@age,@phno)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_userimage]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_userimage]
(@id varchar(20),
@photo image,
@date1 datetime)
as 
begin
insert into userimage values(@id,@photo,@date1)
delete userimage where id=@id and date1<@date1
end

GO
/****** Object:  StoredProcedure [dbo].[sp_username]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_username]
as
begin
select username from userdetails
end


GO
/****** Object:  Table [dbo].[comment_box]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment_box](
	[commentid] [int] IDENTITY(1,1) NOT NULL,
	[postid] [int] NULL,
	[username] [varchar](50) NULL,
	[comment] [nvarchar](max) NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[postdetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[postdetails](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[title] [varchar](500) NULL,
	[post] [nvarchar](max) NULL,
	[date1] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[postid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tag]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tag](
	[tagid] [int] IDENTITY(1,1) NOT NULL,
	[tagname] [varchar](50) NULL,
	[postid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userdetails](
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NULL,
	[emailid] [varchar](50) NULL,
	[age] [int] NULL,
	[phno] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userimage]    Script Date: 11/13/2016 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userimage](
	[id] [varchar](20) NULL,
	[img] [image] NULL,
	[date1] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_title]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE NONCLUSTERED INDEX [index_title] ON [dbo].[postdetails]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_tag]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE NONCLUSTERED INDEX [index_tag] ON [dbo].[tag]
(
	[tagname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_fname]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE NONCLUSTERED INDEX [index_fname] ON [dbo].[userdetails]
(
	[fname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_fname_lname]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE NONCLUSTERED INDEX [index_fname_lname] ON [dbo].[userdetails]
(
	[fname] ASC,
	[lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_lname]    Script Date: 11/13/2016 11:32:09 PM ******/
CREATE NONCLUSTERED INDEX [index_lname] ON [dbo].[userdetails]
(
	[lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comment_box]  WITH CHECK ADD FOREIGN KEY([postid])
REFERENCES [dbo].[postdetails] ([postid])
GO
ALTER TABLE [dbo].[comment_box]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[userdetails] ([username])
GO
ALTER TABLE [dbo].[postdetails]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[userdetails] ([username])
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD FOREIGN KEY([postid])
REFERENCES [dbo].[postdetails] ([postid])
GO
USE [master]
GO
ALTER DATABASE [Hackathon_CommunityForum] SET  READ_WRITE 
GO
