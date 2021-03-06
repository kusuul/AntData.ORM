USE [Test]
GO
/****** Object:  Table [dbo].[person]    Script Date: 2016/12/4 星期日 17:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[person](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DataChange_LastTime] [datetime] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[SchoolId] [bigint] NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school]    Script Date: 2016/12/4 星期日 17:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[school](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[DataChange_LastTime] [datetime] NOT NULL,
 CONSTRAINT [PK_school] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[person] ADD  CONSTRAINT [DF_person_DataChange_LastTime]  DEFAULT (getdate()) FOR [DataChange_LastTime]
GO
ALTER TABLE [dbo].[school] ADD  CONSTRAINT [DF_school_DataChange_LastTime]  DEFAULT (getdate()) FOR [DataChange_LastTime]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [FK_persons_school] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[school] ([Id])
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [FK_persons_school]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'school', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'school', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'school', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'school', @level2type=N'COLUMN',@level2name=N'DataChange_LastTime'
GO
