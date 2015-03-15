USE [livingsuburb]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Badge]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badge](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[AwardsPoints] [int] NULL,
 CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BadgeTypeTimeLastChecked]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadgeTypeTimeLastChecked](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[BadgeType] [nvarchar](50) NOT NULL,
	[TimeLastChecked] [datetime] NOT NULL,
 CONSTRAINT [PK_BadgeTypeTimeLastChecked] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BannedEmail]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedEmail](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_BannedEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BannedWord]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedWord](
	[Id] [uniqueidentifier] NOT NULL,
	[Word] [nvarchar](75) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsStopWord] [bit] NULL,
 CONSTRAINT [PK_BannedWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Captchas]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Captchas](
	[CaptchaId] [int] IDENTITY(1,1) NOT NULL,
	[Filename] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Captchas] PRIMARY KEY CLUSTERED 
(
	[CaptchaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Category_Id] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Category_SortOrder]  DEFAULT ((0)),
	[IsLocked] [bit] NOT NULL CONSTRAINT [DF_Category_IsLocked]  DEFAULT ((0)),
	[ModerateTopics] [bit] NOT NULL,
	[ModeratePosts] [bit] NOT NULL,
	[PageTitle] [nvarchar](80) NULL,
	[MetaDescription] [nvarchar](200) NULL,
	[Path] [nvarchar](2500) NULL,
	[Colour] [nvarchar](50) NULL,
	[Image] [nvarchar](200) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryNotification]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryPermissionForRole]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryPermissionForRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Permission_Id] [uniqueidentifier] NOT NULL,
	[MembershipRole_Id] [uniqueidentifier] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[IsTicked] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryPermissionForRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[Id] [uniqueidentifier] NOT NULL,
	[EmailTo] [nvarchar](100) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[NameTo] [nvarchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[Id] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[TopicId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GlobalPermissionForRole]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalPermissionForRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Permission_Id] [uniqueidentifier] NOT NULL,
	[MembershipRole_Id] [uniqueidentifier] NOT NULL,
	[IsTicked] [bit] NOT NULL,
 CONSTRAINT [PK_GlobalPermissionForRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [nvarchar](20) NOT NULL,
	[FlagImageFileName] [nvarchar](50) NULL,
	[RightToLeft] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocaleResourceKey]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleResourceKey](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Notes] [nvarchar](2000) NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_LocaleResourceKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocaleStringResource]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleStringResource](
	[Id] [uniqueidentifier] NOT NULL,
	[Language_Id] [uniqueidentifier] NOT NULL,
	[LocaleResourceKey_Id] [uniqueidentifier] NOT NULL,
	[ResourceValue] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_LocaleStringResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipRole]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipRole](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_MembershipRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUser]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUser](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttempt] [int] NOT NULL,
	[Slug] [nvarchar](150) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Signature] [nvarchar](1000) NULL,
	[Age] [int] NULL,
	[Location] [nvarchar](100) NULL,
	[Website] [nvarchar](100) NULL,
	[Twitter] [nvarchar](60) NULL,
	[Facebook] [nvarchar](60) NULL,
	[Avatar] [nvarchar](500) NULL,
	[FacebookAccessToken] [nvarchar](300) NULL,
	[FacebookId] [bigint] NULL,
	[TwitterAccessToken] [nvarchar](300) NULL,
	[TwitterId] [nvarchar](150) NULL,
	[GoogleAccessToken] [nvarchar](300) NULL,
	[GoogleId] [nvarchar](150) NULL,
	[IsExternalAccount] [bit] NULL,
	[TwitterShowFeed] [bit] NULL,
	[DisableEmailNotifications] [bit] NULL,
	[DisablePosting] [bit] NULL,
	[DisablePrivateMessages] [bit] NULL,
	[DisableFileUploads] [bit] NULL,
	[LoginIdExpires] [datetime] NULL,
	[MiscAccessToken] [nvarchar](250) NULL,
	[Latitude] [nvarchar](40) NULL,
	[Longitude] [nvarchar](40) NULL,
	[LastActivityDate] [datetime] NULL,
 CONSTRAINT [PK_MembershipUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUser_Badge]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUser_Badge](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [MembershipUser_Badge_Id]  DEFAULT (newid()),
	[Badge_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MembershipUser_Badge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUserPoints]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUserPoints](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Points] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_MembershipUser_Points] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUsersInRoles]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUsersInRoles](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [MembershipUsersInRoles_Id]  DEFAULT (newid()),
	[RoleIdentifier] [uniqueidentifier] NOT NULL,
	[UserIdentifier] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MembershipUsersInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IsGlobal] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poll]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [uniqueidentifier] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollAnswer](
	[Id] [uniqueidentifier] NOT NULL,
	[Answer] [nvarchar](600) NOT NULL,
	[Poll_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PollAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollVote]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollVote](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[PollAnswer_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PollVote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[VoteCount] [int] NOT NULL CONSTRAINT [DF_Post_VoteCount]  DEFAULT ((0)),
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[DateEdited] [datetime] NULL,
	[IsSolution] [bit] NOT NULL CONSTRAINT [DF_Post_IsApproved]  DEFAULT ((0)),
	[IsTopicStarter] [bit] NULL CONSTRAINT [DF_Post_IsTopicStarter]  DEFAULT ((0)),
	[FlaggedAsSpam] [bit] NULL,
	[IpAddress] [nvarchar](50) NULL,
	[Pending] [bit] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMessage]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateMessage](
	[Id] [uniqueidentifier] NOT NULL,
	[UserTo_Id] [uniqueidentifier] NOT NULL,
	[UserFrom_Id] [uniqueidentifier] NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsSentMessage] [bit] NOT NULL,
 CONSTRAINT [PK_PrivateMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [uniqueidentifier] NOT NULL,
	[ForumName] [nvarchar](500) NULL,
	[ForumUrl] [nvarchar](500) NULL,
	[IsClosed] [bit] NULL,
	[EnableRSSFeeds] [bit] NULL,
	[DisplayEditedBy] [bit] NULL,
	[EnablePostFileAttachments] [bit] NULL,
	[EnableMarkAsSolution] [bit] NULL,
	[EnableSpamReporting] [bit] NULL,
	[EnableMemberReporting] [bit] NULL,
	[EnableEmailSubscriptions] [bit] NULL,
	[ManuallyAuthoriseNewMembers] [bit] NULL,
	[EmailAdminOnNewMemberSignUp] [bit] NULL,
	[TopicsPerPage] [int] NULL,
	[PostsPerPage] [int] NULL,
	[EnablePrivateMessages] [bit] NULL,
	[MaxPrivateMessagesPerMember] [int] NULL,
	[PrivateMessageFloodControl] [int] NULL,
	[EnableSignatures] [bit] NULL,
	[EnablePoints] [bit] NULL,
	[PointsAllowedToVoteAmount] [int] NULL,
	[PointsAddedPerPost] [int] NULL,
	[PointsAddedPostiveVote] [int] NULL,
	[PointsAddedForSolution] [int] NULL,
	[PointsDeductedNagativeVote] [int] NULL,
	[AdminEmailAddress] [nvarchar](100) NULL,
	[NotificationReplyEmail] [nvarchar](100) NULL,
	[SMTP] [nvarchar](100) NULL,
	[SMTPUsername] [nvarchar](100) NULL,
	[SMTPPort] [nvarchar](10) NULL,
	[SMTPEnableSSL] [bit] NULL,
	[SMTPPassword] [nvarchar](100) NULL,
	[Theme] [nvarchar](100) NULL,
	[NewMemberStartingRole] [uniqueidentifier] NULL,
	[DefaultLanguage_Id] [uniqueidentifier] NOT NULL,
	[ActivitiesPerPage] [int] NULL,
	[EnableAkisment] [bit] NULL,
	[AkismentKey] [nvarchar](100) NULL,
	[CurrentDatabaseVersion] [nvarchar](10) NULL,
	[SpamQuestion] [nvarchar](500) NULL,
	[SpamAnswer] [nvarchar](500) NULL,
	[EnableSocialLogins] [bit] NULL,
	[EnablePolls] [bit] NULL,
	[NewMemberEmailConfirmation] [bit] NULL,
	[SuspendRegistration] [bit] NULL,
	[PageTitle] [nvarchar](80) NULL,
	[MetaDesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Solved] [bit] NOT NULL CONSTRAINT [DF_Topic_Solved]  DEFAULT ((0)),
	[Category_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[Views] [int] NULL,
	[IsSticky] [bit] NOT NULL CONSTRAINT [DF_Topic_IsSticky]  DEFAULT ((0)),
	[IsLocked] [bit] NOT NULL CONSTRAINT [DF_Topic_IsLocked]  DEFAULT ((0)),
	[Poll_Id] [uniqueidentifier] NULL,
	[Pending] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic_Tag]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Tag](
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Id]  DEFAULT (newid()),
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[TopicTag_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Topic_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopicNotification]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopicTag]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicTag](
	[Id] [uniqueidentifier] NOT NULL,
	[Tag] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Topic_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadedFile]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFile](
	[Id] [uniqueidentifier] NOT NULL,
	[Filename] [nvarchar](200) NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UploadedFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 3/15/2015 8:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[VotedByMembershipUser_Id] [uniqueidentifier] NULL,
	[DateVoted] [datetime] NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'67e60f26-79d9-4546-aedd-a459009b2e24', CAST(N'2015-03-12 09:24:58.947' AS DateTime), N'UserID=095e7a70-6f65-4c57-9516-a459009b2d1f', N'MemberJoined')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'ddf8fdc9-3bae-40a1-b169-a45900a82b2b', CAST(N'2015-03-12 10:12:16.647' AS DateTime), N'UserID=0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'MemberJoined')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'3979a249-7f02-44e4-88aa-a45900ac254f', CAST(N'2015-03-12 10:26:45.807' AS DateTime), N'BadgeID=c9913ee2-b8e0-4543-8930-c723497ee65c,UserID=0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'BadgeAwarded')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'e7496c02-24b5-446e-b327-a45900ac25d9', CAST(N'2015-03-12 10:26:46.267' AS DateTime), N'BadgeID=2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1,UserID=095e7a70-6f65-4c57-9516-a459009b2d1f', N'BadgeAwarded')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'5a4d7420-7724-4914-8f13-a45900ac6adb', CAST(N'2015-03-12 10:27:45.157' AS DateTime), N'UserID=0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'ProfileUpdated')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'1c4afe5f-982c-4760-9e56-a45900ac7cf9', CAST(N'2015-03-12 10:28:00.613' AS DateTime), N'UserID=0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'ProfileUpdated')
GO
INSERT [dbo].[Activity] ([Id], [Timestamp], [Data], [Type]) VALUES (N'6f17d4a1-710f-43b8-99b5-a45900ad7251', CAST(N'2015-03-12 10:31:29.973' AS DateTime), N'UserID=0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'ProfileUpdated')
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'1931b389-b2b1-481c-80fc-03f1900e113d', N'Photogenic', N'Little things like uploading a profile picture make the community a better place. Thanks!', N'Profile', N'photogenic.png', N'Photogenic', 20)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'a88c62b2-394f-4d89-b61e-04a7b546416b', N'PadawanBadge', N'Had 10 or more posts successfully marked as an answer', N'MarkAsSolution', N'padawan.png', N'Padawan', 10)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1', N'PosterVoteUp', N'This badge is awarded to users after they receive their first vote up from another user', N'VoteUp', N'PosterVoteUpBadge.png', N'First Vote Up Received', 2)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'52284d2b-7ed6-4154-9ccc-3a7d99b18cca', N'MemberForAYear', N'This badge is awarded to a user after their first year anniversary', N'Time', N'MemberForAYearBadge.png', N'First Anniversary', 2)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'9ea3f651-ef37-4ad5-86a2-432012ad1e74', N'TheGrouch', N'This badge is awarded to users who have voted down other users posts 10 or more times', N'VoteDown', N'TheGrouch.png', N'The Grouch', 0)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'a54ec5d1-111d-4698-b2d0-78fbdaa52d1b', N'OneThousandPoints', N'This badge is awarded to users who have received 1000 points', N'Post', N'OneThousandPoints.png', N'Thousand Pointer', 10)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'4c54474b-51c2-4a52-bad2-96af5dea14d1', N'JediMasterBadge', N'Had 50 or more posts successfully marked as an answer', N'MarkAsSolution', N'jedi.png', N'Jedi Master', 50)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'9a247d50-35b5-4cd2-adaa-a0cf013325ac', N'PostContainsUmbraco', N'This badge is awarded to a user who mentions Umbraco in their latest post', N'Post', N'MentionsUmbracoBadge.png', N'Umbraco Fan', 1)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'8250f9f0-84d2-4dff-b651-c3df9e12bf2a', N'PosterMarkAsSolution', N'This badge is awarded to the poster of a post marked as the topic answer - The first time they author an answer', N'MarkAsSolution', N'PosterMarkAsSolutionBadge.png', N'Post Selected As Answer', 2)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'c9913ee2-b8e0-4543-8930-c723497ee65c', N'UserVoteUp', N'This badge is awarded to users after they make their first vote up', N'VoteUp', N'UserVoteUpBadge.png', N'You''ve Given Your First Vote Up', 2)
GO
INSERT [dbo].[Badge] ([Id], [Name], [Description], [Type], [Image], [DisplayName], [AwardsPoints]) VALUES (N'd68c289a-e3f7-4f55-ae4f-fc7ac2147781', N'AuthorMarkAsSolution', N'This badge is awarded to topic authors the first time they have a post marked as the answer', N'MarkAsSolution', N'UserMarkAsSolutionBadge.png', N'Your Question Solved', 2)
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'278b3cb8-c8c3-4e66-9b00-a459009beca9', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'Profile', CAST(N'2015-03-12 09:27:42.107' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'51c40d6d-40fe-41a5-9b90-a45900aa8d98', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'Time', CAST(N'2015-03-12 10:20:57.797' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'94b4a08f-97bc-4743-9de4-a45900aaf5cc', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'Post', CAST(N'2015-03-12 10:22:26.767' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'2345d031-d7bf-4da7-9f85-a45900ab7b0b', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'Post', CAST(N'2015-03-12 10:24:20.487' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'2403186a-11b6-4bf1-9e15-a45900ac24f4', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'VoteUp', CAST(N'2015-03-12 10:26:45.447' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'0d5bf946-6b0c-4a22-b681-a45900ac259c', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'VoteUp', CAST(N'2015-03-12 10:26:46.020' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'87b97cd7-937c-49b5-9bb0-a45900ac5ec5', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'Profile', CAST(N'2015-03-12 10:27:34.793' AS DateTime))
GO
INSERT [dbo].[BadgeTypeTimeLastChecked] ([Id], [MembershipUser_Id], [BadgeType], [TimeLastChecked]) VALUES (N'657bc969-8abe-46c8-99d9-a45900ad1468', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'Time', CAST(N'2015-03-12 10:30:09.797' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Captchas] ON 

GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (1, N'1plus1.gif', N'2', CAST(N'2015-03-06 19:43:41.363' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (2, N'1plus2.gif', N'3', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (3, N'1plus3.gif', N'4', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (4, N'1plus4.gif', N'5', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (5, N'1plus5.gif', N'6', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (6, N'2plus1.gif', N'3', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (7, N'2plus2.gif', N'4', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (8, N'2plus3.gif', N'5', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (9, N'2plus4.gif', N'6', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (10, N'2plus5.gif', N'7', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (11, N'3plus1.gif', N'4', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (12, N'3plus2.gif', N'5', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (13, N'3plus3.gif', N'6', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (14, N'3plus4.gif', N'7', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (15, N'3plus5.gif', N'8', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (16, N'4plus1.gif', N'5', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (17, N'4plus2.gif', N'6', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (18, N'4plus3.gif', N'7', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (19, N'4plus4.gif', N'8', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (20, N'4plus5.gif', N'9', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (21, N'4times1.gif', N'4', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (22, N'4times2.gif', N'8', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (23, N'4times3.gif', N'12', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (24, N'4times4.gif', N'16', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (25, N'4times5.gif', N'20', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (26, N'5plus1.gif', N'6', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (27, N'5plus2.gif', N'7', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (28, N'5plus3.gif', N'8', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (29, N'5plus4.gif', N'9', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (30, N'5plus5.gif', N'10', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (31, N'5times1.gif', N'5', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (32, N'5times2.gif', N'10', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (33, N'5times3.gif', N'15', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (34, N'5times4.gif', N'20', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Captchas] ([CaptchaId], [Filename], [Answer], [CreatedDate], [IsDeleted], [DeletedDate]) VALUES (35, N'5times5.gif', N'25', CAST(N'2015-03-06 19:43:41.367' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Captchas] OFF
GO
INSERT [dbo].[Category] ([Id], [Name], [Description], [Category_Id], [DateCreated], [Slug], [SortOrder], [IsLocked], [ModerateTopics], [ModeratePosts], [PageTitle], [MetaDescription], [Path], [Colour], [Image]) VALUES (N'5ea566da-bb78-4fbe-a3e2-a459009adf14', N'Example Category', NULL, NULL, CAST(N'2015-03-12 09:23:52.203' AS DateTime), N'example-category', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Email] ([Id], [EmailTo], [Body], [Subject], [NameTo], [DateCreated]) VALUES (N'87b645d3-fef6-49ea-a047-a459009b2dd0', N'my@email.com', N'<!DOCTYPE html>
<html>
<head>
    <title>Email Notification</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        @media only screen and (max-device-width: 480px) {
            table[class=w0], td[class=w0] { width: 0 !important; }
            table[class=w10], td[class=w10], img[class=w10] { width: 10px !important; }
            table[class=w15], td[class=w15], img[class=w15] { width: 5px !important; }
            table[class=w30], td[class=w30], img[class=w30] { width: 10px !important; }
            table[class=w60], td[class=w60], img[class=w60] { width: 10px !important; }
            table[class=w125], td[class=w125], img[class=w125] { width: 80px !important; }
            table[class=w130], td[class=w130], img[class=w130] { width: 55px !important; }
            table[class=w140], td[class=w140], img[class=w140] { width: 90px !important; }
            table[class=w160], td[class=w160], img[class=w160] { width: 180px !important; }
            table[class=w170], td[class=w170], img[class=w170] { width: 100px !important; }
            table[class=w180], td[class=w180], img[class=w180] { width: 80px !important; }
            table[class=w195], td[class=w195], img[class=w195] { width: 80px !important; }
            table[class=w220], td[class=w220], img[class=w220] { width: 80px !important; }
            table[class=w240], td[class=w240], img[class=w240] { width: 180px !important; }
            table[class=w255], td[class=w255], img[class=w255] { width: 185px !important; }
            table[class=w275], td[class=w275], img[class=w275] { width: 135px !important; }
            table[class=w280], td[class=w280], img[class=w280] { width: 135px !important; }
            table[class=w300], td[class=w300], img[class=w300] { width: 140px !important; }
            table[class=w325], td[class=w325], img[class=w325] { width: 95px !important; }
            table[class=w360], td[class=w360], img[class=w360] { width: 140px !important; }
            table[class=w410], td[class=w410], img[class=w410] { width: 180px !important; }
            table[class=w470], td[class=w470], img[class=w470] { width: 200px !important; }
            table[class=w580], td[class=w580], img[class=w580] { width: 280px !important; }
            table[class=w640], td[class=w640], img[class=w640] { width: 300px !important; }
            table[class*=hide], td[class*=hide], img[class*=hide], p[class*=hide], span[class*=hide] { display: none !important; }
            table[class=h0], td[class=h0] { height: 0 !important; }
            p[class=footer-content-left] { text-align: center !important; }
            #headline p { font-size: 30px !important; }
            .article-content, #left-sidebar { -webkit-text-size-adjust: 90% !important; -ms-text-size-adjust: 90% !important; }
            .header-content, .footer-content-left { -webkit-text-size-adjust: 80% !important; -ms-text-size-adjust: 80% !important; }
            img { height: auto; line-height: 100%; }
        }
        * { margin: 0 !Important; }
        #outlook a { padding: 0; }
        body { width: 100% !important; }
        .ReadMsgBody { width: 100%; }
        .ExternalClass { width: 100%; display: block !important; }
        body { background-color: #fafafa; margin: 0; padding: 0; }
        img { outline: none; text-decoration: none; display: block; }
        br, strong br, b br, em br, i br { line-height: 100%; }
        h1, h2, h3, h4, h5, h6 { line-height: 100% !important; -webkit-font-smoothing: antialiased; font-weight: normal; }
        h1 a, h2 a, h3 a, h4 a, h5 a, h6 a { color: #336699 !important; }
        h1 a:active, h2 a:active, h3 a:active, h4 a:active, h5 a:active, h6 a:active { color: red !important; }
        h1 a:visited, h2 a:visited, h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited { color: purple !important; }
        h1 { text-align: center !Important; margin: 0; padding-top: 15px; padding-bottom: 28px; }
        table td, table tr { border-collapse: collapse; }
        .yshortcuts, .yshortcuts a, .yshortcuts a:link, .yshortcuts a:visited, .yshortcuts a:hover, .yshortcuts a span { color: black; text-decoration: none !important; border-bottom: none !important; background: none !important; }
        code { white-space: normal; word-break: break-all; }
        #background-table { background-color: #FAFAFA; }
        #footer { -webkit-font-smoothing: antialiased; }
        body, td { font-family: Arial, Helvetica, Geneva, sans-serif; }
        .footer-content-left, .footer-content-right { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; }
        #headline p { color: #505050; font-family: Arial, Helvetica, Geneva, sans-serif; font-size: 36px; text-align: center; margin-top: 0px; padding-bottom: 30px; }
        #headline p a { color: #444444; text-decoration: none; }
        .article-title { font-size: 18px; line-height: 24px; color: #505050; font-weight: bold; margin-top: 0px; padding-bottom: 18px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-title a { color: #b0b0b0; text-decoration: none; }
        .article-title.with-meta { margin-bottom: 0; }
        .article-content { font-size: 14px; line-height: 18px; color: #505050; margin-top: 0px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-content a { color: #336699; font-weight: bold; text-decoration: none; }
        .article-content img { max-width: 100%; }
        .article-content ol, .article-content ul { margin-top: 0px; padding-bottom: 18px; padding-left: 19px; padding: 0; }
        .article-content li { font-size: 13px; line-height: 20px; color: #505050; }
        .article-content li a { color: #336699; text-decoration: underline; }
        .article-content p { padding-bottom: 18px; line-height: 22px; }
        .footer-content-left, .footer-content-right { font-size: 12px; line-height: 18px; color: #444444; margin-top: 0px; padding-bottom: 15px; }
        .footer-content-left a, .footer-content-right a { color: #444444; font-weight: bold; text-decoration: none; }
        #footer { background-color: #dddddd; color: #444444; }
        #footer a { color: #444444; text-decoration: none; font-weight: bold; }
        #permission-reminder { white-space: normal; }
        #street-address { white-space: normal; }
        h1.othersitestitle { font-size: 20px; padding-top: 25px; padding-bottom: 25px; border-top: 1px #f8f8f8 solid; color: #c7c7c7; }
    </style>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" id="background-table">
        <tbody>
            <tr>
                <td align="center" bgcolor="#fafafa">
                    <table class="w640" style="margin: 0 10px;" width="640" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td class="w640" width="640" height="30"></td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="20">
                                    <h2>MVC Forum</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="5"></td>
                            </tr>
                            <tr id="simple-content-row">
                                <td class="w640" width="640" bgcolor="#ffffff" style="border-color: #dddddd; border-width: 1px; border-style: solid;">
                                    <table class="w640" width="640" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                            <tr>
                                                <td class="w30" width="30"></td>
                                                <td class="w580" width="580">


                                                    <table class="w580" width="580" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="w580" width="580">
                                                                    <div align="left" class="article-content">
                                                                        
                                                                        <p><p>Members.Admin,</p></p>

                                                                        <p>Members.NewMemberRegistered</p><p>admin - you@email.com</p>           
                                                                        
                                                                        <p>&nbsp;</p>
                                                                        <a href="http://www.mydomain.com">http://www.mydomain.com</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>


                                                </td>
                                                <td class="w30" width="30"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>', N'Members.NewMemberSubject', N'Members.Admin', CAST(N'2015-03-12 09:24:59.357' AS DateTime))
GO
INSERT [dbo].[Email] ([Id], [EmailTo], [Body], [Subject], [NameTo], [DateCreated]) VALUES (N'3addfd40-53c9-4a77-a217-a45900a82b19', N'my@email.com', N'<!DOCTYPE html>
<html>
<head>
    <title>Email Notification</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        @media only screen and (max-device-width: 480px) {
            table[class=w0], td[class=w0] { width: 0 !important; }
            table[class=w10], td[class=w10], img[class=w10] { width: 10px !important; }
            table[class=w15], td[class=w15], img[class=w15] { width: 5px !important; }
            table[class=w30], td[class=w30], img[class=w30] { width: 10px !important; }
            table[class=w60], td[class=w60], img[class=w60] { width: 10px !important; }
            table[class=w125], td[class=w125], img[class=w125] { width: 80px !important; }
            table[class=w130], td[class=w130], img[class=w130] { width: 55px !important; }
            table[class=w140], td[class=w140], img[class=w140] { width: 90px !important; }
            table[class=w160], td[class=w160], img[class=w160] { width: 180px !important; }
            table[class=w170], td[class=w170], img[class=w170] { width: 100px !important; }
            table[class=w180], td[class=w180], img[class=w180] { width: 80px !important; }
            table[class=w195], td[class=w195], img[class=w195] { width: 80px !important; }
            table[class=w220], td[class=w220], img[class=w220] { width: 80px !important; }
            table[class=w240], td[class=w240], img[class=w240] { width: 180px !important; }
            table[class=w255], td[class=w255], img[class=w255] { width: 185px !important; }
            table[class=w275], td[class=w275], img[class=w275] { width: 135px !important; }
            table[class=w280], td[class=w280], img[class=w280] { width: 135px !important; }
            table[class=w300], td[class=w300], img[class=w300] { width: 140px !important; }
            table[class=w325], td[class=w325], img[class=w325] { width: 95px !important; }
            table[class=w360], td[class=w360], img[class=w360] { width: 140px !important; }
            table[class=w410], td[class=w410], img[class=w410] { width: 180px !important; }
            table[class=w470], td[class=w470], img[class=w470] { width: 200px !important; }
            table[class=w580], td[class=w580], img[class=w580] { width: 280px !important; }
            table[class=w640], td[class=w640], img[class=w640] { width: 300px !important; }
            table[class*=hide], td[class*=hide], img[class*=hide], p[class*=hide], span[class*=hide] { display: none !important; }
            table[class=h0], td[class=h0] { height: 0 !important; }
            p[class=footer-content-left] { text-align: center !important; }
            #headline p { font-size: 30px !important; }
            .article-content, #left-sidebar { -webkit-text-size-adjust: 90% !important; -ms-text-size-adjust: 90% !important; }
            .header-content, .footer-content-left { -webkit-text-size-adjust: 80% !important; -ms-text-size-adjust: 80% !important; }
            img { height: auto; line-height: 100%; }
        }
        * { margin: 0 !Important; }
        #outlook a { padding: 0; }
        body { width: 100% !important; }
        .ReadMsgBody { width: 100%; }
        .ExternalClass { width: 100%; display: block !important; }
        body { background-color: #fafafa; margin: 0; padding: 0; }
        img { outline: none; text-decoration: none; display: block; }
        br, strong br, b br, em br, i br { line-height: 100%; }
        h1, h2, h3, h4, h5, h6 { line-height: 100% !important; -webkit-font-smoothing: antialiased; font-weight: normal; }
        h1 a, h2 a, h3 a, h4 a, h5 a, h6 a { color: #336699 !important; }
        h1 a:active, h2 a:active, h3 a:active, h4 a:active, h5 a:active, h6 a:active { color: red !important; }
        h1 a:visited, h2 a:visited, h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited { color: purple !important; }
        h1 { text-align: center !Important; margin: 0; padding-top: 15px; padding-bottom: 28px; }
        table td, table tr { border-collapse: collapse; }
        .yshortcuts, .yshortcuts a, .yshortcuts a:link, .yshortcuts a:visited, .yshortcuts a:hover, .yshortcuts a span { color: black; text-decoration: none !important; border-bottom: none !important; background: none !important; }
        code { white-space: normal; word-break: break-all; }
        #background-table { background-color: #FAFAFA; }
        #footer { -webkit-font-smoothing: antialiased; }
        body, td { font-family: Arial, Helvetica, Geneva, sans-serif; }
        .footer-content-left, .footer-content-right { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; }
        #headline p { color: #505050; font-family: Arial, Helvetica, Geneva, sans-serif; font-size: 36px; text-align: center; margin-top: 0px; padding-bottom: 30px; }
        #headline p a { color: #444444; text-decoration: none; }
        .article-title { font-size: 18px; line-height: 24px; color: #505050; font-weight: bold; margin-top: 0px; padding-bottom: 18px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-title a { color: #b0b0b0; text-decoration: none; }
        .article-title.with-meta { margin-bottom: 0; }
        .article-content { font-size: 14px; line-height: 18px; color: #505050; margin-top: 0px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-content a { color: #336699; font-weight: bold; text-decoration: none; }
        .article-content img { max-width: 100%; }
        .article-content ol, .article-content ul { margin-top: 0px; padding-bottom: 18px; padding-left: 19px; padding: 0; }
        .article-content li { font-size: 13px; line-height: 20px; color: #505050; }
        .article-content li a { color: #336699; text-decoration: underline; }
        .article-content p { padding-bottom: 18px; line-height: 22px; }
        .footer-content-left, .footer-content-right { font-size: 12px; line-height: 18px; color: #444444; margin-top: 0px; padding-bottom: 15px; }
        .footer-content-left a, .footer-content-right a { color: #444444; font-weight: bold; text-decoration: none; }
        #footer { background-color: #dddddd; color: #444444; }
        #footer a { color: #444444; text-decoration: none; font-weight: bold; }
        #permission-reminder { white-space: normal; }
        #street-address { white-space: normal; }
        h1.othersitestitle { font-size: 20px; padding-top: 25px; padding-bottom: 25px; border-top: 1px #f8f8f8 solid; color: #c7c7c7; }
    </style>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" id="background-table">
        <tbody>
            <tr>
                <td align="center" bgcolor="#fafafa">
                    <table class="w640" style="margin: 0 10px;" width="640" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td class="w640" width="640" height="30"></td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="20">
                                    <h2>MVC Forum</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="5"></td>
                            </tr>
                            <tr id="simple-content-row">
                                <td class="w640" width="640" bgcolor="#ffffff" style="border-color: #dddddd; border-width: 1px; border-style: solid;">
                                    <table class="w640" width="640" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                            <tr>
                                                <td class="w30" width="30"></td>
                                                <td class="w580" width="580">


                                                    <table class="w580" width="580" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="w580" width="580">
                                                                    <div align="left" class="article-content">
                                                                        
                                                                        <p><p>Admin,</p></p>

                                                                        <p>New member registered on MVC Forum (http://www.mydomain.com)</p><p>zenna - zenna.occi@hotmail.com</p>           
                                                                        
                                                                        <p>&nbsp;</p>
                                                                        <a href="http://www.mydomain.com">http://www.mydomain.com</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>


                                                </td>
                                                <td class="w30" width="30"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>', N'New Member Registered', N'Admin', CAST(N'2015-03-12 10:12:16.937' AS DateTime))
GO
INSERT [dbo].[Email] ([Id], [EmailTo], [Body], [Subject], [NameTo], [DateCreated]) VALUES (N'46dd8475-e9b0-4c44-8e3f-a45900ab7a7f', N'you@email.com', N'<!DOCTYPE html>
<html>
<head>
    <title>Email Notification</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        @media only screen and (max-device-width: 480px) {
            table[class=w0], td[class=w0] { width: 0 !important; }
            table[class=w10], td[class=w10], img[class=w10] { width: 10px !important; }
            table[class=w15], td[class=w15], img[class=w15] { width: 5px !important; }
            table[class=w30], td[class=w30], img[class=w30] { width: 10px !important; }
            table[class=w60], td[class=w60], img[class=w60] { width: 10px !important; }
            table[class=w125], td[class=w125], img[class=w125] { width: 80px !important; }
            table[class=w130], td[class=w130], img[class=w130] { width: 55px !important; }
            table[class=w140], td[class=w140], img[class=w140] { width: 90px !important; }
            table[class=w160], td[class=w160], img[class=w160] { width: 180px !important; }
            table[class=w170], td[class=w170], img[class=w170] { width: 100px !important; }
            table[class=w180], td[class=w180], img[class=w180] { width: 80px !important; }
            table[class=w195], td[class=w195], img[class=w195] { width: 80px !important; }
            table[class=w220], td[class=w220], img[class=w220] { width: 80px !important; }
            table[class=w240], td[class=w240], img[class=w240] { width: 180px !important; }
            table[class=w255], td[class=w255], img[class=w255] { width: 185px !important; }
            table[class=w275], td[class=w275], img[class=w275] { width: 135px !important; }
            table[class=w280], td[class=w280], img[class=w280] { width: 135px !important; }
            table[class=w300], td[class=w300], img[class=w300] { width: 140px !important; }
            table[class=w325], td[class=w325], img[class=w325] { width: 95px !important; }
            table[class=w360], td[class=w360], img[class=w360] { width: 140px !important; }
            table[class=w410], td[class=w410], img[class=w410] { width: 180px !important; }
            table[class=w470], td[class=w470], img[class=w470] { width: 200px !important; }
            table[class=w580], td[class=w580], img[class=w580] { width: 280px !important; }
            table[class=w640], td[class=w640], img[class=w640] { width: 300px !important; }
            table[class*=hide], td[class*=hide], img[class*=hide], p[class*=hide], span[class*=hide] { display: none !important; }
            table[class=h0], td[class=h0] { height: 0 !important; }
            p[class=footer-content-left] { text-align: center !important; }
            #headline p { font-size: 30px !important; }
            .article-content, #left-sidebar { -webkit-text-size-adjust: 90% !important; -ms-text-size-adjust: 90% !important; }
            .header-content, .footer-content-left { -webkit-text-size-adjust: 80% !important; -ms-text-size-adjust: 80% !important; }
            img { height: auto; line-height: 100%; }
        }
        * { margin: 0 !Important; }
        #outlook a { padding: 0; }
        body { width: 100% !important; }
        .ReadMsgBody { width: 100%; }
        .ExternalClass { width: 100%; display: block !important; }
        body { background-color: #fafafa; margin: 0; padding: 0; }
        img { outline: none; text-decoration: none; display: block; }
        br, strong br, b br, em br, i br { line-height: 100%; }
        h1, h2, h3, h4, h5, h6 { line-height: 100% !important; -webkit-font-smoothing: antialiased; font-weight: normal; }
        h1 a, h2 a, h3 a, h4 a, h5 a, h6 a { color: #336699 !important; }
        h1 a:active, h2 a:active, h3 a:active, h4 a:active, h5 a:active, h6 a:active { color: red !important; }
        h1 a:visited, h2 a:visited, h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited { color: purple !important; }
        h1 { text-align: center !Important; margin: 0; padding-top: 15px; padding-bottom: 28px; }
        table td, table tr { border-collapse: collapse; }
        .yshortcuts, .yshortcuts a, .yshortcuts a:link, .yshortcuts a:visited, .yshortcuts a:hover, .yshortcuts a span { color: black; text-decoration: none !important; border-bottom: none !important; background: none !important; }
        code { white-space: normal; word-break: break-all; }
        #background-table { background-color: #FAFAFA; }
        #footer { -webkit-font-smoothing: antialiased; }
        body, td { font-family: Arial, Helvetica, Geneva, sans-serif; }
        .footer-content-left, .footer-content-right { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; }
        #headline p { color: #505050; font-family: Arial, Helvetica, Geneva, sans-serif; font-size: 36px; text-align: center; margin-top: 0px; padding-bottom: 30px; }
        #headline p a { color: #444444; text-decoration: none; }
        .article-title { font-size: 18px; line-height: 24px; color: #505050; font-weight: bold; margin-top: 0px; padding-bottom: 18px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-title a { color: #b0b0b0; text-decoration: none; }
        .article-title.with-meta { margin-bottom: 0; }
        .article-content { font-size: 14px; line-height: 18px; color: #505050; margin-top: 0px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-content a { color: #336699; font-weight: bold; text-decoration: none; }
        .article-content img { max-width: 100%; }
        .article-content ol, .article-content ul { margin-top: 0px; padding-bottom: 18px; padding-left: 19px; padding: 0; }
        .article-content li { font-size: 13px; line-height: 20px; color: #505050; }
        .article-content li a { color: #336699; text-decoration: underline; }
        .article-content p { padding-bottom: 18px; line-height: 22px; }
        .footer-content-left, .footer-content-right { font-size: 12px; line-height: 18px; color: #444444; margin-top: 0px; padding-bottom: 15px; }
        .footer-content-left a, .footer-content-right a { color: #444444; font-weight: bold; text-decoration: none; }
        #footer { background-color: #dddddd; color: #444444; }
        #footer a { color: #444444; text-decoration: none; font-weight: bold; }
        #permission-reminder { white-space: normal; }
        #street-address { white-space: normal; }
        h1.othersitestitle { font-size: 20px; padding-top: 25px; padding-bottom: 25px; border-top: 1px #f8f8f8 solid; color: #c7c7c7; }
    </style>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" id="background-table">
        <tbody>
            <tr>
                <td align="center" bgcolor="#fafafa">
                    <table class="w640" style="margin: 0 10px;" width="640" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td class="w640" width="640" height="30"></td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="20">
                                    <h2>MVC Forum</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="5"></td>
                            </tr>
                            <tr id="simple-content-row">
                                <td class="w640" width="640" bgcolor="#ffffff" style="border-color: #dddddd; border-width: 1px; border-style: solid;">
                                    <table class="w640" width="640" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                            <tr>
                                                <td class="w30" width="30"></td>
                                                <td class="w580" width="580">


                                                    <table class="w580" width="580" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="w580" width="580">
                                                                    <div align="left" class="article-content">
                                                                        
                                                                        <p><p>admin,</p></p>

                                                                        <p>A new post has been created in the testing topic</p><p>http://www.mydomain.com/chat/testing</p>           
                                                                        
                                                                        <p>&nbsp;</p>
                                                                        <a href="http://www.mydomain.com">http://www.mydomain.com</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>


                                                </td>
                                                <td class="w30" width="30"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>', N'New Post On MVC Forum', N'admin', CAST(N'2015-03-12 10:24:20.047' AS DateTime))
GO
INSERT [dbo].[Email] ([Id], [EmailTo], [Body], [Subject], [NameTo], [DateCreated]) VALUES (N'497b16dd-2736-44aa-9075-a45900ab8869', N'you@email.com', N'<!DOCTYPE html>
<html>
<head>
    <title>Email Notification</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        @media only screen and (max-device-width: 480px) {
            table[class=w0], td[class=w0] { width: 0 !important; }
            table[class=w10], td[class=w10], img[class=w10] { width: 10px !important; }
            table[class=w15], td[class=w15], img[class=w15] { width: 5px !important; }
            table[class=w30], td[class=w30], img[class=w30] { width: 10px !important; }
            table[class=w60], td[class=w60], img[class=w60] { width: 10px !important; }
            table[class=w125], td[class=w125], img[class=w125] { width: 80px !important; }
            table[class=w130], td[class=w130], img[class=w130] { width: 55px !important; }
            table[class=w140], td[class=w140], img[class=w140] { width: 90px !important; }
            table[class=w160], td[class=w160], img[class=w160] { width: 180px !important; }
            table[class=w170], td[class=w170], img[class=w170] { width: 100px !important; }
            table[class=w180], td[class=w180], img[class=w180] { width: 80px !important; }
            table[class=w195], td[class=w195], img[class=w195] { width: 80px !important; }
            table[class=w220], td[class=w220], img[class=w220] { width: 80px !important; }
            table[class=w240], td[class=w240], img[class=w240] { width: 180px !important; }
            table[class=w255], td[class=w255], img[class=w255] { width: 185px !important; }
            table[class=w275], td[class=w275], img[class=w275] { width: 135px !important; }
            table[class=w280], td[class=w280], img[class=w280] { width: 135px !important; }
            table[class=w300], td[class=w300], img[class=w300] { width: 140px !important; }
            table[class=w325], td[class=w325], img[class=w325] { width: 95px !important; }
            table[class=w360], td[class=w360], img[class=w360] { width: 140px !important; }
            table[class=w410], td[class=w410], img[class=w410] { width: 180px !important; }
            table[class=w470], td[class=w470], img[class=w470] { width: 200px !important; }
            table[class=w580], td[class=w580], img[class=w580] { width: 280px !important; }
            table[class=w640], td[class=w640], img[class=w640] { width: 300px !important; }
            table[class*=hide], td[class*=hide], img[class*=hide], p[class*=hide], span[class*=hide] { display: none !important; }
            table[class=h0], td[class=h0] { height: 0 !important; }
            p[class=footer-content-left] { text-align: center !important; }
            #headline p { font-size: 30px !important; }
            .article-content, #left-sidebar { -webkit-text-size-adjust: 90% !important; -ms-text-size-adjust: 90% !important; }
            .header-content, .footer-content-left { -webkit-text-size-adjust: 80% !important; -ms-text-size-adjust: 80% !important; }
            img { height: auto; line-height: 100%; }
        }
        * { margin: 0 !Important; }
        #outlook a { padding: 0; }
        body { width: 100% !important; }
        .ReadMsgBody { width: 100%; }
        .ExternalClass { width: 100%; display: block !important; }
        body { background-color: #fafafa; margin: 0; padding: 0; }
        img { outline: none; text-decoration: none; display: block; }
        br, strong br, b br, em br, i br { line-height: 100%; }
        h1, h2, h3, h4, h5, h6 { line-height: 100% !important; -webkit-font-smoothing: antialiased; font-weight: normal; }
        h1 a, h2 a, h3 a, h4 a, h5 a, h6 a { color: #336699 !important; }
        h1 a:active, h2 a:active, h3 a:active, h4 a:active, h5 a:active, h6 a:active { color: red !important; }
        h1 a:visited, h2 a:visited, h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited { color: purple !important; }
        h1 { text-align: center !Important; margin: 0; padding-top: 15px; padding-bottom: 28px; }
        table td, table tr { border-collapse: collapse; }
        .yshortcuts, .yshortcuts a, .yshortcuts a:link, .yshortcuts a:visited, .yshortcuts a:hover, .yshortcuts a span { color: black; text-decoration: none !important; border-bottom: none !important; background: none !important; }
        code { white-space: normal; word-break: break-all; }
        #background-table { background-color: #FAFAFA; }
        #footer { -webkit-font-smoothing: antialiased; }
        body, td { font-family: Arial, Helvetica, Geneva, sans-serif; }
        .footer-content-left, .footer-content-right { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; }
        #headline p { color: #505050; font-family: Arial, Helvetica, Geneva, sans-serif; font-size: 36px; text-align: center; margin-top: 0px; padding-bottom: 30px; }
        #headline p a { color: #444444; text-decoration: none; }
        .article-title { font-size: 18px; line-height: 24px; color: #505050; font-weight: bold; margin-top: 0px; padding-bottom: 18px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-title a { color: #b0b0b0; text-decoration: none; }
        .article-title.with-meta { margin-bottom: 0; }
        .article-content { font-size: 14px; line-height: 18px; color: #505050; margin-top: 0px; font-family: Arial, Helvetica, Geneva, sans-serif; }
        .article-content a { color: #336699; font-weight: bold; text-decoration: none; }
        .article-content img { max-width: 100%; }
        .article-content ol, .article-content ul { margin-top: 0px; padding-bottom: 18px; padding-left: 19px; padding: 0; }
        .article-content li { font-size: 13px; line-height: 20px; color: #505050; }
        .article-content li a { color: #336699; text-decoration: underline; }
        .article-content p { padding-bottom: 18px; line-height: 22px; }
        .footer-content-left, .footer-content-right { font-size: 12px; line-height: 18px; color: #444444; margin-top: 0px; padding-bottom: 15px; }
        .footer-content-left a, .footer-content-right a { color: #444444; font-weight: bold; text-decoration: none; }
        #footer { background-color: #dddddd; color: #444444; }
        #footer a { color: #444444; text-decoration: none; font-weight: bold; }
        #permission-reminder { white-space: normal; }
        #street-address { white-space: normal; }
        h1.othersitestitle { font-size: 20px; padding-top: 25px; padding-bottom: 25px; border-top: 1px #f8f8f8 solid; color: #c7c7c7; }
    </style>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" id="background-table">
        <tbody>
            <tr>
                <td align="center" bgcolor="#fafafa">
                    <table class="w640" style="margin: 0 10px;" width="640" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td class="w640" width="640" height="30"></td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="20">
                                    <h2>MVC Forum</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="w640" width="640" height="5"></td>
                            </tr>
                            <tr id="simple-content-row">
                                <td class="w640" width="640" bgcolor="#ffffff" style="border-color: #dddddd; border-width: 1px; border-style: solid;">
                                    <table class="w640" width="640" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                            <tr>
                                                <td class="w30" width="30"></td>
                                                <td class="w580" width="580">


                                                    <table class="w580" width="580" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="w580" width="580">
                                                                    <div align="left" class="article-content">
                                                                        
                                                                        <p><p>admin,</p></p>

                                                                        <p>A new post has been created in the testing topic</p><p>http://www.mydomain.com/chat/testing</p>           
                                                                        
                                                                        <p>&nbsp;</p>
                                                                        <a href="http://www.mydomain.com">http://www.mydomain.com</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>


                                                </td>
                                                <td class="w30" width="30"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="5"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="w640" width="640" height="25"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>', N'New Post On MVC Forum', N'admin', CAST(N'2015-03-12 10:24:31.923' AS DateTime))
GO
INSERT [dbo].[Favourite] ([Id], [MemberId], [PostId], [TopicId], [DateCreated]) VALUES (N'7f0c04db-7b2f-4d0f-b6ae-a45900ac27d1', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'c3629b8a-6d26-405c-a9bd-a45900aaf12a', N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', CAST(N'2015-03-12 10:26:47.947' AS DateTime))
GO
INSERT [dbo].[Language] ([Id], [Name], [LanguageCulture], [FlagImageFileName], [RightToLeft]) VALUES (N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'English (United Kingdom)', N'en-GB', NULL, 0)
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd19929e5-1bd3-4063-bcd6-a459009ae04e', N'Layout.Nav.Register', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2f20862d-def9-42df-99b9-a459009ae07d', N'Layout.Nav.Logon', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bf3e5149-4f05-4163-b0eb-a459009ae09e', N'Layout.Nav.Activity', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'56e15d38-ea15-40e4-84b6-a459009ae0c3', N'Layout.Nav.Leaderboard', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b4525094-9fe8-443d-ba5e-a459009ae0e4', N'Layout.Nav.Home', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'16b73855-a676-4baa-aa5e-a459009ae105', N'Layout.Nav.Admin', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'63f15d5e-89de-42f5-8fe6-a459009ae126', N'Layout.CreateButton', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3c902011-b582-4454-8f62-a459009ae146', N'Layout.PoweredBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1d574c68-30ce-4ff7-8fce-a459009ae16c', N'Topic.Votes', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd7027863-ee13-42d6-aff4-a459009ae18d', N'Topic.Comments', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'99a4d273-29e7-4a19-bbf5-a459009ae1ae', N'Topic.StartedBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bebc93f7-46b9-487c-b746-a459009ae1d3', N'Topic.InCategory', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4df7e7a3-646a-48d9-ac9e-a459009ae1f4', N'Topic.LatestBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a6b26f4d-d299-4025-9df0-a459009ae215', N'Topic.Views', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e9d3cb9d-cbab-4a3f-8bb9-a459009ae23a', N'Post.VoteUp', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0ebfdcd5-009f-4faf-b3af-a459009ae25b', N'Post.VoteDown', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'42c8d675-b05f-45e0-87b1-a459009ae27c', N'Post.IsSolution', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd0fdedc3-9fac-4985-88de-a459009ae29d', N'Post.PostedThis', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'33b58426-8aff-49e1-8c1c-a459009ae2bd', N'Post.Posts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2a7f1361-d3a7-4350-92e3-a459009ae2e3', N'Post.Points', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a33f868a-565c-4199-a954-a459009ae2ff', N'Post.LastEdited', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4a07d680-b7b2-4eb9-81d9-a459009ae325', N'Post.Report', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3e941756-572c-4304-b057-a459009ae345', N'Post.Edit', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dc9ffb08-1379-44a4-b25c-a459009ae36b', N'Post.Delete', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7f79f439-5df2-49ab-9954-a459009ae387', N'LogOn.LogOn', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1adfdb83-5bd3-4a11-b02e-a459009ae3ac', N'LogOn.LogOff', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8c5bdd6b-3996-43e0-b523-a459009ae3cd', N'Post.PleaseWait', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9d7b3d49-4a46-4c73-97f6-a459009ae3ee', N'Topic.DiscussionTaggedWith', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e55a4027-dbcc-4683-9328-a459009ae40f', N'Topic.TitleFallBack', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'38b0442e-09fa-438b-be0c-a459009ae434', N'Topic.Subscribe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c2b615ad-af32-4f10-8e0e-a459009ae455', N'Topic.UnSubscribe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7a83d8a4-3103-4999-a95d-a459009ae47b', N'Topic.IsLocked', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'754f6314-7054-4f30-b0b3-a459009ae49c', N'Topic.CreateDiscussion', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'76a3811c-85eb-4f55-9682-a459009ae4bc', N'Topic.TagThisTopic', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a3b1af05-2671-4adc-b119-a459009ae4e2', N'Tags.PopularTags', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'366d22bb-6aa4-4ee9-bd63-a459009ae503', N'Stats.FooterMainStatText', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0f06ed24-1fbc-4955-8b5f-a459009ae523', N'Stats.LatestMembers', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fca1ce67-b14f-4a6e-9a01-a459009ae549', N'PM.Title', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'48db0412-6e5d-4c81-adce-a459009ae56a', N'PM.From', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a6ea9832-2f40-4298-98f8-a459009ae58b', N'PM.Sent', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'85166b23-4707-43ed-9afd-a459009ae5b0', N'PM.BackToInbox', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0494223e-4c5c-4e35-91ac-a459009ae5e8', N'PM.Reply', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e169a0a0-7bab-49c1-b6c7-a459009ae60e', N'PM.SentPrivateMessages', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'624f742d-6624-43da-8163-a459009ae62f', N'PM.To', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0a3c2812-6c6a-4f77-9e90-a459009ae64f', N'PM.Subject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2a643934-05de-4b5b-b0f5-a459009ae670', N'PM.Date', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'be0ecc8a-fbf5-414a-89ba-a459009ae691', N'PM.Read', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'aa22e80d-4b66-4bd2-b022-a459009ae6b7', N'PM.Delete', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'11359610-cc19-4d90-a0ff-a459009ae6d7', N'PM.NoMessages', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6e58b86d-3165-46d9-b455-a459009ae6f8', N'PM.Create', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f9a1d3c1-f219-46e2-8e87-a459009ae719', N'PM.ReceivedPrivateMessages', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dd6a4ad5-08a9-4d62-b5b8-a459009ae743', N'PM.CreatePrivateMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3237ce54-1999-442d-83c1-a459009ae764', N'PM.Send', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dfde32cb-5c47-457d-8d81-a459009ae78a', N'PM.OriginalMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'67cb5b33-6fb0-4b79-959b-a459009ae7aa', N'Buttons.Send', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3657cf09-b923-498e-a189-a459009ae7cb', N'Report.ReportPostBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'94ee66f4-155d-4886-af64-a459009ae7ec', N'Buttons.Edit', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9a259ea1-ae5b-4721-bc75-a459009ae811', N'Points.ThisWeeksHighEarners', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3031280f-0997-4b92-9196-a459009ae832', N'SideBox.MyTools', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2fe8d51d-291b-4373-a02b-a459009ae853', N'PM.PrivateMessages', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'89aaba57-e9e9-4819-86be-a459009ae874', N'Members.SearchMembers', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'222a157d-14c7-4370-b34c-a459009ae89e', N'Buttons.Search', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'23a89d18-d0dc-4d31-835e-a459009ae8bf', N'Members.Users', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'03bfd327-b36a-4b1a-ad3c-a459009ae8e4', N'Members.Points', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f3aeda23-9987-484b-87b7-a459009ae905', N'Members.DateJoined', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b0125c87-409f-46d4-9641-a459009ae926', N'Report.Report', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1cfba3ad-4cec-4501-97d7-a459009ae94c', N'Members.Register', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b5400b20-7612-49c5-b154-a459009ae96c', N'Members.AlreadyRegistered', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8a44f2f0-bfa1-41b3-a8b8-a459009ae992', N'Members.LogOnMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'213b3bdd-618d-4a97-ba08-a459009ae9b3', N'Buttons.LogOn', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'59e89c6c-f2aa-4d38-bcbf-a459009ae9d3', N'Members.ProfileTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'993133af-6436-4bd1-bec5-a459009ae9f9', N'Members.Profile.Joined', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'129be9d0-e715-492c-a985-a459009aea1a', N'Members.Profile.Posts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f7961d70-6497-4b3a-8c6c-a459009aea3f', N'Members.Profile.Points', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6a662b0c-edaf-4ddc-86ce-a459009aea65', N'Buttons.Report', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'487023b9-bffc-4e8a-a165-a459009aea86', N'Members.Profile.Age', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'895c0fb7-fe0c-4b4a-ae9a-a459009aeaab', N'Members.Profile.Location', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f4c5a81a-3713-4dbb-abb7-a459009aeacc', N'Members.Profile.Website', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'88ed7322-4665-4b51-913a-a459009aeaf1', N'Members.Profile.Twitter', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7cf4c924-5fed-4cf8-b923-a459009aeb17', N'Members.Profile.Facebook', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3fae9fc8-746c-4beb-946c-a459009aeb38', N'Members.Profile.DiscussionActivity', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'701ffec4-f0f5-4605-8998-a459009aeb59', N'Ajax.PleaseWait', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a5f671b1-3ca5-4f25-b816-a459009aeb7e', N'Members.Profile.Badges', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ba8fa9e4-df60-41bf-aa39-a459009aeb9f', N'Members.EditProfile', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3524d239-bb58-47df-9a30-a459009aebc0', N'Buttons.Save', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a95255f7-4c13-4bcb-b80c-a459009aebe5', N'Members.EditMember', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2c468faf-893b-42d3-822e-a459009aec06', N'Leaderboard.ThisWeeksStars', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'84a29699-e152-48eb-885a-a459009aec27', N'Leaderboard.ThisYearsStars', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9f26c6bc-67e8-43fe-99b5-a459009aec4c', N'Leaderboard.LeaderboardTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'be1fec3c-9ad3-442b-8149-a459009aec6d', N'Home.LatestDiscussions', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9512b8ad-6359-43dc-92ad-a459009aec8e', N'Home.Rss', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7eae16ca-86db-413f-9f7f-a459009aecb3', N'Activity.ActivityTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd1847c2b-3857-456e-8cbc-a459009aecd4', N'Notification.SubscribeByEmail', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'188273c8-bc42-48ba-ba45-a459009aecfa', N'Notification.UnSubscribeByEmail', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2d5e0d16-2aa0-44d6-b7fb-a459009aed1b', N'Notification.Subscribe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7cc043aa-9d3f-44ff-81db-a459009aed40', N'Notification.UnSubscribe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c7852cf0-4dd4-4326-8ae6-a459009aed61', N'Category.NoDiscussions', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'00bdb12f-899e-4d21-ac17-a459009aed86', N'Category.CategoriesSideHeading', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'67a95f08-8131-45f1-bc74-a459009aeda7', N'PM.RecipientUsername', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6e35a0f7-7ddb-47b4-8648-a459009aedcd', N'PM.MessageSubject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'104a0aa5-409b-4988-ad73-a459009aedf2', N'Post.Label.TopicName', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eafc8c7d-eae3-4fab-9c85-a459009aee13', N'Post.Label.IsStickyTopic', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7ba308d2-4137-48c1-9c37-a459009aee38', N'Post.Label.LockTopic', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6d904239-a741-4414-860a-a459009aee5e', N'Post.label.TopicCategory', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd4b29ac7-8d8f-44cb-8512-a459009aee7f', N'Members.Label.Username', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c2292b2f-106c-44d9-b9bc-a459009aeea4', N'Members.Label.EmailAddress', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8ff96bd8-8a16-4788-a1a5-a459009aeeca', N'Members.Label.Password', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6d41c65d-85e0-40cc-b702-a459009aeeeb', N'Members.Label.ConfirmPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'80c3d2dd-69d7-44f5-9684-a459009aef10', N'Members.Label.UserIsApproved', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cdc480a3-f85b-494e-b3cb-a459009aef31', N'Members.Label.Comment', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'42cd3963-9b6d-46f0-ae61-a459009aef56', N'Members.Label.Roles', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1a6ffc4d-ed52-4f40-b6a4-a459009aef77', N'Members.Label.Signature', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'91a5615f-22fb-4459-b16b-a459009aef9d', N'Members.Label.Age', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1131652c-7a46-4c09-b15d-a459009aefbe', N'Members.Label.Location', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f9fad577-dadf-430a-a646-a459009aefe3', N'Members.Label.Website', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'435c70cf-cbd1-4631-99af-a459009af009', N'Members.Label.Twitter', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9fa02715-fbbe-48f5-bd0a-a459009af02e', N'Members.Label.Facebook', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7af03434-242d-47b5-a091-a459009af04f', N'Members.Label.RememberMe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8eba43a4-c6b3-4f0d-bd60-a459009af074', N'Members.Label.Users', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5158529b-129a-415c-a74d-a459009af09a', N'Members.Label.DateJoined', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1a1bfd6c-37dc-4cb7-9c20-a459009af0bb', N'Errors.NoAccess', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3f818a7d-0469-4469-b981-a459009af0e0', N'Errors.GenericMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'685397c0-ab4e-40b3-a1ea-a459009af106', N'Errors.NoPermission', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6382652b-3300-490c-b17d-a459009af126', N'Topic.Notification.NewTopics', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'962a90dc-0f01-41b2-9e38-a459009af14c', N'Topic.Notification.Subject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'669074bf-04fa-4023-b4d6-a459009af171', N'PM.SendingToQuickly', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bdcdcc71-ccc8-4239-8412-a459009af197', N'PM.SentItemsOverCapcity', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0b16a9db-610d-42ca-9ed7-a459009af1bc', N'PM.ReceivedItemsOverCapcity', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1c929c0-523a-48ab-b652-a459009af1dd', N'PM.MessageSent', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3b7fb9ea-a132-451e-b8ae-a459009af203', N'PM.UnableFindMember', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'96afb727-c202-4347-bbf8-a459009af224', N'PM.TalkToSelf', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b9bb75b5-bd24-4ce9-8cb4-a459009af249', N'Post.Updated', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'336ad998-d438-4f42-bff1-a459009af26f', N'Topic.Deleted', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd5a87457-593b-4ce3-8a61-a459009af28f', N'Post.Deleted', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'22331081-599c-443c-bf29-a459009af2b5', N'Post.Notification.NewPosts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd5320969-b599-4108-8d23-a459009af2d6', N'Post.Notification.Subject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'468b68a2-229b-4f9c-97e4-a459009af2fb', N'Report.ReportSent', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd0858b00-0f22-4a74-afc3-a459009af321', N'Members.NowRegistered', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0c930b01-a2ef-41ea-af3a-a459009af342', N'Members.NowRegisteredNeedApproval', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'97be0ecc-24dd-41d6-ab55-a459009af367', N'Members.NowLoggedIn', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ab59899b-4710-4642-918f-a459009af38d', N'Members.Errors.PasswordIncorrect', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dff84867-d7a8-47e7-ac9f-a459009af3b2', N'Members.Errors.PasswordAttemptsExceeded', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dc269c1a-ce25-4f4c-8287-a459009af3d8', N'Members.Errors.UserLockedOut', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ceeb61f0-6aa7-46a3-8b83-a459009af3f8', N'Members.Errors.UserNotApproved', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2e1bf2f9-5b9e-44b8-a44d-a459009af41e', N'Members.Errors.LogonGeneric', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9beb633e-a51a-4271-b419-a459009af443', N'Members.NowLoggedOut', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6ba0e821-e5ee-492a-aab2-a459009af464', N'Member.ProfileUpdated', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b847c909-d585-4890-a299-a459009af48a', N'Language.Changed', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6402e1dd-aae8-4db9-aef1-a459009af4af', N'Rss.LatestActivity.Title', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8da60aa0-d22d-4f08-b1f7-a459009af4d5', N'Rss.LatestActivity.Description', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1c6311f5-5699-4703-a353-a459009af4f5', N'Errors.NothingToDisplay', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dfeb3b9a-5e6e-481f-8bd2-a459009af51b', N'Rss.Category.Title', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b56e1377-6ede-4bff-a773-a459009af540', N'Rss.Category.Description', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'67b237f4-74c4-45d3-b53e-a459009af561', N'Report.Reporter', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a50971c5-8b08-4ffb-9e93-a459009af582', N'Report.MemberReported', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3c539005-c66e-47b1-9834-a459009af5a8', N'Report.Reason', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ac6ffd83-d3e9-4d39-8e76-a459009af5cd', N'Report.MemberReport', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e6924af3-262e-420b-ae81-a459009af5f3', N'Report.Admin', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6b0ddde0-1085-4758-8d97-a459009af618', N'Report.PostReported', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5059f483-0c4c-4959-aa45-a459009af639', N'Report.PostReport', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2dd5218e-acc3-4af7-87c4-a459009af65e', N'Badges.UnableToAward', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd543f368-413b-4ed0-a28a-a459009af684', N'Badge.UnknownBadge', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2c6fa771-7c53-4513-a8e7-a459009af6a5', N'Badge.BadegEnumNoClass', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'864ef30f-0871-44fb-88ef-a459009af6ca', N'Members.Errors.DuplicateUserName', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'61ab95df-0b67-45a9-a09b-a459009af6f0', N'Members.Errors.DuplicateEmail', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4198f9e8-09b4-440d-8bdf-a459009af711', N'Members.Errors.InvalidPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ab560529-06ae-46a1-be6a-a459009af736', N'Members.Errors.InvalidEmail', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'060d8dc9-37a0-46b8-89bc-a459009af760', N'Members.Errors.InvalidAnswer', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2350d11b-ef14-4fb1-ae81-a459009af786', N'Members.Errors.InvalidQuestion', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'82c15b34-dd86-4a5a-a75f-a459009af7ab', N'Members.Errors.InvalidUserName', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd97b8af3-918f-4299-9253-a459009af7d1', N'Members.Errors.ProviderError', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'019b26a5-5936-4de7-a21e-a459009af7f6', N'Members.Errors.UserRejected', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cb7085d6-482a-4877-87cd-a459009af817', N'Members.Errors.Unknown', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'86bb6b46-18ad-41dc-a83b-a459009af83d', N'Members.NewMemberRegistered', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'014e81a0-a669-4222-b693-a459009af862', N'Members.Admin', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3ad03914-9d3f-49a9-9a48-a459009af888', N'Members.NewMemberSubject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c7f69d58-b263-43dc-8aed-a459009af8ad', N'Members.CantUnlock', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fae48672-d1fb-4a3a-a4b6-a459009af8ce', N'Members.ForgotPassword.Email', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'59fe33fe-7c40-4b30-9d1b-a459009af8f3', N'Members.ForgotPassword.Subject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'08edf000-2b09-48af-b59e-a459009af919', N'Members.ForgotPassword.SuccessMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cb91524d-f47a-4bd7-85cd-a459009af93a', N'Members.ForgotPassword.ErrorMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b0402ea8-5136-4c85-b4c6-a459009af95f', N'Members.ChangePassword.Success', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1fc602e0-9ad5-4c43-a43f-a459009af980', N'Members.ChangePassword.Error', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'495e3f01-c082-4bf6-9911-a459009af9a5', N'Buttons.ChangePassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'208b2d04-7c8e-48f1-a440-a459009af9cb', N'Members.ChangePassword.Title', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4b244686-8188-4d86-8e9c-a459009af9ec', N'Members.ChangePassword.Text', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0f1e76d2-5ea1-48d4-a33a-a459009afa11', N'Members.ChangePassword.Link', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a7e6de7e-9fd6-432c-946b-a459009afa37', N'Members.ForgotPassword.Title', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ffb851af-47f6-4a5a-93f3-a459009afa5c', N'Buttons.ResetPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'60e8071c-8067-4bf1-90e6-a459009afa7d', N'Members.ForgotPassword.Link', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2ea74c26-e080-49b3-a7db-a459009afaa3', N'Members.Label.CurrentPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'92ca74aa-bc2e-43be-a3cd-a459009afacd', N'Members.Label.NewPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1cb01962-9514-4417-961b-a459009afaf2', N'Members.Label.ConfirmNewPassword', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0ae84c7e-2cfd-46b8-9094-a459009afb13', N'Members.Label.EmailAddressBlank', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'22b77c2d-5db2-4bd6-882b-a459009afb39', N'Activity.Badge', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cd3d7e4c-ef64-4f99-a39d-a459009afb5e', N'Activity.UserAwardedBadge', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'057dfe95-5657-4d09-b4ee-a459009afb84', N'Activity.UserJoined', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1aeffa8f-2664-43e3-a5c1-a459009afba9', N'Activity.ProfileUpdated', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b84f1bec-6608-4bb7-92c0-a459009afbca', N'Topic.Label.SubscribeToTopic', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f68ba8d2-0776-4893-a306-a459009afbef', N'Badges.PageTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2377b589-f1d4-4ab0-9fa5-a459009afc15', N'Layout.Nav.Badges', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0ac84ba9-ec34-4d4e-8dfe-a459009afc3a', N'Topic.Label.TopicTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fbe7177b-bff2-42b0-bd7a-a459009afc5b', N'Poll.Button.Create', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b07130f2-1e3e-49ed-b90e-a459009afc81', N'Poll.Placeholder.TypeAnswerHere', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'afb60ff7-173d-4ee0-8bc5-a459009afca6', N'Topic.OptionsHeading', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b93a675f-b249-4d2a-8e51-a459009afccc', N'Poll.Button.Remove', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4a29de34-704d-4b1b-ad84-a459009afced', N'Poll.Button.Vote', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9396f702-ecf8-4bfb-b153-a459009afd12', N'Error.WrongAnswerRegistration', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ef170218-1131-4ad4-8c91-a459009afd38', N'Members.LoginOrText', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6d6295a4-f8cb-4359-8409-a459009afd5d', N'Facebook.Error.EnabledButNotAddedKeys', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'64dc83f1-bc65-4bfe-aa78-a459009afd83', N'Members.Profile.IsSocialAccount', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1594e56c-976d-4cec-91f3-a459009afda8', N'Date.JustNow', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'db10d724-cda7-4f3e-af0d-a459009afdce', N'Date.OneMinuteAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c57ce655-1171-4cf7-94bf-a459009afdee', N'Date.MinutesAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'20d34916-18af-41fe-89dd-a459009afe14', N'Date.OneHourAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5121d533-301b-4caf-a56a-a459009afe39', N'Date.HoursAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dcc71740-72af-4647-bc3b-a459009afe5a', N'Date.Yesterday', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c89cded3-d9dd-4532-859c-a459009afe80', N'Date.DaysAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd6813a20-cb9c-42b9-ab37-a459009afea5', N'Date.WeeksAgo', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3fe745db-c7a6-4820-8fa1-a459009afecb', N'Side.Search', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'80fb8e31-95a4-4264-9669-a459009afef0', N'Search.NoResults', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'addae6a6-55e0-4d7d-9420-a459009aff16', N'Topic.CommentsDetails', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f006aeb4-5a83-49bf-ab11-a459009aff36', N'Members.DeleteAllPosts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b3f01bf6-7d04-4297-b6d4-a459009aff5c', N'Buttons.CreatePost', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'50ef603d-919d-46bd-ad6c-a459009aff81', N'Topic.Label.Category', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5bd5bedf-e3bc-45a0-a8b5-a459009affa7', N'Editor.NeedHelp', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9e13720a-695d-4d4f-9d41-a459009affd6', N'Members.BanUser', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5faeb278-be61-4221-9184-a459009afffb', N'Members.UnBanUser', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a8a46f83-b7d3-4738-9427-a459009b0021', N'Errors.NoPermissionPolls', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8a01dcce-1904-4652-88c5-a459009b0042', N'Topic.ShowMorePosts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eeeba585-dc44-4dd4-be9d-a459009b0067', N'Topic.ShowMorePostsLoading', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd152d108-b990-4691-ad7d-a459009b008d', N'Topic.AlreadyAnswered', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ae191b92-2a4c-4196-bfd9-a459009b00bc', N'Topic.Comment', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd50cc5df-3165-4dc7-a9ec-a459009b00dc', N'Stats.FooterActiveUsersText', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'48dc2aac-d5fd-49cb-ba1d-a459009b0102', N'PostFilter.OrderBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'10fefe34-1e0a-4fdd-b200-a459009b0127', N'PostFilter.Standard', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ba78667-4410-43d0-b3c6-a459009b014d', N'PostFilter.Newest', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'40dda628-d0c1-45ad-bf47-a459009b0172', N'PostFilter.Votes', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'034aecf3-59dc-4dc2-ae5f-a459009b0193', N'PM.NewPrivateMessageSubject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c5a14b20-2000-48ec-853d-a459009b01b9', N'PM.NewPrivateMessageBody', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5c745572-776c-4314-bae1-a459009b01de', N'Post.DeleteConfirmation', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'03d958b5-8562-4537-bd94-a459009b0204', N'Category.SubCategoriesHeading', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'50ee5adb-9884-4f05-b45b-a459009b0229', N'Category.AllCategories', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7ea4204a-c3f7-4232-ab07-a459009b024a', N'Category.MostRecent', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1c32c37c-a71a-4534-93c4-a459009b026f', N'Members.LogonFacebookButton', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5de47935-26d8-45d9-9b12-a459009b0295', N'Members.LogonGoogleButton', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2e96cd85-5f73-4b90-9309-a459009b02ba', N'Members.LogonYahooButton', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'77c3b3a2-f88e-44b4-9aed-a459009b02e0', N'Members.LogonTwitterButton', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5c392055-ef77-470a-83e5-a459009b0305', N'Twitter.Error.EnabledButNotAddedKeys', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e4149b35-edec-4b6c-96ed-a459009b0326', N'Error.EmailIsBanned', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'915caaa8-3f6c-4d8e-8929-a459009b034c', N'Post.FilesUploaded', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'227d9270-146a-4bad-bff3-a459009b0371', N'Post.Attach', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f2514fd9-c8e5-4309-95f2-a459009b0397', N'Post.Upload', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f1611c47-b109-4bdc-aff9-a459009b03bc', N'Post.UploadBannedFileExtension', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0a8151b3-b0d1-4fb0-96a0-a459009b03e2', N'Post.UploadFileTooBig', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e0bb5fa2-e9ce-4992-a0ff-a459009b0407', N'File.SuccessfullyDeleted', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b05f71ca-ffe3-44fc-823c-a459009b042d', N'Members.MemberEmailAuthorisationNeeded', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4b079356-eef7-4650-a4c4-a459009b0452', N'Members.MemberEmailAuthorisation.EmailBody', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8ece05fa-406a-4d4d-acfb-a459009b0473', N'Members.MemberEmailAuthorisation.Subject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3fd10c3c-81b3-436f-bc6f-a459009b0499', N'Members.NowApproved', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'325c170c-74de-4942-93b5-a459009b04be', N'Members.MemberEmailAuthorisationNeededMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bd442c6d-00ed-4bbc-a7ac-a459009b04e4', N'Members.MemberEmailAuthorisationResend', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3e8f104b-4bce-4ea5-99b3-a459009b0509', N'Members.MessageMe', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'42335278-75b0-459b-a558-a459009b052f', N'Confirmation.DeleteMembersPosts', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'82cdd5ef-aa62-4d3d-bfda-a459009b0554', N'Moderate.AwaitingModeration', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1a3830d9-58ed-4418-825a-a459009b057a', N'Badges.AwardsPoints', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3ff94753-ac8c-4c06-b74f-a459009b059f', N'Language.Change', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ba2df484-7771-4616-8479-a459009b05c5', N'Post.Quote', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'20475191-89f8-4466-8954-a459009b05ea', N'Members.Label.UploadNewAvatar', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9e4585b1-3fd5-4eeb-9b6a-a459009b0610', N'Member.HasNewPrivateMessages', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'abfa1a7b-6fc5-4841-9ce8-a459009b0635', N'Badge.AuthorMarkAsSolutionBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4e85c5d3-4394-4e0d-9dff-a459009b065b', N'Badge.AuthorMarkAsSolutionBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'391db605-d7cc-4acb-b31e-a459009b0680', N'Badge.UserVoteUpBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4f9b9bf2-9929-4703-8d40-a459009b06a6', N'Badge.UserVoteUpBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dc615aae-d557-4257-b71f-a459009b06cb', N'Badge.PostMentionsUmbraco.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd51dcfa0-aff2-434d-936a-a459009b06f1', N'Badge.PostMentionsUmbraco.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2aed6dfe-7015-48c6-8456-a459009b0716', N'Badge.PosterVoteUpBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bdff4ed1-94e0-4da2-b000-a459009b073c', N'Badge.PosterVoteUpBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b11d51f0-ebe0-46a3-a9ac-a459009b0761', N'Badge.PosterMarkAsSolutionBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f41b11eb-3688-425f-b531-a459009b0787', N'Badge.PosterMarkAsSolutionBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'54e8fa4b-08f7-40a2-b570-a459009b07ac', N'Badge.PadawanBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f22330bf-c413-4222-a668-a459009b07d2', N'Badge.PadawanBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b9c3d6d7-d1f7-4881-81b4-a459009b07f7', N'Badge.OneThousandPoints.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd425918f-872c-404d-a90f-a459009b0821', N'Badge.OneThousandPoints.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'90e0d4f7-90bf-4dc4-a57d-a459009b0842', N'Badge.MemberForAYearBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8b73217b-eafe-4d6c-a833-a459009b0868', N'Badge.MemberForAYearBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4cc15136-b055-47ae-a4e9-a459009b088d', N'Badge.GrouchBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b7282fe3-b9b0-4f1f-943a-a459009b08b3', N'Badge.GrouchBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b376cf30-beab-4479-91f3-a459009b08d8', N'Badge.JediMasterBadge.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f2e65866-6bc9-4709-a5bb-a459009b090c', N'Badge.JediMasterBadge.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a4b17fad-4c80-4ce4-a0fb-a459009b0931', N'Badge.Photogenic.Name', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'631a696d-02f5-4d8d-83df-a459009b0957', N'Badge.Photogenic.Desc', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b8229740-a3fb-4812-a322-a459009b0986', N'Site.MvcForum', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ce6e8b2-ea28-4f2a-b88d-a459009b09ab', N'Layout.Nav.Utilities', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'302cab8c-f3df-4ffb-a871-a459009b09d1', N'Side.Search.SearchFor', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'933b1844-798e-4a21-ab4e-a459009b09f6', N'Side.Search.Go', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5ea62c47-4334-4824-8884-a459009b0a1c', N'Topic.IsSticky', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2f7882a1-f8d4-4873-a735-a459009b0a41', N'Topic.IsSolved', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'21c7cd9e-ccb6-4616-91db-a459009b0a67', N'Topic.Category', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'abb1c539-d45d-4739-967d-a459009b0a8c', N'Topic.IsPoll', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fac93fa9-9c25-4bd7-9daf-a459009b0ab2', N'Topic.LastPost', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1217a25-aa4a-4959-9142-a459009b0ad7', N'Topic.HotTopics', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3d79e87c-d669-4886-a2e5-a459009b0afd', N'Notifications.NoActiveMembers', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f3ec25bc-85d9-4939-9746-a459009b0b22', N'Post.LikedBy', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ddcb7ef-8fc4-4554-a4f7-a459009b0b4c', N'Post.Browse', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'def3a939-b778-4a8d-b70d-a459009b0b72', N'Post.AttachedFiles', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c181fccd-46e2-4ebb-a285-a459009b0b97', N'SubNav.Latest', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0cd719de-146d-4c36-b868-a459009b0bbd', N'SubNav.Following', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c2fb316a-9bb0-4efb-9124-a459009b0c08', N'SubNav.PostedIn', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'224d2131-49fc-411e-b300-a459009b0c35', N'SubNav.Favourites', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'37a779e3-2874-48e8-a839-a459009b0c60', N'Favourites.PageTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'86d49285-ae8d-47fa-8f64-a459009b0c8f', N'Favourites.NoMemberFavourites', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3a9e5b03-66db-4851-a301-a459009b0cc1', N'Following.PageTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'60b67b0a-8565-49c3-9b1d-a459009b0cf4', N'Following.Categories', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'24b53ad3-c9c8-4707-ac8d-a459009b0d26', N'SubscribedCats.NothingToShow', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ddf7665a-1cc8-4ab9-8929-a459009b0d52', N'Following.Topics', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'52381d43-f19b-4111-94ed-a459009b0da2', N'SubscribedTopics.NothingToShow', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'533b8a47-9269-4038-a2f2-a459009b0de6', N'PostedIn.PageTitle', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bf791b07-8c46-4a9c-9fac-a459009b0e13', N'Topic.Label.Tags', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b0392fdb-1038-4940-a082-a459009b0e37', N'Topic.Label.UploadFiles', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ad106c69-e084-4fc2-ab7e-a459009b0e5e', N'Search.Searching', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c5dc8279-9427-42ff-a81a-a459009b0e83', N'Search.InTopic', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e5d164a6-ead5-4a4a-9d5f-a459009b0eaa', N'Members.SrubAndBan', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3a5ae5ed-cda1-47b8-b177-a459009b0ed0', N'Confirmation.SrubAndBan', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9b3284be-17cc-40a9-9f14-a459009b0ef5', N'Admin', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1bf1adbb-6a3f-4fb9-96db-a459009b0f1c', N'Members.SuccessfulSrub', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2ad1a810-eff3-41a0-ac2a-a459009b0f45', N'Post.Favourite', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9fe9ffeb-b432-4f8e-952d-a459009b0f6a', N'Post.Favourited', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5d75fd16-240b-49c5-98e2-a459009b0f90', N'Members.NowBanned', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'60ad2931-209d-48b6-8593-a459009b0fb8', N'PM.AboutToExceedInboxSizeBody', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fd890994-2283-4cec-910e-a459009b0fe8', N'PM.AboutToExceedInboxSizeSubject', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'875d23e0-0800-4200-a864-a459009b100f', N'PM.NewPrivateMessage', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd7ebb29d-73d4-4823-a6ec-a459009b1035', N'PM.LastActivity', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fc4f0774-430a-4f84-96b6-a459009b1061', N'StopWord.Error', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7622afc0-6cd5-494b-a202-a459009b108b', N'Post.Permalink', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'893daf7c-fa1b-49a9-872e-a459009b10b6', N'Members.Profile.LastOnline', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0250dac9-6b5c-4c9c-8f04-a459009b10e4', N'Members.UnableToGetEmailAddress', NULL, CAST(N'2015-03-12' AS Date))
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'80725f6c-325d-423c-9631-a459009ae06a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd19929e5-1bd3-4063-bcd6-a459009ae04e', N'Register')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c8901dad-64c0-4bab-be55-a459009ae094', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2f20862d-def9-42df-99b9-a459009ae07d', N'Log On')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'83b73891-d05a-44cf-9fd9-a459009ae0b5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bf3e5149-4f05-4163-b0eb-a459009ae09e', N'Activity')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'74da95f1-83b2-4c94-b5a0-a459009ae0db', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'56e15d38-ea15-40e4-84b6-a459009ae0c3', N'Leaderboard')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c80fb90b-e9d8-470d-b167-a459009ae0fb', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b4525094-9fe8-443d-ba5e-a459009ae0e4', N'Home')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ac1905ac-7a3a-4350-ab8e-a459009ae11c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'16b73855-a676-4baa-aa5e-a459009ae105', N'Admin')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f85c68b7-9df8-4e4d-8b1a-a459009ae13d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'63f15d5e-89de-42f5-8fe6-a459009ae126', N'New Discussion')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd0e74dd7-6cfc-409f-94d9-a459009ae15e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3c902011-b582-4454-8f62-a459009ae146', N'Powered by ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b81b71c3-fbb0-4b50-9503-a459009ae183', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1d574c68-30ce-4ff7-8fce-a459009ae16c', N'Votes')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e696f70c-82fd-4bff-a189-a459009ae1a4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd7027863-ee13-42d6-aff4-a459009ae18d', N'Answers')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0deca906-fc05-4f13-bf79-a459009ae1c5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'99a4d273-29e7-4a19-bbf5-a459009ae1ae', N'Started {0} by {1}')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6b4f7c0c-afd2-4f3b-93d7-a459009ae1e6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bebc93f7-46b9-487c-b746-a459009ae1d3', N' in ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fc54c082-2608-45f0-b296-a459009ae20b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4df7e7a3-646a-48d9-ac9e-a459009ae1f4', N'Latest By')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e9ccfdb9-150a-4fa0-bd34-a459009ae22c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a6b26f4d-d299-4025-9df0-a459009ae215', N'Views')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b9fd7435-8d90-487b-9d0a-a459009ae24d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e9d3cb9d-cbab-4a3f-8bb9-a459009ae23a', N'Vote Up')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7ea42590-b823-4f90-b7d7-a459009ae26e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0ebfdcd5-009f-4faf-b3af-a459009ae25b', N'Vote Down')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4d16ccd3-298a-4314-a137-a459009ae293', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'42c8d675-b05f-45e0-87b1-a459009ae27c', N'Is Solution')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'041fa728-8649-4cc2-be79-a459009ae2b4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd0fdedc3-9fac-4985-88de-a459009ae29d', N'posted this')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'abaaaadb-5773-4a75-a029-a459009ae2d5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'33b58426-8aff-49e1-8c1c-a459009ae2bd', N'Posts')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'352d17ad-9531-4b89-ad24-a459009ae2f6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2a7f1361-d3a7-4350-92e3-a459009ae2e3', N'Points')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6e4c705d-f2d0-4b42-8c48-a459009ae316', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a33f868a-565c-4199-a954-a459009ae2ff', N'Last edited')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'789a841b-71ef-445d-9186-a459009ae33c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4a07d680-b7b2-4eb9-81d9-a459009ae325', N'Report')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b3e67f7a-8201-41f1-8643-a459009ae35d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3e941756-572c-4304-b057-a459009ae345', N'Edit')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'13643cd6-efe9-4e4c-a366-a459009ae37e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dc9ffb08-1379-44a4-b25c-a459009ae36b', N'Delete')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd561dfd4-7a01-4e7f-81ae-a459009ae39e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7f79f439-5df2-49ab-9954-a459009ae387', N'Log On')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6905e290-a09c-40cb-877d-a459009ae3bf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1adfdb83-5bd3-4a11-b02e-a459009ae3ac', N'Log Off')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9645d47e-43a0-4ac7-8794-a459009ae3e5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8c5bdd6b-3996-43e0-b523-a459009ae3cd', N'Please Wait...')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bb94ba6a-0f1e-4504-b920-a459009ae406', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9d7b3d49-4a46-4c73-97f6-a459009ae3ee', N'Discussions Tagged With: ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3c5ef734-ee25-4627-b80d-a459009ae42b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e55a4027-dbcc-4683-9328-a459009ae40f', N'Discussion Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f888caa8-16b1-4e38-9db8-a459009ae44c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'38b0442e-09fa-438b-be0c-a459009ae434', N'Subscribe')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a8f5e787-c219-482f-b36b-a459009ae46d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c2b615ad-af32-4f10-8e0e-a459009ae455', N'Unsubscribe')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'92c1a63f-a0ba-4076-abc3-a459009ae492', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7a83d8a4-3103-4999-a95d-a459009ae47b', N'Topic Is Locked')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'71b61ef3-ced1-48c7-a3ae-a459009ae4b3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'754f6314-7054-4f30-b0b3-a459009ae49c', N'Create Discussion')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'22215675-d38f-42ec-9849-a459009ae4d4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'76a3811c-85eb-4f55-9682-a459009ae4bc', N'Tag this topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6721270e-1912-4ddd-97e3-a459009ae4f5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a3b1af05-2671-4adc-b119-a459009ae4e2', N'Popular Tags')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'22f1c346-c82f-4819-9424-a459009ae51a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'366d22bb-6aa4-4ee9-bd63-a459009ae503', N'Our {0} members have posted {1} times in {2} discussions')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6bde765c-66e6-4358-a71d-a459009ae53b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0f06ed24-1fbc-4955-8b5f-a459009ae523', N'Latest Members:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ec16440a-af86-491a-8755-a459009ae560', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fca1ce67-b14f-4a6e-9a01-a459009ae549', N'Message: ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9eacabc5-a46e-48b1-95ef-a459009ae581', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'48db0412-6e5d-4c81-adce-a459009ae56a', N'From: ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8a8c7bbc-4fe4-43f9-b0c7-a459009ae5a2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a6ea9832-2f40-4298-98f8-a459009ae58b', N'Sent:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8e981c7b-cf81-4605-9daa-a459009ae5cc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'85166b23-4707-43ed-9afd-a459009ae5b0', N'Back To Inbox')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8f6fc690-f80a-4be1-811f-a459009ae600', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0494223e-4c5c-4e35-91ac-a459009ae5e8', N'Reply')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8661e51d-7431-44d9-b150-a459009ae621', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e169a0a0-7bab-49c1-b6c7-a459009ae60e', N'Sent Private Messages')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2ba2f96e-6b7a-4fd9-bc2d-a459009ae641', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'624f742d-6624-43da-8163-a459009ae62f', N'To')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8a5fb21c-de48-4d26-9113-a459009ae667', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0a3c2812-6c6a-4f77-9e90-a459009ae64f', N'Subject')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'096a1da0-7b96-43fe-97c2-a459009ae688', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2a643934-05de-4b5b-b0f5-a459009ae670', N'Date')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b5c683ec-372b-4f27-89d2-a459009ae6a9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'be0ecc8a-fbf5-414a-89ba-a459009ae691', N'Read')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1ff3238c-a865-4349-983f-a459009ae6c9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'aa22e80d-4b66-4bd2-b022-a459009ae6b7', N'Delete')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1e04f876-61a3-49c3-b4cb-a459009ae6ea', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'11359610-cc19-4d90-a0ff-a459009ae6d7', N'You currently don''t have any private messages')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6a00bb4a-f2ba-4f1f-bf95-a459009ae710', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6e58b86d-3165-46d9-b455-a459009ae6f8', N'Create')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b54fa170-4ff6-46c9-a3a8-a459009ae735', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f9a1d3c1-f219-46e2-8e87-a459009ae719', N'Received Private Messages')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4e1ea445-bc87-4401-807e-a459009ae75b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dd6a4ad5-08a9-4d62-b5b8-a459009ae743', N'Create Private Message')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'510c6e1d-3ff2-4c0a-a33e-a459009ae77b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3237ce54-1999-442d-83c1-a459009ae764', N'Send')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5d2aef89-36a6-46be-8f37-a459009ae79c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dfde32cb-5c47-457d-8d81-a459009ae78a', N'Original Message')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b366105c-e32a-4b10-a91f-a459009ae7bd', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'67cb5b33-6fb0-4b79-959b-a459009ae7aa', N'Send')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c78385d6-2f9c-432f-b59d-a459009ae7e3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3657cf09-b923-498e-a189-a459009ae7cb', N'Report Post By: ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2c3601dd-4456-4f71-bdb0-a459009ae803', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'94ee66f4-155d-4886-af64-a459009ae7ec', N'Edit')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8496b3c4-52d6-445c-8a60-a459009ae829', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9a259ea1-ae5b-4721-bc75-a459009ae811', N'This Weeks High Earners')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2de910f0-fdff-439b-9255-a459009ae84a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3031280f-0997-4b92-9196-a459009ae832', N'My Tools')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a5ab5f5b-ef67-4e06-84ad-a459009ae86b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2fe8d51d-291b-4373-a02b-a459009ae853', N'Private Messages')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'704fbef8-1fd0-479d-9e12-a459009ae895', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'89aaba57-e9e9-4819-86be-a459009ae874', N'Search Members')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a91cc3c0-2bb9-4ca3-938c-a459009ae8b6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'222a157d-14c7-4370-b34c-a459009ae89e', N'Search')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'17331c5b-4873-45db-b722-a459009ae8d6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'23a89d18-d0dc-4d31-835e-a459009ae8bf', N'Users')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e8e8e64f-ee5b-4072-97f6-a459009ae8fc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'03bfd327-b36a-4b1a-ad3c-a459009ae8e4', N'Points')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8f529db6-785e-449c-b7e0-a459009ae91d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f3aeda23-9987-484b-87b7-a459009ae905', N'Date Joined')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5fac3c9a-281d-4707-8352-a459009ae93d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b0125c87-409f-46d4-9641-a459009ae926', N'Report ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b3537c5f-48e4-4caa-88a7-a459009ae963', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1cfba3ad-4cec-4501-97d7-a459009ae94c', N'Register')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'012d3f9c-cc6c-4402-8422-a459009ae984', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b5400b20-7612-49c5-b154-a459009ae96c', N'You are already registered? Why would you want to do it again?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a35dc13f-02b0-445e-873d-a459009ae9a9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8a44f2f0-bfa1-41b3-a8b8-a459009ae992', N'Please enter your user name and password. Or {0} if you don''t have an account')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4e436a68-32ac-4d70-a2bf-a459009ae9ca', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'213b3bdd-618d-4a97-ba08-a459009ae9b3', N'Log On')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f2c370cf-12d3-4ffe-81f0-a459009ae9eb', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'59e89c6c-f2aa-4d38-bcbf-a459009ae9d3', N' Profile')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a48019ba-1d4e-41cb-999e-a459009aea10', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'993133af-6436-4bd1-bec5-a459009ae9f9', N'Joined:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'207878c1-328d-4592-9f71-a459009aea31', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'129be9d0-e715-492c-a985-a459009aea1a', N'Posts:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fe4202a0-78d9-4fb3-bb4e-a459009aea57', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f7961d70-6497-4b3a-8c6c-a459009aea3f', N'Points:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c7dc25da-653c-4a98-a160-a459009aea7c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6a662b0c-edaf-4ddc-86ce-a459009aea65', N'Report')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'66fe76a7-0f35-4400-ab86-a459009aea9d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'487023b9-bffc-4e8a-a165-a459009aea86', N'Age:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1f28fd17-9e03-44cf-8b4f-a459009aeac3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'895c0fb7-fe0c-4b4a-ae9a-a459009aeaab', N'Location:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2e6e4247-c6f2-4a6a-8a4d-a459009aeae3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f4c5a81a-3713-4dbb-abb7-a459009aeacc', N'Website')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'261b90ed-2713-46a0-9d5d-a459009aeb09', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'88ed7322-4665-4b51-913a-a459009aeaf1', N'Twitter')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b6cfa63d-f3ef-4648-a8a8-a459009aeb2a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7cf4c924-5fed-4cf8-b923-a459009aeb17', N'Facebook:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd70da57a-e950-435b-a17f-a459009aeb4a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3fae9fc8-746c-4beb-946c-a459009aeb38', N'Discussion Activity')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'77bf982c-e95b-42c7-8e38-a459009aeb70', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'701ffec4-f0f5-4605-8998-a459009aeb59', N'Please Wait...')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'daea494b-62b9-4320-9e82-a459009aeb91', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a5f671b1-3ca5-4f25-b816-a459009aeb7e', N'Badges')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bceed8dc-0b84-490e-a825-a459009aebb6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ba8fa9e4-df60-41bf-aa39-a459009aeb9f', N'Edit Profile')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fa0a7380-9af7-484a-8f22-a459009aebd7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3524d239-bb58-47df-9a30-a459009aebc0', N'Save')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'053d6ec2-24b8-4a59-b487-a459009aebf8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a95255f7-4c13-4bcb-b80c-a459009aebe5', N'Edit Member')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'690698ee-78a0-46da-acb9-a459009aec1d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2c468faf-893b-42d3-822e-a459009aec06', N'This Weeks Stars')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'84c875d3-391b-401a-a5c4-a459009aec3e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'84a29699-e152-48eb-885a-a459009aec27', N'This Years Rock Stars')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'387cc437-a671-4670-81be-a459009aec64', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9f26c6bc-67e8-43fe-99b5-a459009aec4c', N'Global Leaderboard')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'93157c69-102a-44fc-ad55-a459009aec85', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'be1fec3c-9ad3-442b-8149-a459009aec6d', N'Latest Discussions')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8d7a423e-4f0a-43f4-af8c-a459009aeca5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9512b8ad-6359-43dc-92ad-a459009aec8e', N'Rss')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'06c0e3ac-bfe5-45ac-b5b8-a459009aeccb', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7eae16ca-86db-413f-9f7f-a459009aecb3', N'Activity')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd94f23e6-3642-4633-8522-a459009aecec', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd1847c2b-3857-456e-8cbc-a459009aecd4', N'Subscribe Via Email')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd1f4378e-9169-4218-93bf-a459009aed11', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'188273c8-bc42-48ba-ba45-a459009aecfa', N'Unsubscribe From Emails')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7bea772c-719b-4aac-baea-a459009aed32', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2d5e0d16-2aa0-44d6-b7fb-a459009aed1b', N'Subscribe')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0af6d885-b992-4a97-9c28-a459009aed57', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7cc043aa-9d3f-44ff-81db-a459009aed40', N'UnSubscribe')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fdc69b16-4b64-4c79-91ce-a459009aed78', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c7852cf0-4dd4-4326-8ae6-a459009aed61', N'Currently no discussions in this category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cc3967df-1730-4570-8693-a459009aed9e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'00bdb12f-899e-4d21-ac17-a459009aed86', N'Categories')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7a932f21-c529-4ee4-8bf5-a459009aedbf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'67a95f08-8131-45f1-bc74-a459009aeda7', N'Recipient Username')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6096a15d-f706-4fa4-899e-a459009aede4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6e35a0f7-7ddb-47b4-8648-a459009aedcd', N'Subject')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'63820892-805b-4ca5-9718-a459009aee0a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'104a0aa5-409b-4988-ad73-a459009aedf2', N'Topic Name')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a2d3591d-2a9f-4006-94a1-a459009aee2f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'eafc8c7d-eae3-4fab-9c85-a459009aee13', N'Is Sticky Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'488dc338-ce68-4028-8cb8-a459009aee50', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7ba308d2-4137-48c1-9c37-a459009aee38', N'Lock Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd982ff48-8cfb-47df-a03e-a459009aee75', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6d904239-a741-4414-860a-a459009aee5e', N'Topic Category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd44069f7-6730-42f0-b7db-a459009aee96', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd4b29ac7-8d8f-44cb-8512-a459009aee7f', N'Username')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'345c92df-1266-45e2-995a-a459009aeebc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c2292b2f-106c-44d9-b9bc-a459009aeea4', N'Email address (Used by Gravatar to show your Avatar image)')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3a44b3bd-35b9-448e-bfa9-a459009aeee1', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8ff96bd8-8a16-4788-a1a5-a459009aeeca', N'Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4cdbd5c8-cd0c-461d-b486-a459009aef02', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6d41c65d-85e0-40cc-b702-a459009aeeeb', N'Confirm Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8249e5bc-9b5d-4604-b982-a459009aef23', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'80c3d2dd-69d7-44f5-9684-a459009aef10', N'User is Approved')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3a7143b7-047e-4e97-a0b2-a459009aef48', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'cdc480a3-f85b-494e-b3cb-a459009aef31', N'Comment')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'49f535ff-4baf-4772-ab0e-a459009aef6e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'42cd3963-9b6d-46f0-ae61-a459009aef56', N'Roles')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'036e96bd-05ce-4426-b967-a459009aef8f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1a6ffc4d-ed52-4f40-b6a4-a459009aef77', N'Signature')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2c35f4a4-4397-448c-8989-a459009aefb4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'91a5615f-22fb-4459-b16b-a459009aef9d', N'Age')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'912aab8b-0a97-48b7-a598-a459009aefda', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1131652c-7a46-4c09-b15d-a459009aefbe', N'Location')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0fb39ec9-a732-4812-baed-a459009aeffa', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f9fad577-dadf-430a-a646-a459009aefe3', N'Website')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a81c503b-67c1-4e5a-b9a1-a459009af020', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'435c70cf-cbd1-4631-99af-a459009af009', N'Twitter Url')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2368f8be-b5b8-4aca-b807-a459009af045', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9fa02715-fbbe-48f5-bd0a-a459009af02e', N'Facebook Page')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd50b951a-b872-40b3-9f81-a459009af066', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7af03434-242d-47b5-a091-a459009af04f', N'Remember Me?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e1298ceb-650a-4dec-b9c5-a459009af08c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8eba43a4-c6b3-4f0d-bd60-a459009af074', N'Users')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9dffc2f4-b4b2-4355-b7f7-a459009af0ad', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5158529b-129a-415c-a74d-a459009af09a', N'Date Joined')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd7ec408e-5fc2-4c34-8211-a459009af0d2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1a1bfd6c-37dc-4cb7-9c20-a459009af0bb', N'No Access')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2b5597da-e42b-4e84-ad41-a459009af0f8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3f818a7d-0469-4469-b981-a459009af0e0', N'Sorry an error occured')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bfca40bf-8d6c-4cf6-9a44-a459009af11d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'685397c0-ab4e-40b3-a1ea-a459009af106', N'You do not have permission to perform this action')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cf1aec5a-2889-47e8-80f0-a459009af13e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6382652b-3300-490c-b17d-a459009af126', N'A new topic has been created in the {0} category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9b68f373-0d20-46b9-be74-a459009af163', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'962a90dc-0f01-41b2-9e38-a459009af14c', N'New Discussion On ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1e75d3df-560f-4411-8e74-a459009af189', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'669074bf-04fa-4023-b4d6-a459009af171', N'You are trying to send messages to quickly')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'597e0f47-153e-4eab-9262-a459009af1ae', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bdcdcc71-ccc8-4239-8412-a459009af197', N'Your sent items is over capacity - delete messages to be able to send')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'94c30247-7e79-4169-be95-a459009af1cf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0b16a9db-610d-42ca-9ed7-a459009af1bc', N'{0} has exceeded their inbox size - unable to send message')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2c7f8901-8c12-4dc5-b06a-a459009af1f5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b1c929c0-523a-48ab-b652-a459009af1dd', N'Message Sent')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'45b2114f-5327-4a73-b14c-a459009af21a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3b7fb9ea-a132-451e-b8ae-a459009af203', N'Unable to find that member')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fd629ec1-f91b-41c2-8999-a459009af23b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'96afb727-c202-4347-bbf8-a459009af224', N'Talking to yourself is a bit weird. isn''t it?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f183ca15-bc99-404e-a37f-a459009af261', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b9bb75b5-bd24-4ce9-8cb4-a459009af249', N'Post Updated')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5c538617-46fa-4960-8da3-a459009af286', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'336ad998-d438-4f42-bff1-a459009af26f', N'Topic Deleted')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'43ed0681-73b7-4264-be45-a459009af2a7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd5a87457-593b-4ce3-8a61-a459009af28f', N'Post Deleted')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'30105523-0044-4f94-a5b3-a459009af2c8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'22331081-599c-443c-bf29-a459009af2b5', N'A new post has been created in the {0} topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ea71e261-1d73-4660-882d-a459009af2ed', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd5320969-b599-4108-8d23-a459009af2d6', N'New Post On ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9f08ad87-111a-4d8f-8f40-a459009af313', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'468b68a2-229b-4f9c-97e4-a459009af2fb', N'Report Sent')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c01117a6-c873-412b-8d78-a459009af338', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd0858b00-0f22-4a74-afc3-a459009af321', N'You are now registered')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'17efc103-233d-468f-a94d-a459009af35e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0c930b01-a2ef-41ea-af3a-a459009af342', N'You are now registered. But the forum admin must authorise your account')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'22902998-6d00-4dfa-a1fb-a459009af37e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'97be0ecc-24dd-41d6-ab55-a459009af367', N'You are now logged in')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a8c1a0f0-7856-4d98-957b-a459009af3a4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ab59899b-4710-4642-918f-a459009af38d', N'The user or password provided is incorrect.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd1ae92f9-7b95-49a9-a048-a459009af3c9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dff84867-d7a8-47e7-ac9f-a459009af3b2', N'The maximum number of password attempts has been exceeded.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e1fa2f98-47ad-4d62-920a-a459009af3ef', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dc269c1a-ce25-4f4c-8287-a459009af3d8', N'User is locked out.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c3c47081-0b4b-4d78-84cd-a459009af410', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ceeb61f0-6aa7-46a3-8b83-a459009af3f8', N'User has not been approved.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'76272d22-0e44-4eba-b2be-a459009af435', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2e1bf2f9-5b9e-44b8-a44d-a459009af41e', N'Unable to login.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f7c80a5e-9c27-4e48-a837-a459009af45b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9beb633e-a51a-4271-b419-a459009af443', N'You are now logged out')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'48d83436-3c28-4cbf-8eb0-a459009af47c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6ba0e821-e5ee-492a-aab2-a459009af464', N'Profile Updated')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8968dc2a-46d8-429b-ad12-a459009af4a1', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b847c909-d585-4890-a299-a459009af48a', N'Language Changed')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'60f5ea31-9be8-4ea5-92d1-a459009af4c7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6402e1dd-aae8-4db9-aef1-a459009af4af', N'Latest Forum Discussions')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'267935a2-6ee3-4f08-bf19-a459009af4ec', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8da60aa0-d22d-4f08-b1f7-a459009af4d5', N'Recent discussions')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bcd181d3-ee55-43f7-aec2-a459009af50d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1c6311f5-5699-4703-a353-a459009af4f5', N'Nothing To Display')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'82f9ccd3-75f0-4464-b395-a459009af532', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dfeb3b9a-5e6e-481f-8bd2-a459009af51b', N'{0} Discussions')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'384c9e1a-961a-4471-8699-a459009af553', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b56e1377-6ede-4bff-a773-a459009af540', N'Latest discussions happening in the {0} category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bdc071e3-609e-4da5-801d-a459009af579', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'67b237f4-74c4-45d3-b53e-a459009af561', N'Reporter')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd4418757-4ada-4e56-900a-a459009af59a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a50971c5-8b08-4ffb-9e93-a459009af582', N'Member Reported')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6ed4a365-0dc6-45d2-8917-a459009af5bf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3c539005-c66e-47b1-9834-a459009af5a8', N'Reason')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3b0b0624-a16d-4ef0-8298-a459009af5e5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ac6ffd83-d3e9-4d39-8e76-a459009af5cd', N'Member Report')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1bab14ce-c356-41e8-87ca-a459009af60a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e6924af3-262e-420b-ae81-a459009af5f3', N'Admin')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'03eb0f3b-a240-4567-a7f9-a459009af630', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6b0ddde0-1085-4758-8d97-a459009af618', N'Post Reported In')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1db3d6a8-da43-4119-b662-a459009af655', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5059f483-0c4c-4959-aa45-a459009af639', N'Post Report')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f7624cbd-e131-41ce-9270-a459009af676', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2dd5218e-acc3-4af7-87c4-a459009af65e', N'Unable to award badges as badge collection is null for user {0}')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'27ba55a4-e443-460c-b409-a459009af69b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd543f368-413b-4ed0-a28a-a459009af684', N'Unknown badge type {0}')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4fe4908b-4bfa-4c99-b843-a459009af6bc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2c6fa771-7c53-4513-a8e7-a459009af6a5', N'The badge enum type {0} has no corresponding class specified.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'72ff7d86-2347-44c4-bf4d-a459009af6e2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'864ef30f-0871-44fb-88ef-a459009af6ca', N'User name already exists. Please enter a different user name.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3d0ba23a-daeb-4fe2-b183-a459009af707', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'61ab95df-0b67-45a9-a09b-a459009af6f0', N'A user name for that e-mail address already exists. Please enter a different e-mail address.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1bc19195-d0a7-4ff2-9b43-a459009af728', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4198f9e8-09b4-440d-8bdf-a459009af711', N'The password provided is invalid. Please enter a valid password value.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4486896c-9f0d-4214-8644-a459009af757', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ab560529-06ae-46a1-be6a-a459009af736', N'The e-mail address provided is invalid. Please check the value and try again.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2ec40b8d-3a12-4e7d-9154-a459009af778', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'060d8dc9-37a0-46b8-89bc-a459009af760', N'The password retrieval answer provided is invalid. Please check the value and try again.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4525caff-40e4-455a-9e73-a459009af79d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2350d11b-ef14-4fb1-ae81-a459009af786', N'The password retrieval question provided is invalid. Please check the value and try again.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'957d208e-1f20-41cb-ae7b-a459009af7c3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'82c15b34-dd86-4a5a-a75f-a459009af7ab', N'The user name provided is invalid. Please check the value and try again.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3770efc4-7268-4397-999b-a459009af7e8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd97b8af3-918f-4299-9253-a459009af7d1', N'The authentication provider returned an error. Please verify your entry and try again. If the problem persists please contact your system administrator.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'47e4737f-8901-4c66-a4d8-a459009af80e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'019b26a5-5936-4de7-a21e-a459009af7f6', N'The user creation request has been canceled. Please verify your entry and try again. If the problem persists please contact your system administrator.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e516888c-3a92-48dc-8f98-a459009af82e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'cb7085d6-482a-4877-87cd-a459009af817', N'An unknown error occurred. Please verify your entry and try again. If the problem persists please contact your system administrator.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fd2e89a4-6ae8-4063-997f-a459009af854', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'86bb6b46-18ad-41dc-a83b-a459009af83d', N'New member registered on {0} ({1})')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f6c1be7e-8a30-4a9d-baca-a459009af879', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'014e81a0-a669-4222-b693-a459009af862', N'Admin')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1d7aa67b-1e1e-4f7c-852c-a459009af89f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3ad03914-9d3f-49a9-9a48-a459009af888', N'New Member Registered')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd09157ad-3dfa-465c-8745-a459009af8c4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c7f69d58-b263-43dc-8aed-a459009af8ad', N'User does not exist - cannot unlock.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6f9752f9-0c7a-41a3-a47f-a459009af8e5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fae48672-d1fb-4a3a-a4b6-a459009af8ce', N'You have requested that your password is reset on {0}. Your new password is below')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'76a79753-1298-4099-a9ef-a459009af90b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'59fe33fe-7c40-4b30-9d1b-a459009af8f3', N'Password Reset')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c402d1d5-f026-46bd-8549-a459009af92c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'08edf000-2b09-48af-b59e-a459009af919', N'A new password has been emailed to you')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a3ad62ef-0f3e-4418-91e7-a459009af951', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'cb91524d-f47a-4bd7-85cd-a459009af93a', N'Error resetting password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a724737b-f916-445f-a1b1-a459009af977', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b0402ea8-5136-4c85-b4c6-a459009af95f', N'Password Changed')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bce0db26-62a8-4dda-b238-a459009af997', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1fc602e0-9ad5-4c43-a43f-a459009af980', N'The current password is incorrect or the new password is invalid.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0bc1dbaf-fa58-4d5d-bf92-a459009af9bd', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'495e3f01-c082-4bf6-9911-a459009af9a5', N'Change Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cbf7b4c4-b1bf-4af5-bcea-a459009af9e2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'208b2d04-7c8e-48f1-a440-a459009af9cb', N'Change Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b9f7e8d0-a456-4b19-9d9f-a459009afa03', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4b244686-8188-4d86-8e9c-a459009af9ec', N'New passwords are required to be a minimum of {0} characters in length.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5591d939-311c-4d17-8806-a459009afa29', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0f1e76d2-5ea1-48d4-a33a-a459009afa11', N'Click here if you want to {0}')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8bc48a8d-e1f4-4064-b61a-a459009afa4e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a7e6de7e-9fd6-432c-946b-a459009afa37', N'Forgot Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2f9ca56d-1885-4851-9284-a459009afa74', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ffb851af-47f6-4a5a-93f3-a459009afa5c', N'Reset Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'276fa537-ab98-4b4a-9d0c-a459009afa99', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'60e8071c-8067-4bf1-90e6-a459009afa7d', N'Forgot your password?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a79b333d-684c-4d87-bb51-a459009afaba', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2ea74c26-e080-49b3-a7db-a459009afaa3', N'Current Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a12cbc15-1048-4ab4-9241-a459009afae4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'92ca74aa-bc2e-43be-a3cd-a459009afacd', N'New Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b82cd8f7-53b9-4fdd-bc4b-a459009afb0a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1cb01962-9514-4417-961b-a459009afaf2', N'Confirm New Password')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b406455d-78c7-432a-a22d-a459009afb2b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0ae84c7e-2cfd-46b8-9094-a459009afb13', N'Enter your email address')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0c1b3c34-a806-456a-ba7e-a459009afb50', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'22b77c2d-5db2-4bd6-882b-a459009afb39', N'badge ')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2e568dc2-7d83-484f-a02f-a459009afb76', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'cd3d7e4c-ef64-4f99-a39d-a459009afb5e', N'has been awarded the')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0dd1b01e-1c78-4df5-b43f-a459009afb9b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'057dfe95-5657-4d09-b4ee-a459009afb84', N'is a new member in the forum')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'faf09c9f-be98-4723-91be-a459009afbbc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1aeffa8f-2664-43e3-a5c1-a459009afba9', N'has an updated profile')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5a688efe-6870-4441-8a29-a459009afbe1', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b84f1bec-6608-4bb7-92c0-a459009afbca', N'Get notified of replies?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2a224e66-5b45-4a98-8eed-a459009afc07', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f68ba8d2-0776-4893-a306-a459009afbef', N'Badges')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'95d4d7f5-3eb2-4386-b1ae-a459009afc2c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2377b589-f1d4-4ab0-9fa5-a459009afc15', N'Badges')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e10daada-a5aa-4f25-9eda-a459009afc52', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0ac84ba9-ec34-4d4e-8dfe-a459009afc3a', N'Title')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b8514a95-bc35-488e-b7f6-a459009afc77', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fbe7177b-bff2-42b0-bd7a-a459009afc5b', N'Add A Poll To This Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'24e93be2-a469-41a4-963a-a459009afc98', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b07130f2-1e3e-49ed-b90e-a459009afc81', N'Type A Poll Answer Here')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'67c7762e-3842-4e83-be4f-a459009afcbe', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'afb60ff7-173d-4ee0-8bc5-a459009afca6', N'Topic Options')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f39645ba-e3ff-42cd-a231-a459009afce3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b93a675f-b249-4d2a-8e51-a459009afccc', N'Remove Poll From Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'39965244-ed71-4e1e-b459-a459009afd04', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4a29de34-704d-4b1b-ad84-a459009afced', N'Submit Vote')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6d1962cc-072c-40e8-986f-a459009afd29', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9396f702-ecf8-4bfb-b153-a459009afd12', N'There was an error with your answer. Please try again')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6509fc76-37c0-41fe-a492-a459009afd4f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ef170218-1131-4ad4-8c91-a459009afd38', N'Or')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bc6ac037-217a-4ac3-8dc9-a459009afd74', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'6d6295a4-f8cb-4359-8409-a459009afd5d', N'You have enabled Facebook login but not added your AppId or Secret key to the web.config')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3943cdf1-6ec5-4f38-939d-a459009afd9a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'64dc83f1-bc65-4bfe-aa78-a459009afd83', N'Social Account')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c2fd1b37-bbd6-4635-89c1-a459009afdbf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1594e56c-976d-4cec-91f3-a459009afda8', N'Just now')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd2411fed-39ae-4db7-8c34-a459009afde5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'db10d724-cda7-4f3e-af0d-a459009afdce', N'1 minute ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'22f61801-56d3-4262-bc54-a459009afe06', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c57ce655-1171-4cf7-94bf-a459009afdee', N'{0} minutes ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'75607aeb-5539-4ac5-a7f3-a459009afe2b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'20d34916-18af-41fe-89dd-a459009afe14', N'1 hour ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'398cc24b-2477-4ae9-8a08-a459009afe51', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5121d533-301b-4caf-a56a-a459009afe39', N'{0} hours ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'aeffac95-c124-40e6-b542-a459009afe76', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dcc71740-72af-4647-bc3b-a459009afe5a', N'yesterday')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ad46c2e4-3f18-45ac-b7e4-a459009afe97', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c89cded3-d9dd-4532-859c-a459009afe80', N'{0} days ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'abcbc806-4625-4a8d-bc9b-a459009afebd', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd6813a20-cb9c-42b9-ab37-a459009afea5', N'{0} weeks ago')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bc665c50-bbad-44db-af27-a459009afee2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3fe745db-c7a6-4820-8fa1-a459009afecb', N'Search')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5adf833d-8205-43a7-baaa-a459009aff08', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'80fb8e31-95a4-4264-9669-a459009afef0', N'Sorry no results found')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2335c122-6eb8-4eb8-a770-a459009aff2d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'addae6a6-55e0-4d7d-9420-a459009aff16', N'Comments')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f158923f-2aa1-40b1-a9c2-a459009aff53', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f006aeb4-5a83-49bf-ab11-a459009aff36', N'Delete All Posts')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'57955050-1e2f-4e00-9a49-a459009aff73', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b3f01bf6-7d04-4297-b6d4-a459009aff5c', N'Add Post')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a2be41d4-cbfb-432d-b900-a459009aff99', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'50ef603d-919d-46bd-ad6c-a459009aff81', N'Choose Category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'73a46447-6bbd-40e4-90e6-a459009affc8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5bd5bedf-e3bc-45a0-a8b5-a459009affa7', N'Need formatting help?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'683df75a-1132-45ee-9e42-a459009affed', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9e13720a-695d-4d4f-9d41-a459009affd6', N'Ban User')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cef5e0d4-f74c-46ed-9456-a459009b0013', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5faeb278-be61-4221-9184-a459009afffb', N'Unban User')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1b16eddb-5d66-4eab-8766-a459009b0038', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a8a46f83-b7d3-4738-9427-a459009b0021', N'Topic Created. But you do not have permission to create polls')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3f6892c2-6d69-4975-923e-a459009b005e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8a01dcce-1904-4652-88c5-a459009b0042', N'Show More Posts')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'be1e8262-1ca7-40c3-934a-a459009b007f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'eeeba585-dc44-4dd4-be9d-a459009b0067', N'Loading Posts...')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'df1e5551-0d4a-451b-a50d-a459009b00ad', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd152d108-b990-4691-ad7d-a459009b008d', N'Questions that may already have your answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd07ff2a9-67f3-43b0-bfe8-a459009b00d3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ae191b92-2a4c-4196-bfd9-a459009b00bc', N'Answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd86e1ef2-a5b1-4b51-9639-a459009b00f4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd50cc5df-3165-4dc7-a9ec-a459009b00dc', N'Members Currently Online:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3178668a-db11-4c1f-beb8-a459009b0119', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'48dc2aac-d5fd-49cb-ba1d-a459009b0102', N'Order By:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'82087d22-63a6-4ec9-893f-a459009b013f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'10fefe34-1e0a-4fdd-b200-a459009b0127', N'Standard')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f808bcb5-6c5b-47f4-ae55-a459009b0164', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1ba78667-4410-43d0-b3c6-a459009b014d', N'Newest')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'aa9c7f61-aac4-426b-b6a3-a459009b0185', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'40dda628-d0c1-45ad-bf47-a459009b0172', N'Votes')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fc755ee0-f0c9-4665-be43-a459009b01ab', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'034aecf3-59dc-4dc2-ae5f-a459009b0193', N'New Private Message')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4a7b6cee-e2d7-45f4-a67b-a459009b01d0', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c5a14b20-2000-48ec-853d-a459009b01b9', N'{0} has just sent you a private message.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7440dac7-a2d0-4aed-a9c3-a459009b01f6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5c745572-776c-4314-bae1-a459009b01de', N'Are you sure you want to delete?')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f505c8d9-5e15-4a32-b95b-a459009b021b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'03d958b5-8562-4537-bd94-a459009b0204', N'Sub Categories In')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'9933122b-c3a8-4518-b79a-a459009b0241', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'50ee5adb-9884-4f05-b45b-a459009b0229', N'All Categories')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8b222c77-631d-44b3-8e03-a459009b0261', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7ea4204a-c3f7-4232-ab07-a459009b024a', N'Most recent:')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'88a4e5ca-d07e-4d43-88b6-a459009b0287', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1c32c37c-a71a-4534-93c4-a459009b026f', N'Login with Facebook')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3e5a3cba-0247-484b-b842-a459009b02b1', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5de47935-26d8-45d9-9b12-a459009b0295', N'Login with Google')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'18de42eb-3843-4a3a-86e0-a459009b02d2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2e96cd85-5f73-4b90-9309-a459009b02ba', N'Login with Yahoo')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'358d232b-d37b-4af7-b588-a459009b02f7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'77c3b3a2-f88e-44b4-9aed-a459009b02e0', N'Login with Twitter')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0dd31f0f-5d36-4c7e-a821-a459009b031d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5c392055-ef77-470a-83e5-a459009b0305', N'You have enabled social logins but not added the Twitter id and secret key in the web.config')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fe436918-4cf2-4f2a-a0e2-a459009b033e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e4149b35-edec-4b6c-96ed-a459009b0326', N'The email address or domain you are trying to use is banned')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b06049fe-d2cf-4dcc-a4a6-a459009b0363', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'915caaa8-3f6c-4d8e-8929-a459009b034c', N'Files uploaded successfully')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'21a60b43-28c2-454f-bc25-a459009b0389', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'227d9270-146a-4bad-bff3-a459009b0371', N'Attach')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'177aef45-68c2-477b-a4bc-a459009b03ae', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f2514fd9-c8e5-4309-95f2-a459009b0397', N'Upload Files')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'fae3e8d9-7dc6-4e0b-8693-a459009b03d4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f1611c47-b109-4bdc-aff9-a459009b03bc', N'File extension not allowed')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6f0bcdf9-e890-4032-8156-a459009b03f9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0a8151b3-b0d1-4fb0-96a0-a459009b03e2', N'File upload is too big')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b0b4b0ff-8af7-4638-a5bd-a459009b041f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e0bb5fa2-e9ce-4992-a0ff-a459009b0407', N'File deleted')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'13ca7a3c-92c6-4a81-b8c3-a459009b0444', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b05f71ca-ffe3-44fc-823c-a459009b042d', N'We have sent you a confirmation email - please click the confirmation link in your email to approve your account.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'223acdea-8e5b-4781-8b16-a459009b046a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4b079356-eef7-4650-a4c4-a459009b0452', N'You have registered on {0} - In order to continue you must confirm your email address by clicking the link below. {1}')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cd139eb3-e063-430e-a2c8-a459009b048b', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8ece05fa-406a-4d4d-acfb-a459009b0473', N'Email Confirmation')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4f6d260b-8ae9-44a6-9630-a459009b04b0', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3fd10c3c-81b3-436f-bc6f-a459009b0499', N'Your account has now been approved - Thank you')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6136e4a3-4140-4dd2-a1e9-a459009b04d6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'325c170c-74de-4942-93b5-a459009b04be', N'Click the link in your confirmation email to approve your account.')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'564e5e99-9425-4c60-a53b-a459009b04fb', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bd442c6d-00ed-4bbc-a7ac-a459009b04e4', N'Resend Confirmation Email')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'36946300-c2ba-4c33-9ccb-a459009b0521', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3e8f104b-4bce-4ea5-99b3-a459009b0509', N'Message Me')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6a8f59c1-723a-4136-a486-a459009b0546', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'42335278-75b0-459b-a558-a459009b052f', N'Are you sure? This will delete all the members posts and topics!')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'539c7d21-115c-4a1f-861e-a459009b056c', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'82cdd5ef-aa62-4d3d-bfda-a459009b0554', N'Your post is currently awaiting moderation. Once approved it will appear on the site')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'297ab0fb-4b32-4118-a01c-a459009b0591', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1a3830d9-58ed-4418-825a-a459009b057a', N'Awards {0} points')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6b3e2053-2262-441b-a235-a459009b05b7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3ff94753-ac8c-4c06-b74f-a459009b059f', N'Change Language')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ad28d18d-34f3-4706-8f3b-a459009b05dc', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ba2df484-7771-4616-8479-a459009b05c5', N'Quote')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'57f5830a-530e-4055-a8a4-a459009b0602', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'20475191-89f8-4466-8954-a459009b05ea', N'Upload a new profile image')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'134a470d-605a-48e7-9252-a459009b0627', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9e4585b1-3fd5-4eeb-9b6a-a459009b0610', N'You have new unread Private messages')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'5516bc2b-de49-4c0a-aa94-a459009b064d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'abfa1a7b-6fc5-4841-9ce8-a459009b0635', N'Your Question Solved')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd564da9e-d20d-4926-855b-a459009b0672', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4e85c5d3-4394-4e0d-9dff-a459009b065b', N'This badge is awarded to topic authors the first time they have a post marked as the answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'951cc08f-deec-46d0-ab82-a459009b0698', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'391db605-d7cc-4acb-b31e-a459009b0680', N'You''ve Given Your First Vote Up')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'304ea136-c705-406d-8418-a459009b06bd', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4f9b9bf2-9929-4703-8d40-a459009b06a6', N'This badge is awarded to users after they make their first vote up')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2436bce3-af72-452b-b1bc-a459009b06e3', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'dc615aae-d557-4257-b71f-a459009b06cb', N'Umbraco Fan')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bb271d3b-6658-4eea-bc43-a459009b0708', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd51dcfa0-aff2-434d-936a-a459009b06f1', N'This badge is awarded to a user who mentions Umbraco in their latest post')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'92c12d57-1fdb-481d-8300-a459009b072e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2aed6dfe-7015-48c6-8456-a459009b0716', N'First Vote Up Received')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'eb4f1a12-dc85-4d90-9c09-a459009b0753', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bdff4ed1-94e0-4da2-b000-a459009b073c', N'This badge is awarded to users after they receive their first vote up from another user')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3d3dc754-61b1-4ba8-9a70-a459009b0779', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b11d51f0-ebe0-46a3-a9ac-a459009b0761', N'Post Selected As Answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'dbd4b2ef-d307-444c-85ca-a459009b079e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f41b11eb-3688-425f-b531-a459009b0787', N'This badge is awarded to the poster of a post marked as the topic answer - The first time they author an answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'922cc997-d17a-4a52-80ce-a459009b07c4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'54e8fa4b-08f7-40a2-b570-a459009b07ac', N'Padawan')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3ca7163b-17ca-4fcc-be9e-a459009b07e9', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f22330bf-c413-4222-a668-a459009b07d2', N'Had 10 or more posts successfully marked as an answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'02cb0db0-b5ef-40fb-8339-a459009b0813', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b9c3d6d7-d1f7-4881-81b4-a459009b07f7', N'Thousand Pointer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7977fb5a-7d56-4ba5-b43b-a459009b0839', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd425918f-872c-404d-a90f-a459009b0821', N'This badge is awarded to users who have received 1000 points')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6c9ae9bf-e83d-41fc-905c-a459009b085a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'90e0d4f7-90bf-4dc4-a57d-a459009b0842', N'First Anniversary')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'13b3c066-0c5b-4cc8-8fac-a459009b087f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'8b73217b-eafe-4d6c-a833-a459009b0868', N'This badge is awarded to a user after their first year anniversary')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0ca88e45-fc80-4542-8294-a459009b08a5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'4cc15136-b055-47ae-a4e9-a459009b088d', N'The Grouch')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'19f9581f-4d56-4da4-8303-a459009b08cf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b7282fe3-b9b0-4f1f-943a-a459009b08b3', N'This badge is awarded to users who have voted down other users posts 10 or more times')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'90089707-6373-4147-b195-a459009b08fe', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b376cf30-beab-4479-91f3-a459009b08d8', N'Jedi Master')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c77c235c-115c-4f8a-9812-a459009b0923', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f2e65866-6bc9-4709-a5bb-a459009b090c', N'Had 50 or more posts successfully marked as an answer')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f8aaa6dc-cb9b-42ab-bbaa-a459009b0949', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'a4b17fad-4c80-4ce4-a0fb-a459009b0931', N'Photogenic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a76f0323-2769-4de2-887c-a459009b0977', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'631a696d-02f5-4d8d-83df-a459009b0957', N'Little things like uploading a profile picture make the community a better place. Thanks!')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4e9c5bb6-d0bf-419f-bc0b-a459009b099d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b8229740-a3fb-4812-a322-a459009b0986', N'MvcForum')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c9e839a5-d564-4b95-8c02-a459009b09c2', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1ce6e8b2-ea28-4f2a-b88d-a459009b09ab', N'Utilities')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'dac2a67d-fa4f-4244-8bad-a459009b09e8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'302cab8c-f3df-4ffb-a871-a459009b09d1', N'Search for...')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'de8bb300-4035-484c-aa10-a459009b0a0e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'933b1844-798e-4a21-ab4e-a459009b09f6', N'Go')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8fa804d0-7cf9-49d7-8907-a459009b0a33', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5ea62c47-4334-4824-8884-a459009b0a1c', N'Topic Is Sticky')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'363a4c11-254d-4635-98da-a459009b0a59', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2f7882a1-f8d4-4873-a735-a459009b0a41', N'Topic Is Solved')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1bb10037-8c13-4194-b4d8-a459009b0a7e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'21c7cd9e-ccb6-4616-91db-a459009b0a67', N'Category')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'20756aa4-7042-49fc-ba96-a459009b0aa8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'abb1c539-d45d-4739-967d-a459009b0a8c', N'Poll')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'bc08c90e-8c19-4a8c-bdb3-a459009b0ace', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fac93fa9-9c25-4bd7-9daf-a459009b0ab2', N'Last Post')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'7a5e0649-e09f-40b7-82b6-a459009b0aef', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b1217a25-aa4a-4959-9142-a459009b0ad7', N'Hot Topics')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'97254f07-adb7-4c2d-9c64-a459009b0b14', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3d79e87c-d669-4886-a2e5-a459009b0afd', N'No one online at the moment')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'74e9270b-8841-446f-84c4-a459009b0b3e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'f3ec25bc-85d9-4939-9746-a459009b0b22', N'Liked by')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'c42bd914-98c7-4b5e-8b7e-a459009b0b64', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1ddcb7ef-8fc4-4554-a4f7-a459009b0b4c', N'Browse...')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b2967c70-6901-49af-97a8-a459009b0b89', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'def3a939-b778-4a8d-b70d-a459009b0b72', N'Attached Files')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8f7eff0e-afc5-48a2-8462-a459009b0baf', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c181fccd-46e2-4ebb-a285-a459009b0b97', N'Latest')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'28160145-b0c7-4827-b2d9-a459009b0bf6', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0cd719de-146d-4c36-b868-a459009b0bbd', N'Following')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f56a17f0-2f2d-4a1d-9fed-a459009b0c27', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c2fb316a-9bb0-4efb-9124-a459009b0c08', N'Posted In')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'ea69b2fa-31be-4e55-91da-a459009b0c50', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'224d2131-49fc-411e-b300-a459009b0c35', N'My Favourites')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'00159a39-c539-43ca-9e88-a459009b0c7f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'37a779e3-2874-48e8-a839-a459009b0c60', N'My Favourites')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'58a52472-21a5-40db-a930-a459009b0cb0', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'86d49285-ae8d-47fa-8f64-a459009b0c8f', N'You have not starred any posts')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'09be36a8-70c2-405a-9ee9-a459009b0cde', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3a9e5b03-66db-4851-a301-a459009b0cc1', N'Topics & Categories')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'195209a6-cc75-482a-9550-a459009b0d14', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'60b67b0a-8565-49c3-9b1d-a459009b0cf4', N'Categories you are following')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'4a69b767-90ce-42e1-bf1f-a459009b0d3f', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'24b53ad3-c9c8-4707-ac8d-a459009b0d26', N'You are not subscribed to any Categories')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'8bbcb8eb-0e54-42d3-b37a-a459009b0d70', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ddf7665a-1cc8-4ab9-8929-a459009b0d52', N'Topics your are following')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0727ebc8-75cd-496a-8b52-a459009b0dd0', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'52381d43-f19b-4111-94ed-a459009b0da2', N'You are not subscribed to any Topics')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'83df396f-d090-4bf5-a682-a459009b0e06', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'533b8a47-9269-4038-a2f2-a459009b0de6', N'Topics & Posts you have posted in')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2d7f848c-59eb-4520-afeb-a459009b0e2a', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'bf791b07-8c46-4a9c-9fac-a459009b0e13', N'Add Tag')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f805ad0a-edc0-4715-982f-a459009b0e52', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'b0392fdb-1038-4940-a082-a459009b0e37', N'Upload Files')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'0402325b-e949-447d-84de-a459009b0e76', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'ad106c69-e084-4fc2-ab7e-a459009b0e5e', N'Searching')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'6576cf29-2e48-491c-a82c-a459009b0e9d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'c5dc8279-9427-42ff-a81a-a459009b0e83', N'In Topic')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'dd37f301-66f6-4439-97cb-a459009b0ec4', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'e5d164a6-ead5-4a4a-9d5f-a459009b0eaa', N'Scrub Member')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'16ac1ac1-2122-463b-a24e-a459009b0ee8', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'3a5ae5ed-cda1-47b8-b177-a459009b0ed0', N'Are you sure you want to do this? It will delete all their posts and then ban them')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'2154a363-d960-418d-8275-a459009b0f0e', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9b3284be-17cc-40a9-9f14-a459009b0ef5', N'Admin')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'635f0d63-1c8a-4bf6-b01e-a459009b0f36', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'1bf1adbb-6a3f-4fb9-96db-a459009b0f1c', N'All done')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'1ff67ce1-d4ae-49b6-b3ad-a459009b0f5d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'2ad1a810-eff3-41a0-ac2a-a459009b0f45', N'Favourite')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'e12431ad-bf26-4c95-85c4-a459009b0f84', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'9fe9ffeb-b432-4f8e-952d-a459009b0f6a', N'Favourited')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b48ee7f8-b33a-47e8-9c75-a459009b0fab', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'5d75fd16-240b-49c5-98e2-a459009b0f90', N'Member is now banned')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'3a7bb038-0212-40a8-bc2f-a459009b0fd5', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'60ad2931-209d-48b6-8593-a459009b0fb8', N'You are about to exceed your private message inbox allowance')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'cba1c97d-8951-463d-89e9-a459009b1003', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fd890994-2283-4cec-910e-a459009b0fe8', N'Private Message Inbox Allowance')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f9710b1c-974a-4c93-b891-a459009b1027', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'875d23e0-0800-4200-a864-a459009b100f', N'New Private Message')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'428180a5-1695-4a53-b237-a459009b1050', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'd7ebb29d-73d4-4823-a6ec-a459009b1035', N'Last Activity')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'f7592546-b20b-4b3d-baae-a459009b107d', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'fc4f0774-430a-4f84-96b6-a459009b1061', N'You have tried to enter a word or url that is not allowed on this site')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'd20d29c4-57ed-49d8-83fa-a459009b10a7', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'7622afc0-6cd5-494b-a202-a459009b108b', N'Permalink')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'a341fecd-6ef9-4b5f-a767-a459009b10d0', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'893daf7c-fa1b-49a9-872e-a459009b10b6', N'Last Online')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [Language_Id], [LocaleResourceKey_Id], [ResourceValue]) VALUES (N'b85772b2-5276-43b7-862d-a459009b1107', N'73ec3414-3fd7-4b79-ab60-a459009ae016', N'0250dac9-6b5c-4c9c-8f04-a459009b10e4', N'Unable to gain access to your email address - please check your permissions')
GO
INSERT [dbo].[MembershipRole] ([Id], [RoleName]) VALUES (N'26285c08-cdad-46b3-8b28-a459009adf51', N'Admin')
GO
INSERT [dbo].[MembershipRole] ([Id], [RoleName]) VALUES (N'2df47dd6-7006-4e26-9501-a459009adf51', N'Guest')
GO
INSERT [dbo].[MembershipRole] ([Id], [RoleName]) VALUES (N'deb7328e-b016-4c2b-aef2-a459009adf51', N'Standard Members')
GO
INSERT [dbo].[MembershipUser] ([Id], [UserName], [Password], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Slug], [Comment], [Signature], [Age], [Location], [Website], [Twitter], [Facebook], [Avatar], [FacebookAccessToken], [FacebookId], [TwitterAccessToken], [TwitterId], [GoogleAccessToken], [GoogleId], [IsExternalAccount], [TwitterShowFeed], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads], [LoginIdExpires], [MiscAccessToken], [Latitude], [Longitude], [LastActivityDate]) VALUES (N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'admin', N'fB+WvM1iSK2VLJjppVrF2TQlx9cnQ8Z9f3RK8Dpfwwc=', N'NojXw41wQwtULhyQel31x9/iLrbUrpwF', N'you@email.com', NULL, NULL, 1, 0, CAST(N'2015-03-12 09:24:58.947' AS DateTime), CAST(N'2015-03-12 10:21:12.313' AS DateTime), CAST(N'2015-03-12 09:24:58.947' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0, 0, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-03-12 10:21:13.407' AS DateTime))
GO
INSERT [dbo].[MembershipUser] ([Id], [UserName], [Password], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Slug], [Comment], [Signature], [Age], [Location], [Website], [Twitter], [Facebook], [Avatar], [FacebookAccessToken], [FacebookId], [TwitterAccessToken], [TwitterId], [GoogleAccessToken], [GoogleId], [IsExternalAccount], [TwitterShowFeed], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads], [LoginIdExpires], [MiscAccessToken], [Latitude], [Longitude], [LastActivityDate]) VALUES (N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'zenna', N'2jqizY5Wja1RS68n6heFCaMQ7ijorYb/LtAEe8UjUJQ=', N'Bdm2ilftCrxGeNohdz0CLr2ZwwM/Sanp', N'zenna.occi@hotmail.com', NULL, NULL, 1, 0, CAST(N'2015-03-12 10:12:16.647' AS DateTime), CAST(N'2015-03-12 10:23:55.517' AS DateTime), CAST(N'2015-03-12 10:12:16.647' AS DateTime), CAST(N'1753-01-01 00:00:00.000' AS DateTime), 0, 0, N'zenna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1d7ae8e2-ed90-40a5-9981-a45900ad724f_person-faye.1bfdab1ab5c0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2015-03-12 10:30:17.407' AS DateTime))
GO
INSERT [dbo].[MembershipUser_Badge] ([Id], [Badge_Id], [MembershipUser_Id]) VALUES (N'ff18ca74-93e7-4a52-9e13-0ce45295383b', N'2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1', N'095e7a70-6f65-4c57-9516-a459009b2d1f')
GO
INSERT [dbo].[MembershipUser_Badge] ([Id], [Badge_Id], [MembershipUser_Id]) VALUES (N'2fe8a4bd-2139-4d33-8ce7-a7068f7642e8', N'c9913ee2-b8e0-4543-8930-c723497ee65c', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46')
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'407b4d9d-7584-4ed5-aaa0-a45900aaf0bf', N'095e7a70-6f65-4c57-9516-a459009b2d1f', 1, CAST(N'2015-03-12 10:22:22.500' AS DateTime))
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'0d5e0c47-3d21-4872-b362-a45900ab7a3d', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', 1, CAST(N'2015-03-12 10:24:19.827' AS DateTime))
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'6be5db87-98f9-463f-805c-a45900ab882c', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', 1, CAST(N'2015-03-12 10:24:31.720' AS DateTime))
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'b9da22d9-b358-4caf-af1f-a45900ac2493', N'095e7a70-6f65-4c57-9516-a459009b2d1f', 0, CAST(N'2015-03-12 10:26:45.180' AS DateTime))
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'51d0abc2-f7df-4601-ab1b-a45900ac2543', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', 2, CAST(N'2015-03-12 10:26:45.767' AS DateTime))
GO
INSERT [dbo].[MembershipUserPoints] ([Id], [MembershipUser_Id], [Points], [DateAdded]) VALUES (N'74771b47-4ed3-452e-b9c9-a45900ac25ce', N'095e7a70-6f65-4c57-9516-a459009b2d1f', 2, CAST(N'2015-03-12 10:26:46.230' AS DateTime))
GO
INSERT [dbo].[MembershipUsersInRoles] ([Id], [RoleIdentifier], [UserIdentifier]) VALUES (N'fe878972-db62-42f4-bf9f-89d0ea5ab769', N'26285c08-cdad-46b3-8b28-a459009adf51', N'095e7a70-6f65-4c57-9516-a459009b2d1f')
GO
INSERT [dbo].[MembershipUsersInRoles] ([Id], [RoleIdentifier], [UserIdentifier]) VALUES (N'926c976b-6163-4b63-92a1-c0804913c2b5', N'deb7328e-b016-4c2b-aef2-a459009adf51', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46')
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'd4520dab-39ad-4bfd-8067-a459009b2cf7', N'Delete Posts', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'ff753c3e-5892-4967-84c6-a459009b2cf7', N'Edit Posts', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'4a1858e0-47b5-4570-8a28-a459009b2cf7', N'Sticky Topics', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'58a1c90a-69f0-45a9-8ffc-a459009b2cf7', N'Create Polls', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'9d909e09-2a56-4fb7-9409-a459009b2cf7', N'Create Topics', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'9baf72b5-3eb8-4c86-9f7f-a459009b2cf7', N'Deny Access', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'9a297741-ceb7-4228-a94c-a459009b2cf7', N'Attach Files', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'4b7f37fc-e07b-454f-ad15-a459009b2cf7', N'Vote In Polls', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'a6b134b2-e3d8-4967-af1f-a459009b2cf7', N'Read Only', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'efc85206-4af8-4921-b540-a459009b2cf7', N'Lock Topics', 0)
GO
INSERT [dbo].[Permission] ([Id], [Name], [IsGlobal]) VALUES (N'e7c27147-e65d-4c65-9633-a459009b2d1a', N'Edit Members', 1)
GO
INSERT [dbo].[Post] ([Id], [MembershipUser_Id], [PostContent], [DateCreated], [VoteCount], [Topic_Id], [DateEdited], [IsSolution], [IsTopicStarter], [FlaggedAsSpam], [IpAddress], [Pending]) VALUES (N'c3629b8a-6d26-405c-a9bd-a45900aaf12a', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'<p>testing</p>', CAST(N'2015-03-12 10:22:22.860' AS DateTime), 1, N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', CAST(N'2015-03-12 10:22:22.860' AS DateTime), 0, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Post] ([Id], [MembershipUser_Id], [PostContent], [DateCreated], [VoteCount], [Topic_Id], [DateEdited], [IsSolution], [IsTopicStarter], [FlaggedAsSpam], [IpAddress], [Pending]) VALUES (N'38d1a80e-4f2b-4124-9c05-a45900ab7a38', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'<pre><img src="https://mozorg.cdn.mozilla.net/media/img/contribute/person-faye.1bfdab1ab5c0.jpg" alt="" width="300" height="300"> Testing only</pre>', CAST(N'2015-03-12 10:24:19.813' AS DateTime), 0, N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', CAST(N'2015-03-12 10:26:23.647' AS DateTime), 0, 0, NULL, N'localhost', NULL)
GO
INSERT [dbo].[Post] ([Id], [MembershipUser_Id], [PostContent], [DateCreated], [VoteCount], [Topic_Id], [DateEdited], [IsSolution], [IsTopicStarter], [FlaggedAsSpam], [IpAddress], [Pending]) VALUES (N'9d3cb8c1-a06f-4485-968b-a45900ab8828', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'<p>testing</p>
<p>&nbsp;</p>
<p>sdfasdfsdaf</p>', CAST(N'2015-03-12 10:24:31.703' AS DateTime), 0, N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', CAST(N'2015-03-12 10:24:31.703' AS DateTime), 0, 0, NULL, N'localhost', NULL)
GO
INSERT [dbo].[Settings] ([Id], [ForumName], [ForumUrl], [IsClosed], [EnableRSSFeeds], [DisplayEditedBy], [EnablePostFileAttachments], [EnableMarkAsSolution], [EnableSpamReporting], [EnableMemberReporting], [EnableEmailSubscriptions], [ManuallyAuthoriseNewMembers], [EmailAdminOnNewMemberSignUp], [TopicsPerPage], [PostsPerPage], [EnablePrivateMessages], [MaxPrivateMessagesPerMember], [PrivateMessageFloodControl], [EnableSignatures], [EnablePoints], [PointsAllowedToVoteAmount], [PointsAddedPerPost], [PointsAddedPostiveVote], [PointsAddedForSolution], [PointsDeductedNagativeVote], [AdminEmailAddress], [NotificationReplyEmail], [SMTP], [SMTPUsername], [SMTPPort], [SMTPEnableSSL], [SMTPPassword], [Theme], [NewMemberStartingRole], [DefaultLanguage_Id], [ActivitiesPerPage], [EnableAkisment], [AkismentKey], [CurrentDatabaseVersion], [SpamQuestion], [SpamAnswer], [EnableSocialLogins], [EnablePolls], [NewMemberEmailConfirmation], [SuspendRegistration], [PageTitle], [MetaDesc]) VALUES (N'93537887-244d-4fb6-8dc6-a459009b2c94', N'MVC Forum', N'http://www.mydomain.com', 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 20, 20, 1, 50, 1, 0, 1, 1, 1, 0, 4, 2, N'my@email.com', N'noreply@myemail.com', NULL, NULL, NULL, 0, NULL, N'Metro', N'deb7328e-b016-4c2b-aef2-a459009adf51', N'73ec3414-3fd7-4b79-ab60-a459009ae016', 20, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Topic] ([Id], [Name], [CreateDate], [MembershipUser_Id], [Solved], [Category_Id], [Post_Id], [Slug], [Views], [IsSticky], [IsLocked], [Poll_Id], [Pending]) VALUES (N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', N'testing', CAST(N'2015-03-12 10:22:22.517' AS DateTime), N'095e7a70-6f65-4c57-9516-a459009b2d1f', 0, N'5ea566da-bb78-4fbe-a3e2-a459009adf14', N'9d3cb8c1-a06f-4485-968b-a45900ab8828', N'testing', 9, 0, 0, NULL, NULL)
GO
INSERT [dbo].[Topic_Tag] ([Id], [Topic_Id], [TopicTag_Id]) VALUES (N'4bf003be-71b2-4f4f-a89e-686498038c3b', N'6faa0e49-93d7-43aa-8fbc-a45900aaf147', N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf')
GO
INSERT [dbo].[TopicNotification] ([Id], [Topic_Id], [MembershipUser_Id]) VALUES (N'e0ab3b5d-a039-47f9-9fc0-a45900aaf14b', N'2fa18a31-0ae3-4bf9-845a-a45900aaf0bf', N'095e7a70-6f65-4c57-9516-a459009b2d1f')
GO
INSERT [dbo].[TopicTag] ([Id], [Tag], [Slug]) VALUES (N'6faa0e49-93d7-43aa-8fbc-a45900aaf147', N'test', N'test')
GO
INSERT [dbo].[UploadedFile] ([Id], [Filename], [MembershipUser_Id], [Post_Id], [DateCreated]) VALUES (N'62b94178-108b-4366-94db-a45900ab12bb', N'06c85831-f0a1-49aa-9c28-a45900ab12bb_1.jpg', N'095e7a70-6f65-4c57-9516-a459009b2d1f', N'c3629b8a-6d26-405c-a9bd-a45900aaf12a', CAST(N'2015-03-12 10:22:51.500' AS DateTime))
GO
INSERT [dbo].[Vote] ([Id], [MembershipUser_Id], [Post_Id], [Amount], [VotedByMembershipUser_Id], [DateVoted]) VALUES (N'011ae58f-0804-409e-8f87-a45900ac2496', N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', N'c3629b8a-6d26-405c-a9bd-a45900aaf12a', 1, N'0eb7d85a-8a4f-465e-8bab-a45900a82a46', CAST(N'2015-03-12 10:26:45.193' AS DateTime))
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] ADD  CONSTRAINT [DF_CategoryPermissionForRole_HasPermission]  DEFAULT ((0)) FOR [IsTicked]
GO
ALTER TABLE [dbo].[Poll] ADD  CONSTRAINT [DF_Poll_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
ALTER TABLE [dbo].[PrivateMessage] ADD  CONSTRAINT [DF_PrivateMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked]  WITH NOCHECK ADD  CONSTRAINT [FK_BadgeTypeTimeLastChecked_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked] NOCHECK CONSTRAINT [FK_BadgeTypeTimeLastChecked_MembershipUser]
GO
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNotification_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_CategoryNotification_Category]
GO
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNotification_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_CategoryNotification_MembershipUser]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_Category]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_MembershipRole] FOREIGN KEY([MembershipRole_Id])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_MembershipRole]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_Permission]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH NOCHECK ADD  CONSTRAINT [FK_LocaleStringResource_Language] FOREIGN KEY([Language_Id])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] NOCHECK CONSTRAINT [FK_LocaleStringResource_Language]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH NOCHECK ADD  CONSTRAINT [FK_LocaleStringResource_LocaleResourceKey] FOREIGN KEY([LocaleResourceKey_Id])
REFERENCES [dbo].[LocaleResourceKey] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] NOCHECK CONSTRAINT [FK_LocaleStringResource_LocaleResourceKey]
GO
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUser_Badge_Badge] FOREIGN KEY([Badge_Id])
REFERENCES [dbo].[Badge] ([Id])
GO
ALTER TABLE [dbo].[MembershipUser_Badge] NOCHECK CONSTRAINT [FK_MembershipUser_Badge_Badge]
GO
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUser_Badge_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUser_Badge] NOCHECK CONSTRAINT [FK_MembershipUser_Badge_MembershipUser]
GO
ALTER TABLE [dbo].[MembershipUserPoints]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUserPoints_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUserPoints] NOCHECK CONSTRAINT [FK_MembershipUserPoints_MembershipUser]
GO
ALTER TABLE [dbo].[MembershipUsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_MembershipUsersInRoles_MembershipRole1] FOREIGN KEY([RoleIdentifier])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[MembershipUsersInRoles] CHECK CONSTRAINT [FK_MembershipUsersInRoles_MembershipRole1]
GO
ALTER TABLE [dbo].[MembershipUsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUsersInRoles_MembershipUser1] FOREIGN KEY([UserIdentifier])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUsersInRoles] NOCHECK CONSTRAINT [FK_MembershipUsersInRoles_MembershipUser1]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FK_Poll_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FK_Poll_MembershipUser]
GO
ALTER TABLE [dbo].[PollAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PollAnswer_Poll] FOREIGN KEY([Poll_Id])
REFERENCES [dbo].[Poll] ([Id])
GO
ALTER TABLE [dbo].[PollAnswer] CHECK CONSTRAINT [FK_PollAnswer_Poll]
GO
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_MembershipUser]
GO
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_PollAnswer] FOREIGN KEY([PollAnswer_Id])
REFERENCES [dbo].[PollAnswer] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_PollAnswer]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_MembershipUser]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Topic]
GO
ALTER TABLE [dbo].[PrivateMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_PrivateMessage_MembershipUser] FOREIGN KEY([UserTo_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PrivateMessage] NOCHECK CONSTRAINT [FK_PrivateMessage_MembershipUser]
GO
ALTER TABLE [dbo].[PrivateMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_PrivateMessage_MembershipUser1] FOREIGN KEY([UserFrom_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PrivateMessage] NOCHECK CONSTRAINT [FK_PrivateMessage_MembershipUser1]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_MembershipRole] FOREIGN KEY([NewMemberStartingRole])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_MembershipRole]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Category]
GO
ALTER TABLE [dbo].[Topic]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Topic] NOCHECK CONSTRAINT [FK_Topic_MembershipUser]
GO
ALTER TABLE [dbo].[Topic_Tag]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_Tag_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Topic_Tag] NOCHECK CONSTRAINT [FK_Topic_Tag_Topic]
GO
ALTER TABLE [dbo].[Topic_Tag]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_Tag_TopicTag] FOREIGN KEY([TopicTag_Id])
REFERENCES [dbo].[TopicTag] ([Id])
GO
ALTER TABLE [dbo].[Topic_Tag] NOCHECK CONSTRAINT [FK_Topic_Tag_TopicTag]
GO
ALTER TABLE [dbo].[TopicNotification]  WITH NOCHECK ADD  CONSTRAINT [FK_TopicNotification_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[TopicNotification] NOCHECK CONSTRAINT [FK_TopicNotification_MembershipUser]
GO
ALTER TABLE [dbo].[TopicNotification]  WITH CHECK ADD  CONSTRAINT [FK_TopicNotification_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[TopicNotification] CHECK CONSTRAINT [FK_TopicNotification_Topic]
GO
ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD  CONSTRAINT [FK_Vote_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Vote] NOCHECK CONSTRAINT [FK_Vote_MembershipUser]
GO
ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD  CONSTRAINT [FK_Vote_Post] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Vote] NOCHECK CONSTRAINT [FK_Vote_Post]
GO
