
USE [kbvault]
GO


/****** Object:  Table [dbo].[Article]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Views] [int] NOT NULL CONSTRAINT [DF_Article_Views]  DEFAULT ((0)),
	[Likes] [int] NOT NULL CONSTRAINT [DF_Article_Likes]  DEFAULT ((0)),
	[Created] [datetime] NULL,
	[Edited] [datetime] NULL,
	[IsDraft] [int] NOT NULL CONSTRAINT [DF_Article_IsDraft]  DEFAULT ((1)),
	[PublishStartDate] [datetime] NULL,
	[PublishEndDate] [datetime] NULL,
	[Author] [bigint] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SefName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArticleTag]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTag](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TagId] [bigint] NOT NULL,
	[ArticleId] [bigint] NOT NULL,
 CONSTRAINT [PK_ArticleTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ArticleId] [bigint] NOT NULL,
	[Path] [nvarchar](2048) NOT NULL,
	[FileName] [nvarchar](2048) NOT NULL,
	[Extension] [nvarchar](5) NOT NULL,
	[Downloads] [int] NOT NULL CONSTRAINT [DF_Attachment_Downloads]  DEFAULT ((0)),
	[Hash] [nvarchar](256) NULL,
	[HashTime] [datetime] NULL,
	[MimeType] [varchar](50) NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsHot] [bit] NOT NULL CONSTRAINT [DF_Category_IsHot]  DEFAULT ((0)),
	[Parent] [int] NULL,
	[SefName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KbUser]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KbUser](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[CompanyName] [nvarchar](100) NOT NULL CONSTRAINT [DF_Table_1_ArticleCountPerCategoryOnHomePage]  DEFAULT ((5)),
	[TagLine] [nvarchar](500) NULL,
	[JumbotronText] [nvarchar](100) NULL,
	[ArticleCountPerCategoryOnHomePage] [smallint] NOT NULL CONSTRAINT [DF_Settings_ArticleCountPerCategoryOnHomePage]  DEFAULT ((5)),
	[IndexFileExtensions] [varchar](2000) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[SplitStrings_Moden]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitStrings_Moden]
(
   @List NVARCHAR(MAX),
   @Delimiter NVARCHAR(255)
)
RETURNS TABLE
WITH SCHEMABINDING AS
RETURN
  WITH E1(N)        AS ( SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
       E2(N)        AS (SELECT 1 FROM E1 a, E1 b),
       E4(N)        AS (SELECT 1 FROM E2 a, E2 b),
       E42(N)       AS (SELECT 1 FROM E4 a, E2 b),
       cteTally(N)  AS (SELECT 0 UNION ALL SELECT TOP (DATALENGTH(ISNULL(@List,1))) 
                         ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E42),
       cteStart(N1) AS (SELECT t.N+1 FROM cteTally t
                         WHERE (SUBSTRING(@List,t.N,1) = @Delimiter OR t.N = 0))
  SELECT Item = SUBSTRING(@List, s.N1, ISNULL(NULLIF(CHARINDEX(@Delimiter,@List,s.N1),0)-s.N1,8000))
    FROM cteStart s;


GO
/****** Object:  View [dbo].[VwArticleTagCount]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VwArticleTagCount] as 
select top 20 count(*) as Amount,Name , t.Id from ArticleTag at left join tag t on at.TagId = t.Id 
	group  by t.name , t.Id	

GO

GO
SET IDENTITY_INSERT [dbo].[KbUser] ON 

GO
INSERT [dbo].[KbUser] ([Id], [UserName], [Password], [Name], [LastName], [Email], [Role]) VALUES (1, N'admin', N'euCzby8AnoczvmGxSOu7vhQw35kwMmY0NmIwZTYwM2I0ZWU2YTk0ZTZlMzRlZGJmY2Q2ZQ==', N'Admin', N'User', N'admin@kbvault.comx', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[KbUser] OFF
GO
INSERT [dbo].[Settings] ([CompanyName], [TagLine], [JumbotronText], [ArticleCountPerCategoryOnHomePage], [IndexFileExtensions]) VALUES (N'Default Company', N'Default company tag line', N'Default jumbatron', 10, N'pdf,docx,doc')
GO

SET ANSI_PADDING ON

GO
/****** Object:  Index [UNQ_ARTICLE_SEFNAME]    Script Date: 01.09.2014 16:52:37 ******/
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [UNQ_ARTICLE_SEFNAME] UNIQUE NONCLUSTERED 
(
	[SefName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UNQ_CATEGORY_SEFNAME]    Script Date: 01.09.2014 16:52:37 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UNQ_CATEGORY_SEFNAME] UNIQUE NONCLUSTERED 
(
	[SefName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Author_User] FOREIGN KEY([Author])
REFERENCES [dbo].[KbUser] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Author_User]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[ArticleTag]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTag_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleTag] CHECK CONSTRAINT [FK_ArticleTag_Article]
GO
ALTER TABLE [dbo].[ArticleTag]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[ArticleTag] CHECK CONSTRAINT [FK_ArticleTag_Tag]
GO
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_Attachment_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_Attachment_Article]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Parent] FOREIGN KEY([Parent])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Parent]
GO


CREATE PROCEDURE [dbo].[AssignTagsToArticle]
	@ArticleId BIGINT,
	@Tags NVARCHAR(4000)
AS
BEGIN
	SET NOCOUNT ON
		
	declare TagList cursor for 
		Select Item From SplitStrings_Moden(@Tags,',')
	declare @NewTagId bigint
	declare @TagName  nvarchar(256)
	
	delete from ArticleTag where ArticleId = @ArticleId
	Open TagList
	Fetch Next From TagList Into @TagName
	While @@FETCH_STATUS = 0 
	BEGIN
		Select @NewTagId = Id From dbo.Tag Where Name = @TagName

		If @NewTagId Is Null 
		Begin
			Insert Into Tag(Name) Values(@TagName)
			Set @NewTagId = SCOPE_IDENTITY()
		End
		Insert Into ArticleTag(ArticleId,TagId) values(@ArticleId,@NewTagId)
		Fetch Next From TagList Into @TagName
		Set @NewTagId = Null
	END
	Close TagList
	Deallocate TagList
END



GO
/****** Object:  StoredProcedure [dbo].[DoSearch]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DoSearch]( @term as nvarchar ) as
begin
select ArticleId,ArticleTitle from vw_SearchData 
where  ArticleContent like '%'+@term+'%' 
	Or ArticleTitle like '%'+@term+'%'
	Or TagName like '%'+@term+'%'
	Or CategoryName like '%'+@term+'%'
group by ArticleId,ArticleTitle,TagName+CategoryName+CAST(ArticleId as NVARCHAR) 

end

GO
/****** Object:  StoredProcedure [dbo].[GetTopTags]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTopTags] As 
begin
	select top 20 amount*100/(Select sum(amount) from VwArticleTagCount) Ratio,Name,Id, 0 as FontSize from VwArticleTagCount
	order by amount*100/(Select sum(amount) from VwArticleTagCount) desc	
end

GO
/****** Object:  StoredProcedure [dbo].[RemoveTagFromArticles]    Script Date: 01.09.2014 16:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveTagFromArticles]
	-- Add the parameters for the stored procedure here
	@TagId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from ArticleTag where TagId = @TagId
END


GO
-- Version 0.31 --

Create PROCEDURE GetSimilarArticles
	@ArticleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select  Top 5	t.Id, t.SefName ,t.Title,t.PublishEndDate, t.PublishStartDate,t.IsDraft,
					sum(Relevance) as Relevance 
	From ( 
			select	ArticleId,
					TagId, 
					(
						Select Count(*) from ArticleTag i 
						Where i.ArticleId = @ArticleId and TagId = o.TagId
					) Relevance 
			from ArticleTag o 
			where ArticleId <>  @ArticleId
		  ) x 
	left join Article t on x.ArticleId = t.Id 
	group by t.Id, t.SefName ,t.Title,t.PublishEndDate, t.PublishStartDate,t.IsDraft
	having sum(Relevance) > 0 
	order by sum(Relevance) desc  

END
GO

ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Activities
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	UserId bigint NOT NULL,
	ActivityDate datetime2(7) NOT NULL,
	Operation nvarchar(50) NOT NULL,
	Information nvarchar(100) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Activities ADD CONSTRAINT
	PK_Activities PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Activities ADD CONSTRAINT
	FK_Activities_KbUser FOREIGN KEY
	(
	UserId
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Activities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Category ADD
	Author bigint NOT NULL CONSTRAINT DF_Category_Author DEFAULT 1
GO
ALTER TABLE dbo.Category ADD CONSTRAINT
	FK_Category_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Category SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Settings ADD
	Author bigint NOT NULL CONSTRAINT DF_Settings_Author DEFAULT 1
GO
ALTER TABLE dbo.Settings ADD CONSTRAINT
	FK_Settings_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Settings SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Attachment ADD
	Author bigint NOT NULL CONSTRAINT DF_Attachment_Author DEFAULT 1
GO
ALTER TABLE dbo.Attachment ADD CONSTRAINT
	FK_Attachment_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Attachment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Tag ADD
	Author bigint NOT NULL CONSTRAINT DF_Tag_Author DEFAULT 1
GO
ALTER TABLE dbo.Tag ADD CONSTRAINT
	FK_Tag_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Tag SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser ADD
	Author bigint NOT NULL CONSTRAINT DF_KbUser_Author DEFAULT 1
GO
ALTER TABLE dbo.KbUser ADD CONSTRAINT
	FK_KbUser_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.KbUser SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ArticleTag ADD
	Author bigint NOT NULL CONSTRAINT DF_ArticleTag_Author DEFAULT 1
GO
ALTER TABLE dbo.ArticleTag ADD CONSTRAINT
	FK_ArticleTag_KbUser FOREIGN KEY
	(
	Author
	) REFERENCES dbo.KbUser
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ArticleTag SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION

ALTER TABLE dbo.Settings ADD
	BackupPath nvarchar(2000) NULL

COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.Activities ALTER COLUMN Information nvarchar(500)

COMMIT