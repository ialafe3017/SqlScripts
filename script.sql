USE [CAMP]
GO
CREATE SCHEMA [applicant]
GO
CREATE SCHEMA [application]
GO
CREATE SCHEMA [candidate]
GO
CREATE SCHEMA [career]
GO
CREATE SCHEMA [preEmployment]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [applicant].[Applicant](
	[ApplicantId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[AssetId] [int] NULL,
	[EducationLevelId] [tinyint] NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](255) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[CoverLetter] [varchar](max) NULL,
	[IsAddedByEmployee] [bit] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Salary] [varchar](25) NOT NULL,
	[IsStarApplicant] [bit] NOT NULL,
	[HasConviction] [bit] NULL,
	[ConvictionReason] [varchar](500) NOT NULL,
	[HasUnemploymentCompensation] [bit] NULL,
	[IsAuthorizedToWorkInTheUnitedStates] [bit] NULL,
	[HasImmigrationCaseRequirement] [bit] NULL,
 CONSTRAINT [PK_applicant_Applicant] PRIMARY KEY CLUSTERED 
(
	[ApplicantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [applicant].[Asset](
	[AssetId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[FilePath] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_applicant_Asset] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [applicant].[EducationLevel](
	[EducationLevelId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LevelNumber] [tinyint] NOT NULL,
 CONSTRAINT [PK_applicant_EducationLevel] PRIMARY KEY CLUSTERED 
(
	[EducationLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[Permission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[RoleTypeId] [tinyint] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[UserActionId] [int] NOT NULL,
 CONSTRAINT [PK_application_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[RoleType](
	[RoleTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsVisibleOnScreen] [bit] NOT NULL,
 CONSTRAINT [PK_Application_RoleType] PRIMARY KEY CLUSTERED 
(
	[RoleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[UserAccount](
	[UserAccountId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[AdministrativeAssistantUserAccountId] [int] NULL,
	[StayInJobPosting] [bit] NOT NULL,
	[SendInviteToAttendee] [bit] NOT NULL,
	[ReceiveDailyEmailAlerts] [bit] NOT NULL,
	[CanAutoEliminateApplicant] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateDeactivated] [datetime2](2) NULL,
 CONSTRAINT [PK_Application_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[UserAccountToPhoneInterviewer](
	[UserAccountToPhoneInterviewerId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[UserAccountId] [int] NOT NULL,
	[PhoneInterviewerUserAccountId] [int] NOT NULL,
 CONSTRAINT [PK_Application_UserAccountToPhoneInterviewer] PRIMARY KEY CLUSTERED 
(
	[UserAccountToPhoneInterviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[UserAccountToRoleType](
	[UserAccountToRoleTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[UserAccountId] [int] NOT NULL,
	[RoleTypeId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Application_UserAccountToRoleType] PRIMARY KEY CLUSTERED 
(
	[UserAccountToRoleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [application].[UserAction](
	[UserActionId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ActionUrlPath] [varchar](50) NOT NULL,
 CONSTRAINT [PK_application_UserAction] PRIMARY KEY CLUSTERED 
(
	[UserActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [candidate].[Referral](
	[ReferralId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[ReferralTypeId] [tinyint] NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[HasAwardDisbursed] [bit] NOT NULL,
 CONSTRAINT [PK_candidate_Referral] PRIMARY KEY CLUSTERED 
(
	[ReferralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [candidate].[ReferralType](
	[ReferralTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_candidate_ReferralType] PRIMARY KEY CLUSTERED 
(
	[ReferralTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [candidate].[Status](
	[StatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_candidate_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[Company](
	[CompanyId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Career_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[Department](
	[DepartmentId] [tinyint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Career_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[JobDetail](
	[JobDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[JobPostingId] [int] NOT NULL,
	[JobTitle] [varchar](65) NOT NULL,
	[JobDescription] [varchar](max) NOT NULL,
	[JobDuties] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Career_JobDetail] PRIMARY KEY CLUSTERED 
(
	[JobDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[JobDetailOverride](
	[JobDetailOverrideId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[JobDetailid] [int] NOT NULL,
	[JobTitle] [varchar](65) NOT NULL,
	[JobDescription] [varchar](max) NOT NULL,
	[JobDuties] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Career_JobDetailOverride] PRIMARY KEY CLUSTERED 
(
	[JobDetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[JobPosting](
	[JobPostingId] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[CreatedByUserAccountId] [int] NOT NULL,
	[HiringManagerUserAccountId] [int] NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[LocationId] [smallint] NOT NULL,
	[DepartmentId] [tinyint] NULL,
	[JobTitle] [varchar](65) NOT NULL,
	[JobDescription] [varchar](max) NOT NULL,
	[JobDuties] [varchar](8000) NOT NULL,
	[DateSubmitted] [datetime2](2) NULL,
	[DateApproved] [datetime2](2) NULL,
	[DatePublished] [datetime2](2) NULL,
	[IsDisplayedOnSite] [bit] NOT NULL,
	[DateRefreshed] [datetime2](2) NULL,
	[DateRefreshedComment] [varchar](1000) NULL,
	[IsBlindPosting] [bit] NOT NULL,
	[DateRetired] [datetime2](2) NULL,
	[HasHelpDeskRequirement] [bit] NOT NULL,
 CONSTRAINT [PK_Career_JobPosting] PRIMARY KEY CLUSTERED 
(
	[JobPostingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [career].[Location](
	[LocationId] [smallint] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](2) NOT NULL,
	[DateUpdated] [datetime2](2) NOT NULL,
	[EmployeeManagementBuildingId] [int] NOT NULL,
	[EmployeeManagementZipCodeId] [int] NOT NULL,
	[GeographyPoint] [geography] NOT NULL,
 CONSTRAINT [PK_Career_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [applicant].[EducationLevel] ON 

INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (1, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'High School', 1)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (2, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Some College', 2)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (3, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Associates Degree', 3)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (4, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Bachelors Degree', 4)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (5, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Masters Degree', 5)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (6, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Doctorate', 6)
INSERT [applicant].[EducationLevel] ([EducationLevelId], [DateCreated], [DateUpdated], [Name], [LevelNumber]) VALUES (7, CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), CAST(N'2021-01-20T11:03:28.6100000' AS DateTime2), N'Other', 7)
SET IDENTITY_INSERT [applicant].[EducationLevel] OFF
GO
SET IDENTITY_INSERT [application].[Permission] ON 

INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (1, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 1, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (2, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 1, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (3, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 1, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (4, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 1, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (5, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 1, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (6, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 1, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (7, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 1, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (8, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 1, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (9, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 1, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (10, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 1, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (11, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 1, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (12, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 1, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (13, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 1, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (14, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 1, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (15, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 1, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (16, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 1, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (17, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 1, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (18, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 1, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (19, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 1, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (20, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 1, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (21, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (22, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (24, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (25, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (26, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (27, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (28, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (30, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (31, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (32, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (33, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 2, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (34, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 2, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (35, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 2, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (36, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 2, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (37, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 2, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (38, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 2, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (39, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 2, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (40, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 2, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (41, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 2, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (42, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 2, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (43, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 2, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (44, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 2, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (45, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 2, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (46, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 2, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (52, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 4, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (53, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 4, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (54, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (55, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 5, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (56, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 5, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (57, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 5, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (58, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 6, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (59, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 6, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (60, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 6, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (61, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 6, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (70, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 4, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (71, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 4, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (72, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 4, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (73, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 5, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (74, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (75, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 5, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (76, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 6, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (77, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 6, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (78, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 6, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (79, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 7, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (80, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 7, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (81, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 7, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (82, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 8, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (83, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (84, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 8, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (85, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 9, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (86, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (87, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 9, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (88, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 10, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (89, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (90, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 10, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (92, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 11, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (93, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 11, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (94, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 11, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (95, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 12, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (96, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (97, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 12, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (98, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (99, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (102, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (116, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (117, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (118, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (119, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 11, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (120, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (121, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (122, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (125, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (126, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 4, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (127, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 4, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (128, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (129, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 5, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (130, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 5, 10)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (131, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 6, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (132, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 6, 3)
GO
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (133, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 7, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (135, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 7, 10)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (137, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (138, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 8, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (139, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 8, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (140, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 8, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (141, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (142, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 9, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (143, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 9, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (144, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (145, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 10, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (146, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 11, 13)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (147, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (148, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 12, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (149, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (150, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 13, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (151, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 14, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (152, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (157, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (158, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 17, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (163, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 4, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (164, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 4, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (165, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 4, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (166, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 5, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (167, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (168, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 5, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (169, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 6, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (170, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 6, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (171, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 6, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (172, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 7, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (173, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 7, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (174, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 7, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (175, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 8, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (176, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (177, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 8, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (178, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 9, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (179, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (180, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 9, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (181, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 10, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (182, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (183, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 10, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (184, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 11, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (185, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 11, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (186, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 11, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (187, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 12, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (188, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (189, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 12, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (190, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (192, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 14, 14)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (193, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (196, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 17, 14)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (197, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (198, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (199, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (200, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (201, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (202, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (203, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (204, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (205, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (206, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (207, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 5, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (208, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 5, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (209, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 5, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (210, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 5, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (211, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 5, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (212, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 5, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (213, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 5, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (214, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (215, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (216, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (217, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (218, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (219, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (220, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (221, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 7)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (222, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (223, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (224, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (226, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (227, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (228, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (229, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (231, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (232, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (233, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (234, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (236, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (237, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (238, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (239, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (240, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (242, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (243, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (244, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (245, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (246, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (247, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (248, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (249, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 2)
GO
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (250, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (251, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 11)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (252, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (253, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (254, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (255, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (256, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (257, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (258, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (259, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (260, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (261, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (262, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (263, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (265, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (266, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (267, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (268, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (270, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (271, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (272, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (273, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (275, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 16)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (276, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (277, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (278, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (279, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (281, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 16)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (282, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (283, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (284, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (285, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 17)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (286, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (287, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (288, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (289, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 17)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (290, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (291, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (292, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (293, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 15)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (294, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (295, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (296, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (297, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 15)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (314, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (315, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 17, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (316, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 17, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (317, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 17, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (318, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 17, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (319, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 17, 18)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (320, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (321, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (322, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (324, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (325, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (326, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (327, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 6)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (329, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (330, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (331, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 18, 9)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (332, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 18, 10)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (334, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (335, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 18, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (336, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 18, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (337, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (338, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 18, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (339, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 18, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (340, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 18, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (342, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 18, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (343, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 18, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (360, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 20)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (361, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 20)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (364, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (365, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (366, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (369, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (370, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (371, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (372, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (373, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (374, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (377, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (378, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (379, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (381, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 1, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (382, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (383, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (384, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 5, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (385, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (386, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (387, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 8, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (388, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (389, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (390, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (391, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (392, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (393, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (396, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 17, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (397, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (403, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 1, 23)
GO
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (404, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (405, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (406, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 5, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (407, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (408, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 7, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (409, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 8, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (410, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (411, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 10, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (412, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 11, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (413, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 12, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (414, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (415, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (418, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 17, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (419, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 18, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (421, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 1, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (422, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 2, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (423, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 4, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (424, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 5, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (425, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 6, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (426, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 7, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (427, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 8, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (428, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 9, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (429, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 10, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (430, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 11, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (431, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 12, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (432, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 13, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (433, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 14, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (436, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 17, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (437, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 18, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (439, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 1, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (440, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 2, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (441, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 4, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (442, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 5, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (443, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 6, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (444, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 7, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (445, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 8, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (446, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 9, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (447, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 10, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (448, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 11, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (449, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 12, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (450, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 13, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (451, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 14, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (454, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 17, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (455, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 18, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (457, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 1, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (458, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 2, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (459, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 4, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (460, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 5, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (461, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 6, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (462, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 7, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (463, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 8, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (464, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 9, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (465, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 10, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (466, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 12, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (467, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 13, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (468, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 11, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (469, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 14, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (472, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 17, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (473, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 18, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (475, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (476, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (477, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 22)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (478, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 6, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (479, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 14, 24)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (480, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 17, 24)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (481, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 9, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (482, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 9, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (487, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 9, 13)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (490, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 7, 8)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (491, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (492, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 18, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (493, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 7, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (494, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 10, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (495, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 11, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (496, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 12, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (497, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 6, 28)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (498, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 12, 16)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (499, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 14, 29)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (500, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 19, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (501, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 19, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (502, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 19, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (503, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 19, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (504, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 19, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (505, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 19, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (506, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 19, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (507, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 19, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (508, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 19, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (509, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 19, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (510, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 19, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (511, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 19, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (512, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 19, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (513, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 19, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (514, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 19, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (515, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 19, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (516, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 19, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (517, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 19, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (518, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 19, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (519, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 19, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (520, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 19, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (521, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 19, 23)
GO
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (522, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 19, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (523, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 19, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (524, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 19, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (525, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 20, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (526, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 20, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (527, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 20, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (528, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 20, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (529, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 20, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (530, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 20, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (531, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 20, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (532, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 20, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (533, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 20, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (534, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 20, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (535, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 20, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (536, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 20, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (537, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 20, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (538, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 20, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (539, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 20, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (540, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 20, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (541, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 20, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (542, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 20, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (543, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 20, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (544, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 20, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (545, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 20, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (546, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 20, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (547, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 20, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (548, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 20, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (549, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 20, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (550, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 5, 30)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (551, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 13, 31)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (552, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 13, 31)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (553, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 14, 31)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (554, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 14, 31)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (555, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 4, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (556, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 5, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (557, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 6, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (558, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 7, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (559, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 8, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (560, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 9, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (561, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 10, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (562, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 11, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (563, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 12, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (564, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 13, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (565, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 8, 14, 32)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (566, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 21, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (567, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 21, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (568, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 21, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (569, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 21, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (570, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 21, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (571, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 21, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (572, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 21, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (573, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 21, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (574, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 21, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (575, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 21, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (576, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 21, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (577, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 21, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (578, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 21, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (579, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 21, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (580, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 21, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (581, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 21, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (582, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 21, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (583, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 21, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (584, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 21, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (585, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 21, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (586, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 21, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (587, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 21, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (588, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 21, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (589, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 21, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (590, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 21, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (591, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 22, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (592, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 22, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (593, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 22, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (594, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 22, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (595, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 22, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (596, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 22, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (597, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 22, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (598, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 22, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (599, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 22, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (600, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 22, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (601, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 22, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (602, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 22, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (603, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 22, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (604, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 22, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (605, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 22, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (606, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 5, 22, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (607, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 22, 1)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (608, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 22, 2)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (609, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 22, 3)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (610, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 7, 22, 4)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (611, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 22, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (612, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 22, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (613, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 3, 22, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (614, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 22, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (615, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 6, 22, 23)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (616, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 2, 33)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (617, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 2, 33)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (618, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 2, 33)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (619, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 1, 4, 33)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (620, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 2, 4, 33)
INSERT [application].[Permission] ([PermissionId], [DateCreated], [DateUpdated], [RoleTypeId], [StatusId], [UserActionId]) VALUES (621, CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), CAST(N'2021-01-21T14:38:53.3100000' AS DateTime2), 4, 4, 33)
GO
SET IDENTITY_INSERT [application].[Permission] OFF
GO
SET IDENTITY_INSERT [application].[RoleType] ON 

INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (1, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Hiring Manager', 1)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (2, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Admin Assistant', 1)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (3, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'HR Admin', 1)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (4, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Phone Interviewer', 1)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (5, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'User', 1)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (6, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Interviewing Hiring Manager', 0)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (7, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Candidate for Job Shared', 0)
INSERT [application].[RoleType] ([RoleTypeId], [DateCreated], [DateUpdated], [Name], [IsVisibleOnScreen]) VALUES (8, CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), CAST(N'2021-01-08T13:38:46.3700000' AS DateTime2), N'Follower', 1)
SET IDENTITY_INSERT [application].[RoleType] OFF
GO
SET IDENTITY_INSERT [application].[UserAccount] ON 

INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (83, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2168, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (84, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 823, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (85, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2103, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (86, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 724, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (87, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1016, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (88, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1661, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (89, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 914, 235, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (90, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1447, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (91, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1515, 88, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (92, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1162, 115, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (93, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1668, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (94, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 386, 294, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (95, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 775, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (96, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1539, 222, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (97, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1075, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (98, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1320, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (99, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1237, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (100, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1801, 284, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (101, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1005, 193, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (102, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3, 86, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (103, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 345, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (104, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1693, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (105, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1644, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (106, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1277, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (107, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1736, 336, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (108, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1116, 264, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (109, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1443, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (110, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2436, 193, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (111, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1157, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (112, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1997, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (113, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 779, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (114, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1834, 256, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (115, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1959, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (116, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2156, NULL, 0, 0, 1, 1, 1, CAST(N'2018-10-24T18:24:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (117, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1823, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (118, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1648, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (119, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1749, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (120, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1752, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (121, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 731, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (122, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1592, 134, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (123, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 741, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (124, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 46, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (125, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 411, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (126, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1572, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (127, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2591, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (128, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 399, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (129, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1645, 264, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (130, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1924, 214, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (131, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 243, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (132, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 557, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (133, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1581, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (134, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2587, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (135, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2769, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (136, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 27, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (137, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2856, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (138, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 999, 294, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (139, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2613, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (140, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2128, 176, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (141, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2820, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (142, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1496, 315, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (143, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 725, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (144, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1472, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (145, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2762, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (146, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3077, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (147, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3152, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (148, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2573, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (149, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3175, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (150, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2935, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (151, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3270, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (152, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2502, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (153, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 927, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (154, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2369, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (155, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3354, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (156, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2524, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (157, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2746, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (158, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3536, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (159, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3618, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (160, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3649, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (161, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3209, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (162, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1563, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (163, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2555, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (164, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2731, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (165, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3031, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (166, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2445, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (167, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3164, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (168, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2911, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (169, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1346, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (170, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1357, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (171, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1565, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (172, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1603, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (173, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1449, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (174, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1902, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (175, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 552, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (176, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4082, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (177, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2598, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (178, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3777, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (179, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3797, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (180, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1560, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (181, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2514, 284, 0, 0, 1, 1, 1, NULL)
GO
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (182, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2413, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (183, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4310, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (184, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2540, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (185, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3763, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (186, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2203, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (187, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3038, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (188, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2361, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (189, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3606, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (190, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2585, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (191, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2467, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (192, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2914, 316, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (193, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2964, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (194, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2120, 264, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (195, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2776, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (196, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2791, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (197, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1316, 263, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (198, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1055, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (199, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3255, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (200, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2961, NULL, 1, 1, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (201, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3082, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (202, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3887, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (203, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3712, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (204, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3395, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (205, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1634, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (206, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4266, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (207, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4531, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (208, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4776, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (209, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5088, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (210, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3024, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (211, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5153, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (212, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1362, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (213, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2328, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (214, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2106, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (215, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4732, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (216, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5189, 224, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (217, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3963, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (218, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1432, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (219, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2471, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (220, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3177, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (221, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4246, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (222, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1829, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (223, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5506, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (224, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5599, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (225, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1878, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (226, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4048, NULL, 1, 0, 1, 1, 1, CAST(N'2018-08-07T19:54:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (227, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5151, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (228, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4915, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (229, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5105, NULL, 1, 0, 1, 1, 1, CAST(N'2018-12-21T19:34:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (230, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2874, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (231, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4235, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (232, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5649, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (233, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5670, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (234, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2836, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (235, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3830, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (236, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5863, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (237, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5756, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (238, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2660, NULL, 1, 1, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (239, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5829, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (240, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4717, 315, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (241, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2472, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (242, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5969, 193, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (243, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5751, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (244, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4920, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (245, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3450, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (246, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2788, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (247, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3833, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (248, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6047, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (249, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6228, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (250, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3731, 193, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (251, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3104, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (252, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1304, 294, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (253, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3245, NULL, 0, 0, 0, 1, 1, CAST(N'2018-11-28T19:21:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (254, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5746, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (255, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1883, 160, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (256, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6376, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (257, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4279, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (258, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3081, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (259, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4453, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (260, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5238, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (261, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6391, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (262, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 65, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (263, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2814, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (264, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5559, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (265, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1990, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (266, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5216, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (267, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4955, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (268, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4721, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (269, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5047, NULL, 0, 0, 1, 1, 1, CAST(N'2018-08-10T17:25:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (270, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3455, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (271, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1221, 294, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (272, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3055, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (273, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4097, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (274, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1863, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (275, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6004, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (276, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3328, NULL, 0, 0, 1, 1, 1, CAST(N'2018-03-01T20:09:00.0000000' AS DateTime2))
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (277, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5452, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (278, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3215, 311, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (279, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3910, 160, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (280, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 688, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (281, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6726, NULL, 0, 0, 1, 1, 1, NULL)
GO
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (282, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3357, NULL, 0, 1, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (283, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5389, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (284, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2560, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (285, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3418, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (286, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4318, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (287, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2031, 236, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (288, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1877, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (289, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6235, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (290, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4639, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (291, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5995, 193, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (292, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6355, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (293, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4427, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (294, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6945, 94, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (295, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7144, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (296, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3576, 176, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (297, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5253, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (298, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7270, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (299, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6427, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (300, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5926, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (301, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5106, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (302, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2590, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (303, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7490, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (304, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6443, 176, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (305, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2312, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (306, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5566, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (307, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5726, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (308, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6546, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (309, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5706, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (310, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5862, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (311, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7948, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (312, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7904, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (313, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7852, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (314, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7979, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (315, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6210, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (316, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3028, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (317, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5529, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (318, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 676, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (319, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7973, 294, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (320, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7104, 176, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (321, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4323, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (322, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4826, 294, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (323, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5460, 263, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (324, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 7806, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (325, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1977, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (326, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 3916, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (327, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8334, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (328, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6507, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (329, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 1647, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (330, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8233, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (331, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5222, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (332, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6435, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (333, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 2706, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (334, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8287, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (335, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8274, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (336, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5209, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (337, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6897, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (338, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4716, 264, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (339, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6632, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (340, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5563, 315, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (341, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 973, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (342, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 5407, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (343, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8744, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (344, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 4422, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (345, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6386, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (346, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9797, NULL, 0, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (347, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 6314, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (348, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9240, NULL, 1, 0, 1, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (349, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8889, NULL, 1, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (350, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 11137, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (351, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9878, 346, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (352, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9983, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (353, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 11034, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (354, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9124, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (355, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 11639, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (356, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 13437, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (357, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 13500, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (358, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 12205, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (359, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 8300, NULL, 0, 0, 0, 1, 0, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (360, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 13501, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (361, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 13077, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (362, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 13167, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (363, CAST(N'2021-01-11T16:56:33.9900000' AS DateTime2), CAST(N'2021-01-11T17:06:01.5500000' AS DateTime2), 9064, NULL, 0, 0, 0, 1, 1, NULL)
INSERT [application].[UserAccount] ([UserAccountId], [DateCreated], [DateUpdated], [EmployeeNumber], [AdministrativeAssistantUserAccountId], [StayInJobPosting], [SendInviteToAttendee], [ReceiveDailyEmailAlerts], [CanAutoEliminateApplicant], [IsActive], [DateDeactivated]) VALUES (364, CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), 5774, 354, 0, 0, 0, 0, 1, NULL)
SET IDENTITY_INSERT [application].[UserAccount] OFF
GO
SET IDENTITY_INSERT [application].[UserAccountToPhoneInterviewer] ON 

INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (5, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 83, 161)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (6, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 84, 177)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (7, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 85, 247)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (8, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 86, 86)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (9, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 87, 88)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (10, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 88, 235)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (11, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 89, 235)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (12, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 90, 151)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (13, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 91, 247)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (14, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 92, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (15, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 93, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (16, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 94, 94)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (17, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 95, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (18, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 96, 275)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (19, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 97, 93)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (20, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 98, 172)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (21, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 101, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (22, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 102, 86)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (23, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 103, 239)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (24, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 104, 277)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (25, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 105, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (26, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 106, 267)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (27, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 108, 264)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (28, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 110, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (29, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 112, 186)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (30, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 113, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (31, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 115, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (32, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 116, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (33, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 117, 172)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (34, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 118, 172)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (35, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 119, 172)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (36, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 120, 183)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (37, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 126, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (38, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 127, 151)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (39, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 130, 214)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (40, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 137, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (41, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 138, 138)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (42, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 139, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (43, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 140, 176)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (44, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 142, 214)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (45, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 143, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (46, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 144, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (47, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 145, 173)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (48, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 146, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (49, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 147, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (50, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 149, 173)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (51, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 151, 151)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (52, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 152, 88)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (53, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 153, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (54, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 154, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (55, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 155, 161)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (56, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 156, 247)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (57, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 157, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (58, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 158, 228)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (59, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 160, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (60, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 161, 161)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (61, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 162, 162)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (62, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 164, 247)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (63, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 165, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (64, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 166, 166)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (65, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 167, 167)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (66, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 168, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (67, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 169, 164)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (68, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 174, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (69, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 177, 177)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (70, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 179, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (71, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 180, 180)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (72, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 182, 172)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (73, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 186, 186)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (74, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 188, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (75, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 191, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (76, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 192, 86)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (77, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 193, 193)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (78, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 195, 267)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (79, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 197, 263)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (80, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 198, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (81, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 199, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (82, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 200, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (83, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 204, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (84, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 206, 275)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (85, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 207, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (86, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 209, 209)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (87, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 210, 173)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (88, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 211, 161)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (89, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 212, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (90, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 213, 246)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (91, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 215, 215)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (92, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 216, 224)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (93, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 218, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (94, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 220, 220)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (95, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 221, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (96, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 222, 275)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (97, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 223, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (98, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 225, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (99, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 226, 226)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (100, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 227, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (101, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 229, 229)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (102, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 231, 171)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (103, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 234, 201)
GO
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (104, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 235, 235)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (105, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 236, 236)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (106, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 239, 239)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (107, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 240, 86)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (108, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 241, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (109, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 242, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (110, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 243, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (111, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 248, 196)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (112, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 250, 201)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (113, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 251, 251)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (114, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 252, 252)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (115, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 255, 160)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (116, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 259, 259)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (117, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 261, 247)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (118, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 265, 151)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (119, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 267, 267)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (120, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 270, 275)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (121, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 271, 271)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (122, CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), CAST(N'2021-01-11T17:07:13.6100000' AS DateTime2), 277, 277)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (123, CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), 364, 344)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (124, CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), 364, 345)
INSERT [application].[UserAccountToPhoneInterviewer] ([UserAccountToPhoneInterviewerId], [DateCreated], [DateUpdated], [UserAccountId], [PhoneInterviewerUserAccountId]) VALUES (125, CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4800000' AS DateTime2), 364, 346)
SET IDENTITY_INSERT [application].[UserAccountToPhoneInterviewer] OFF
GO
SET IDENTITY_INSERT [application].[UserAccountToRoleType] ON 

INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (1, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 148, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (2, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 95, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (3, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 143, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (4, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 170, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (5, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 172, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (6, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 165, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (7, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 87, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (8, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 201, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (9, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 139, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (10, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 110, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (11, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 153, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (12, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 134, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (13, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 134, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (14, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 177, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (15, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 177, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (16, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 155, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (17, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 214, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (18, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 214, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (19, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 160, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (20, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 160, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (21, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 160, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (22, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 219, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (23, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 86, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (24, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 86, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (25, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 86, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (26, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 86, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (27, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 102, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (28, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 199, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (29, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 218, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (30, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 198, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (31, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 225, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (32, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 89, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (33, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 136, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (34, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 137, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (35, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 205, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (36, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 147, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (37, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 101, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (38, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 179, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (39, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 233, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (40, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 233, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (41, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 233, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (42, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 227, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (43, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 227, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (44, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 242, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (45, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 244, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (46, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 245, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (47, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 112, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (48, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 248, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (49, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 248, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (50, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 91, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (51, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 247, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (52, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 85, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (53, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 250, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (54, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 157, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (55, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 246, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (56, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 246, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (57, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 253, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (58, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 255, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (59, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 135, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (60, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 178, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (61, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 88, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (62, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 88, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (63, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 88, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (64, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 262, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (65, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 263, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (66, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 263, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (67, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 197, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (68, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 108, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (69, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 108, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (70, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 113, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (71, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 241, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (72, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 230, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (73, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 193, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (74, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 193, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (75, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 211, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (76, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 161, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (77, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 161, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (78, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 161, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (79, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 124, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (80, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 130, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (81, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 122, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (82, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 122, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (83, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 215, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (84, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 215, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (85, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 141, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (86, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 173, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (87, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 126, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (88, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 111, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (89, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 111, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (90, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 131, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (91, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 164, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (92, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 266, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (93, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 268, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (94, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 269, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (95, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 220, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (96, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 220, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (97, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 129, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (98, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 273, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (99, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 274, 1)
GO
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (100, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 275, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (101, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 106, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (102, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 106, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (103, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 231, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (104, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 267, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (105, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 267, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (106, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 267, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (107, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 243, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (108, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 276, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (109, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 104, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (110, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 174, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (111, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 168, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (112, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 116, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (113, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 116, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (114, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 116, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (115, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 203, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (116, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 154, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (117, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 154, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (118, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 154, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (119, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 98, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (120, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 117, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (121, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 119, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (122, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 119, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (123, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 119, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (124, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 182, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (125, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 151, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (126, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 151, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (127, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 281, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (128, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 277, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (129, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 277, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (130, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 282, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (131, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 282, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (132, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 237, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (133, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 114, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (134, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 114, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (135, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 114, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (136, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 208, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (137, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 208, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (138, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 283, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (139, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 283, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (140, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 93, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (141, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 93, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (142, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 93, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (143, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 93, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (144, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 152, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (145, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 152, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (146, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 152, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (147, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 236, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (148, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 236, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (149, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 285, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (150, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 144, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (151, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 204, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (152, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 216, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (153, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 288, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (154, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 288, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (155, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 257, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (156, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 291, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (157, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 232, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (158, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 296, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (159, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 196, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (160, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 196, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (161, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 196, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (162, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 261, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (163, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 206, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (164, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 234, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (165, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 188, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (166, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 109, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (167, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 132, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (168, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 297, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (169, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 298, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (170, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 292, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (171, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 145, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (172, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 145, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (173, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 149, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (174, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 149, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (175, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 210, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (176, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 210, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (177, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 270, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (178, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 96, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (179, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 222, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (180, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 222, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (181, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 128, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (182, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 128, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (183, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 103, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (184, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 120, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (185, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 295, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (186, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 295, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (187, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 100, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (188, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 156, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (189, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 181, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (190, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 299, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (191, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 300, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (192, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 300, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (193, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 302, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (194, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 125, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (195, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 146, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (196, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 127, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (197, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 258, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (198, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 258, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (199, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 258, 4)
GO
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (200, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 293, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (201, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 293, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (202, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 279, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (203, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 279, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (204, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 191, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (205, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 191, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (206, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 191, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (207, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 191, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (208, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 115, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (209, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 115, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (210, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 92, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (211, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 238, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (212, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 238, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (213, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 221, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (214, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 207, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (215, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 190, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (216, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 190, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (217, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 251, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (218, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 251, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (219, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 162, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (220, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 162, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (221, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 280, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (222, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 180, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (223, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 180, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (224, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 271, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (225, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 271, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (226, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 138, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (227, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 138, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (228, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 94, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (229, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 94, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (230, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 94, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (231, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 166, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (232, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 166, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (233, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 166, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (234, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 99, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (235, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 99, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (236, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 121, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (237, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 133, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (238, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 235, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (239, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 235, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (240, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 235, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (241, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 84, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (242, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 306, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (243, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 306, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (244, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 167, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (245, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 167, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (246, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 226, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (247, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 226, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (248, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 226, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (249, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 305, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (250, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 305, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (251, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 254, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (252, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 272, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (253, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 286, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (254, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 286, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (255, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 212, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (256, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 252, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (257, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 252, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (258, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 105, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (259, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 202, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (260, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 186, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (261, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 186, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (262, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 171, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (263, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 171, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (264, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 171, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (265, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 301, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (266, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 301, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (267, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 217, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (268, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 217, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (269, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 213, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (270, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 123, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (271, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 307, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (272, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 308, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (273, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 309, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (274, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 310, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (275, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 176, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (276, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 176, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (277, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 140, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (278, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 287, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (279, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 175, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (280, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 239, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (281, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 239, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (282, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 239, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (283, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 294, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (284, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 294, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (285, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 294, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (286, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 209, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (287, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 209, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (288, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 90, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (289, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 249, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (290, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 249, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (291, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 249, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (292, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 249, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (293, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 311, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (294, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 311, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (295, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 278, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (296, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 194, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (297, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 313, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (298, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 313, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (299, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 314, 1)
GO
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (300, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 314, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (301, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 318, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (302, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 319, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (303, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 150, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (304, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 321, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (305, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 322, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (306, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 320, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (307, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 163, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (308, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 315, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (309, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 315, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (310, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 142, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (311, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 316, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (312, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 316, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (313, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 192, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (314, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 240, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (315, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 323, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (316, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 265, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (317, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 317, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (318, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 325, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (319, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 224, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (320, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 224, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (321, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 224, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (322, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 312, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (323, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 264, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (324, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 264, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (325, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 264, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (326, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 289, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (327, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 290, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (328, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 189, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (329, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 304, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (330, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 158, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (331, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 158, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (332, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 326, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (333, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 326, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (334, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 195, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (335, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 328, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (336, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 223, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (337, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 223, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (338, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 330, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (339, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 330, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (340, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 327, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (341, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 228, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (342, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 324, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (343, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 324, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (344, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 97, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (345, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 331, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (346, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 303, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (347, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 332, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (348, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 333, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (349, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 159, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (350, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 260, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (351, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 260, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (352, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 260, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (353, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 284, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (354, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 284, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (355, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 284, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (356, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 334, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (357, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 183, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (358, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 183, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (359, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 335, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (360, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 336, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (361, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 336, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (362, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 107, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (363, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 337, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (364, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 337, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (365, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 200, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (366, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 329, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (367, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 329, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (368, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 329, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (369, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 118, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (370, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 339, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (371, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 340, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (372, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 256, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (373, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 256, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (374, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 229, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (375, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 229, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (376, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 341, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (377, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 342, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (378, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 259, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (379, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 259, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (380, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 259, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (381, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 338, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (382, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 343, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (383, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 345, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (384, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 345, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (385, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 185, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (386, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 185, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (387, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 185, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (388, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 344, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (389, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 344, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (390, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 344, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (391, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 344, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (392, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 83, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (393, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 83, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (394, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (395, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (396, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (397, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (398, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (399, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 346, 8)
GO
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (400, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 347, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (401, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 347, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (402, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 348, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (403, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 348, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (404, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 349, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (405, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 164, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (406, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 169, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (407, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 350, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (408, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 187, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (409, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 187, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (410, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 187, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (411, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 351, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (412, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 352, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (413, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 353, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (414, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 356, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (415, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 357, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (416, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (417, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (418, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (419, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (420, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (421, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 358, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (422, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (423, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (424, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (425, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (426, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (427, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 355, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (428, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (429, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (430, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (431, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (432, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (433, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 354, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (434, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (435, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (436, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (437, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (438, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (439, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 359, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (440, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 184, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (441, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (442, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (443, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (444, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 4)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (445, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 5)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (446, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 360, 8)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (447, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 361, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (448, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 362, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (449, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 362, 3)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (450, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 363, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (451, CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), CAST(N'2021-01-11T17:04:26.8500000' AS DateTime2), 363, 2)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (452, CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), 364, 1)
INSERT [application].[UserAccountToRoleType] ([UserAccountToRoleTypeId], [DateCreated], [DateUpdated], [UserAccountId], [RoleTypeId]) VALUES (453, CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), CAST(N'2021-01-12T09:32:57.4600000' AS DateTime2), 364, 4)
SET IDENTITY_INSERT [application].[UserAccountToRoleType] OFF
GO
SET IDENTITY_INSERT [application].[UserAction] ON 

INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (1, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Add to Candidate Pool', N'addToPool')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (2, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Add to Folder', N'addToFolder')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (3, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Add a Note', N'addNote')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (4, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Send to Hiring Manager', N'sendToHiringManager')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (5, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Hand Off Candidate', N'handOff')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (6, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Eliminate as Candidate', N'eliminate')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (7, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Request a Phone Interview', N'requestPhone')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (8, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Schedule In Person Interview', N'scheduleInPerson')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (9, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Cancel Phone Interview', N'cancelPhone')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (10, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Recap Phone Interview', N'recapPhone')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (11, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Cancel In Person Interview', N'cancelInPerson')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (13, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Recap In Person Interview', N'recapInPerson')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (14, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Send Pre-Employment Data', N'sendPreEmployment')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (15, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Finalize Hire', N'hire')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (16, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Create Job Offer', N'createOffer')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (17, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Edit Job Offer', N'editOffer')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (18, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Rescind/Decline Job Offer', N'rescindOffer')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (20, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Accept Job Offer', N'acceptOffer')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (22, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Request In Person Interview', N'requestInPerson')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (23, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Edit Applicant Details', N'editApplicantDetails')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (24, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Finalize Pre-Employment', N'finalizePreEmployment')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (27, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Schedule a Phone Interview', N'schedulePhone')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (28, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Request Asst. Schedule Interview', N'assistantScheduleInPerson')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (29, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Enter Pre-Employment Data', N'enterPreEmployment')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (30, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Enter Phone Interview Notes', N'phoneInterviewNotes')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (31, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Edit Hiring Details', N'editHiringDetails')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (32, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Follow Candidate', N'followCandidate')
INSERT [application].[UserAction] ([UserActionId], [DateCreated], [DateUpdated], [Name], [ActionUrlPath]) VALUES (33, CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), CAST(N'2021-01-21T14:38:51.3300000' AS DateTime2), N'Request Candidate Availability', N'requestCandidateAvailability')
SET IDENTITY_INSERT [application].[UserAction] OFF
GO
SET IDENTITY_INSERT [candidate].[ReferralType] ON 

INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (1, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'College')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (2, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Clark Website')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (3, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Craigslist')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (4, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Monster')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (5, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Pennysaver')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (6, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Newspaper')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (7, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Job Fair')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (8, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Employee (Current or Former)')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (9, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Recruiter')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (10, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Indeed')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (11, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Other')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (12, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'LinkedIn')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (13, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Career Builder')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (14, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Handshake')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (15, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Stack Overflow')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (17, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Walk-in')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (18, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'WebstaurantStore Website')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (19, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Radio Advertisement')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (20, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Glassdoor')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (21, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Purple Briefcase')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (22, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Television Advertisement')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (23, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Magazine')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (24, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'ZipRecruiter')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (25, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Facebook')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (26, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Drexel Dragon Jobs')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (27, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Nittany Lion Careers')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (28, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Friend/Family Member')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (29, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Google')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (30, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Neuvoo')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (31, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Simply Hired')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (32, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Billboard')
INSERT [candidate].[ReferralType] ([ReferralTypeId], [DateCreated], [DateUpdated], [Name]) VALUES (33, CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), CAST(N'2021-01-20T09:42:22.0000000' AS DateTime2), N'Maryland Workforce Exchange')
SET IDENTITY_INSERT [candidate].[ReferralType] OFF
GO
SET IDENTITY_INSERT [candidate].[Status] ON 

INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (1, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Applicant')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (2, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Candidate')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (4, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Phone Interview Requested')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (5, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Phone Interview Scheduled')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (6, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Phone Interview Canceled')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (7, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Phone Interview Complete')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (8, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'In Person Interview Requested')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (9, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'In Person Interview Scheduled')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (10, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'In Person Interview Canceled')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (11, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'In Person Interview Held')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (12, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'In Person Interview Complete')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (13, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Position Offered')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (14, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Offer Accepted')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (17, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Hired')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (18, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Phone Interview Held')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (19, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Separated (Eligible for Rehire)')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (20, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Separated')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (21, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Internship Ended (Eligible for Rehire)')
INSERT [candidate].[Status] ([StatusId], [DateCreated], [DateUpdated], [Name]) VALUES (22, CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), CAST(N'2021-01-21T14:38:51.9600000' AS DateTime2), N'Internship Ended')
SET IDENTITY_INSERT [candidate].[Status] OFF
GO
SET IDENTITY_INSERT [career].[Department] ON 

INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (1, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Internship')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (2, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Service')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (3, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Logistics')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (4, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Management')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (5, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Admin/Support')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (6, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Purchasing')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (7, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'IT')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (8, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Marketing')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (9, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Accounting')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (10, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Customer Solutions')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (11, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Distribution')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (12, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Engineering')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (13, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Sales')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (14, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Content')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (15, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Development')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (16, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Photo/Video')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (17, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Design and Construction')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (18, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Food Service')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (19, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Child Care Center')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (21, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Financial')
INSERT [career].[Department] ([DepartmentId], [DateCreated], [DateUpdated], [Name]) VALUES (22, CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), CAST(N'2021-01-19T10:07:20.0300000' AS DateTime2), N'Legal')
SET IDENTITY_INSERT [career].[Department] OFF
GO
SET IDENTITY_INSERT [career].[Location] ON 

INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (1, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 741, 0xE6100000010C34D769A4A53E44407FF62345649653C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (2, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 742, 0xE6100000010C05C078060D414440FC1D8A027D9853C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (3, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 15, 5591, 0xE6100000010C5D50DF32A71B444021C84109333B53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (4, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 13, 5588, 0xE6100000010C87C43D963E20444033DC80CF0F4553C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (5, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 12029, 0xE6100000010C3DB83B6BB7154440863DEDF0D71653C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (6, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 40, 12029, 0xE6100000010C3DB83B6BB7154440863DEDF0D71653C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (7, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 4, 20983, 0xE6100000010C77103B53E80C444058C51B99470C53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (8, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 34, 20983, 0xE6100000010C77103B53E80C444058C51B99470C53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (9, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 43, 20983, 0xE6100000010C77103B53E80C444058C51B99470C53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (10, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 24, 21439, 0xE6100000010C8C67D0D03F114440FAB31F29221D53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (11, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 28, 21439, 0xE6100000010C8C67D0D03F114440FAB31F29221D53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (12, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 33, 21439, 0xE6100000010C8C67D0D03F114440FAB31F29221D53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (13, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 1, 35705, 0xE6100000010C62F3716DA80444400CC85EEFFE0C53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (14, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 38, 41663, 0xE6100000010C50DF32A7CBFA4340D89E5912A01053C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (15, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 3, 20367, 0xE6100000010C2041F163CC0944405DE15D2EE21353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (16, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 20367, 0xE6100000010C2041F163CC0944405DE15D2EE21353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (17, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 10, 20367, 0xE6100000010C2041F163CC0944405DE15D2EE21353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (18, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 20367, 0xE6100000010C2041F163CC0944405DE15D2EE21353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (19, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 6, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (20, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 8, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (21, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 10, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (22, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 15, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (23, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 20, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (24, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 23, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (25, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 31, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (26, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (27, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 40, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (28, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 42, 20368, 0xE6100000010C1CF0F96184004440C078060DFD0F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (29, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 24, 20369, 0xE6100000010CF08AE07F2B0144405AD8D30E7F1753C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (30, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 20369, 0xE6100000010CF08AE07F2B0144405AD8D30E7F1753C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (31, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 7, 3725, 0xE6100000010CC66D3480B7804440CFBD874B8E1B53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (32, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 3725, 0xE6100000010CC66D3480B7804440CFBD874B8E1B53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (33, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 20911, 0xE6100000010C69A8514832554440D00F238447DB52C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (34, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 16, 3242, 0xE6100000010CC68A1A4CC354444009A7052FFAD852C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (35, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 11135, 0xE6100000010C4C6C3EAE0D5944409869FB5756D252C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (36, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 16485, 0xE6100000010C1630815B777B4440D8648D7A880053C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (37, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 36971, 0xE6100000010CC503CAA65C8544400F62670A9DD752C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (38, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 34682, 0xE6100000010CF7E461A1D6AC444015E3FC4D28EC52C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (39, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 41527, 0xE6100000010CA5660FB4029B44402F34D769A4F552C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (40, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 41532, 0xE6100000010CDE54A4C2D8A24440B1F9B83654F852C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (41, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 41539, 0xE6100000010CDE54A4C2D8A24440B1F9B83654F852C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (42, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 39, 39915, 0xE6100000010C3B191C25AF1A4440FF78AF5A99C252C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (43, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 19, 3061, 0xE6100000010C55302AA91310444024EEB1F4A1BF52C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (44, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 21, 31510, 0xE6100000010C48DC63E9432B44403BDF4F8D97FE52C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (45, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 26272, 0xE6100000010C0E10CCD1E3CB4340BDA94885B1E952C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (46, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 25, 26272, 0xE6100000010C0E10CCD1E3CB4340BDA94885B1E952C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (47, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 21065, 0xE6100000010CA48D23D6E2534340095053CBD6D452C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (48, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 40234, 0xE6100000010C38F3AB3940744340FB05BB61DB3E53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (49, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 40226, 0xE6100000010C4A9869FB57724340A94D9CDCEF4053C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (50, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 4166, 0xE6100000010C7BA01518B26A4340079964E42C3853C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (51, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 41, 10300, 0xE6100000010C4D327216F66C43409430D3F6AF3853C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (52, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 5, 8020, 0xE6100000010CBC5CC477629A43409487855AD33853C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (53, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 29, 15698, 0xE6100000010CEFC9C342ADA94340E223624A242F53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (54, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 45, 2306, 0xE6100000010C107A36AB3EA7434086AC6EF59C2653C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (55, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 5, 2273, 0xE6100000010C88855AD3BCA34340689604A8A92353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (56, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 2273, 0xE6100000010C88855AD3BCA34340689604A8A92353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (57, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 27, 2273, 0xE6100000010C88855AD3BCA34340689604A8A92353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (58, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 2273, 0xE6100000010C88855AD3BCA34340689604A8A92353C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (59, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 5, 1078, 0xE6100000010C37A6272CF1804340AC90F2936A2553C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (60, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 17, 9044, 0xE6100000010CFFB27BF2B0CC4340A7052FFA0AB653C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (61, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 1329, 0xE6100000010CCEC29E76F86F4340E162450DA64753C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (62, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 36, 1339, 0xE6100000010CB0FECF61BE7043405305A3923A4753C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (63, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 31894, 0xE6100000010C74982F2FC0C64240A1D634EF385D53C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (64, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 9, 31899, 0xE6100000010C4AEF1B5F7BC24240355EBA490C6053C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (65, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 35, 17787, 0xE6100000010C0FB4024356B3414076E09C11A53754C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (66, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 6606, 0xE6100000010C7FBC57AD4CA441407B14AE47E13054C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (67, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 35, 6606, 0xE6100000010C7FBC57AD4CA441407B14AE47E13054C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (68, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 35, 6607, 0xE6100000010CCF6BEC12D5A34140F7065F984C3754C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (69, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 10, 6609, 0xE6100000010C518369183EA64140F302ECA3533954C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (70, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 35, 6609, 0xE6100000010C518369183EA64140F302ECA3533954C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (71, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 12, 357, 0xE6100000010CF98381E7DE8B3F40EC12D55B030555C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (72, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 44, 28362, 0xE6100000010CA4C2D842908B3C40207BBDFBE35754C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (73, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 22, 37553, 0xE6100000010CC5E6E3DA50F13B40B0389CF9D5A054C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (74, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 22, 37558, 0xE6100000010CAB2688BA0F083C40B9C2BB5CC49F54C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (75, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 44, 37563, 0xE6100000010CA2B437F8C2EC3B40D5B2B5BE489854C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (76, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 22, 37571, 0xE6100000010C16FBCBEEC9EB3B40868F882991A054C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (77, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 44, 33498, 0xE6100000010C742497FF90C63B408CD651D504A954C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (78, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 11, 4263, 0xE6100000010C4DD6A88768743B4027A5A0DB4BA254C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (79, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 37, 4263, 0xE6100000010C4DD6A88768743B4027A5A0DB4BA254C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (80, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 11, 4270, 0xE6100000010C70B6B9313D793B400AF4893C49AA54C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (81, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 14, 22572, 0xE6100000010CC364AA6054A642402B357BA015E255C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (82, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 30, 10782, 0xE6100000010C20240B98C0054140F1113125921458C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (83, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 32, 36240, 0xE6100000010CE8305F5E80D53D405DA79196CADB57C0)
INSERT [career].[Location] ([LocationId], [DateCreated], [DateUpdated], [EmployeeManagementBuildingId], [EmployeeManagementZipCodeId], [GeographyPoint]) VALUES (84, CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), CAST(N'2021-01-19T16:30:40.4000000' AS DateTime2), 18, 9542, 0xE6100000010C77BE9F1A2F8D4340D00A0C59DDDE5DC0)
SET IDENTITY_INSERT [career].[Location] OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Applicant_EducationLevel_LevelNumber] ON [applicant].[EducationLevel]
(
	[LevelNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Applicant_EducationLevel_Name] ON [applicant].[EducationLevel]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_Permission_RoleTypeId_StatusId_UserActionId] ON [application].[Permission]
(
	[RoleTypeId] ASC,
	[StatusId] ASC,
	[UserActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_RoleType_Name] ON [application].[RoleType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_UserAccount_EmployeeNumber] ON [application].[UserAccount]
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_UserAccountToPhoneInterviewer_UserAccountId_PhoneInterviewerUserAccountId] ON [application].[UserAccountToPhoneInterviewer]
(
	[UserAccountId] ASC,
	[PhoneInterviewerUserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_UserAccountToRoleType_UserAccountId_RoleTypeId] ON [application].[UserAccountToRoleType]
(
	[UserAccountId] ASC,
	[RoleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Application_UserAction_Name] ON [application].[UserAction]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_candidate_ReferralType_Name] ON [candidate].[ReferralType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Candidate_Status_Name] ON [candidate].[Status]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Career_Company_Name] ON [career].[Company]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Career_Department_Name] ON [career].[Department]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Career_Location_EmployeeManagementBuildingId_EmployeeManagementZipCodeId] ON [career].[Location]
(
	[EmployeeManagementBuildingId] ASC,
	[EmployeeManagementZipCodeId] ASC
)
INCLUDE([GeographyPoint]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_MiddleName]  DEFAULT (NULL) FOR [MiddleName]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_CoverLetter]  DEFAULT ('') FOR [CoverLetter]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_IsAddedByEmployee]  DEFAULT ((0)) FOR [IsAddedByEmployee]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_Salary]  DEFAULT ('') FOR [Salary]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_IsStarApplicant]  DEFAULT ((0)) FOR [IsStarApplicant]
GO
ALTER TABLE [applicant].[Applicant] ADD  CONSTRAINT [DF_Applicant_Applicant_ConvictionReason]  DEFAULT ('') FOR [ConvictionReason]
GO
ALTER TABLE [applicant].[Asset] ADD  CONSTRAINT [DF_applicant_Asset_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [applicant].[Asset] ADD  CONSTRAINT [DF_applicant_Asset_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [applicant].[EducationLevel] ADD  CONSTRAINT [DF_applicant_EducationLevel_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [applicant].[EducationLevel] ADD  CONSTRAINT [DF_applicant_EducationLevel_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[Permission] ADD  CONSTRAINT [DF_application_Permission_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[Permission] ADD  CONSTRAINT [DF_application_Permission_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[RoleType] ADD  CONSTRAINT [DF_Application_RoleType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[RoleType] ADD  CONSTRAINT [DF_Application_RoleType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_StayInJobPosting]  DEFAULT ((0)) FOR [StayInJobPosting]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_SendInviteToAttendee]  DEFAULT ((0)) FOR [SendInviteToAttendee]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_ReceiveDailyEmailAlerts]  DEFAULT ((0)) FOR [ReceiveDailyEmailAlerts]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_CanAutoEliminateApplicant]  DEFAULT ((0)) FOR [CanAutoEliminateApplicant]
GO
ALTER TABLE [application].[UserAccount] ADD  CONSTRAINT [DF_Application_UserAccount_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer] ADD  CONSTRAINT [DF_Application_UserAccountToPhoneInterviewer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer] ADD  CONSTRAINT [DF_Application_UserAccountToPhoneInterviewer_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[UserAccountToRoleType] ADD  CONSTRAINT [DF_Application_UserAccountToRoleType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[UserAccountToRoleType] ADD  CONSTRAINT [DF_Application_UserAccountToRoleType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [application].[UserAction] ADD  CONSTRAINT [DF_application_UserAction_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [application].[UserAction] ADD  CONSTRAINT [DF_application_UserAction_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [candidate].[Referral] ADD  CONSTRAINT [DF_candidate_Referral_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [candidate].[Referral] ADD  CONSTRAINT [DF_candidate_Referral_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [candidate].[Referral] ADD  CONSTRAINT [DF_candidate_Referral_HasAwardDisbursed]  DEFAULT (CONVERT([bit],(0))) FOR [HasAwardDisbursed]
GO
ALTER TABLE [candidate].[Status] ADD  CONSTRAINT [DF_candidate_Status_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [candidate].[Status] ADD  CONSTRAINT [DF_candidate_Status_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[Company] ADD  CONSTRAINT [DF_Career_Company_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[Company] ADD  CONSTRAINT [DF_Career_Company_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[Department] ADD  CONSTRAINT [DF_Career_Department_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[Department] ADD  CONSTRAINT [DF_Career_Department_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[JobDetail] ADD  CONSTRAINT [DF_Career_JobDetail_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[JobDetail] ADD  CONSTRAINT [DF_Career_JobDetail_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[JobDetail] ADD  CONSTRAINT [DF_Career_JobDetail_JobDuties]  DEFAULT ('') FOR [JobDuties]
GO
ALTER TABLE [career].[JobDetailOverride] ADD  CONSTRAINT [DF_Career_JobDetailOverride_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[JobDetailOverride] ADD  CONSTRAINT [DF_Career_JobDetailOverride_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[JobDetailOverride] ADD  CONSTRAINT [DF_Career_JobDetailOverride_JobDuties]  DEFAULT ('') FOR [JobDuties]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_JobDuties]  DEFAULT ('') FOR [JobDuties]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_IsDisplayedOnSite]  DEFAULT ((0)) FOR [IsDisplayedOnSite]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_DateRefreshedComment]  DEFAULT ('') FOR [DateRefreshedComment]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_IsBlindPosting]  DEFAULT ((0)) FOR [IsBlindPosting]
GO
ALTER TABLE [career].[JobPosting] ADD  CONSTRAINT [DF_Career_JobPosting_HasHelpDeskRequirement]  DEFAULT ((0)) FOR [HasHelpDeskRequirement]
GO
ALTER TABLE [career].[Location] ADD  CONSTRAINT [DF_Career_Location_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [career].[Location] ADD  CONSTRAINT [DF_Career_Location_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [applicant].[Applicant]  WITH CHECK ADD  CONSTRAINT [FK_Applicant_Applicant_Applicant_Asset] FOREIGN KEY([AssetId])
REFERENCES [applicant].[Asset] ([AssetId])
GO
ALTER TABLE [applicant].[Applicant] CHECK CONSTRAINT [FK_Applicant_Applicant_Applicant_Asset]
GO
ALTER TABLE [applicant].[Applicant]  WITH CHECK ADD  CONSTRAINT [FK_Applicant_Applicant_Applicant_EducationLevel] FOREIGN KEY([EducationLevelId])
REFERENCES [applicant].[EducationLevel] ([EducationLevelId])
GO
ALTER TABLE [applicant].[Applicant] CHECK CONSTRAINT [FK_Applicant_Applicant_Applicant_EducationLevel]
GO
ALTER TABLE [application].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Application_Permission_Application_RoleType] FOREIGN KEY([RoleTypeId])
REFERENCES [application].[RoleType] ([RoleTypeId])
GO
ALTER TABLE [application].[Permission] CHECK CONSTRAINT [FK_Application_Permission_Application_RoleType]
GO
ALTER TABLE [application].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Application_Permission_Application_UserAction] FOREIGN KEY([UserActionId])
REFERENCES [application].[UserAction] ([UserActionId])
GO
ALTER TABLE [application].[Permission] CHECK CONSTRAINT [FK_Application_Permission_Application_UserAction]
GO
ALTER TABLE [application].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Application_Role_Candidate_Status] FOREIGN KEY([StatusId])
REFERENCES [candidate].[Status] ([StatusId])
GO
ALTER TABLE [application].[Permission] CHECK CONSTRAINT [FK_Application_Role_Candidate_Status]
GO
ALTER TABLE [application].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_Application_UserAccount_AdministrativeAssistantUserAccountId_Application_UserAccount] FOREIGN KEY([AdministrativeAssistantUserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [application].[UserAccount] CHECK CONSTRAINT [FK_Application_UserAccount_AdministrativeAssistantUserAccountId_Application_UserAccount]
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer]  WITH CHECK ADD  CONSTRAINT [FK_Application_UserAccountToPhoneInterviewer_PhoneInterviewerUserAccountId_Application_UserAccount] FOREIGN KEY([PhoneInterviewerUserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer] CHECK CONSTRAINT [FK_Application_UserAccountToPhoneInterviewer_PhoneInterviewerUserAccountId_Application_UserAccount]
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer]  WITH CHECK ADD  CONSTRAINT [FK_Application_UserAccountToPhoneInterviewer_UserAccountId_Application_UserAccount] FOREIGN KEY([UserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer] CHECK CONSTRAINT [FK_Application_UserAccountToPhoneInterviewer_UserAccountId_Application_UserAccount]
GO
ALTER TABLE [application].[UserAccountToRoleType]  WITH CHECK ADD  CONSTRAINT [FK_Application_UserAccountToRoleType_Application_RoleType] FOREIGN KEY([RoleTypeId])
REFERENCES [application].[RoleType] ([RoleTypeId])
GO
ALTER TABLE [application].[UserAccountToRoleType] CHECK CONSTRAINT [FK_Application_UserAccountToRoleType_Application_RoleType]
GO
ALTER TABLE [application].[UserAccountToRoleType]  WITH CHECK ADD  CONSTRAINT [FK_Application_UserAccountToRoleType_Application_UserAccount] FOREIGN KEY([UserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [application].[UserAccountToRoleType] CHECK CONSTRAINT [FK_Application_UserAccountToRoleType_Application_UserAccount]
GO
ALTER TABLE [candidate].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_candidate_Referral_candidate_ReferralType] FOREIGN KEY([ReferralTypeId])
REFERENCES [candidate].[ReferralType] ([ReferralTypeId])
GO
ALTER TABLE [candidate].[Referral] CHECK CONSTRAINT [FK_candidate_Referral_candidate_ReferralType]
GO
ALTER TABLE [career].[JobDetail]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobDetail_Career_JobPosting] FOREIGN KEY([JobPostingId])
REFERENCES [career].[JobPosting] ([JobPostingId])
GO
ALTER TABLE [career].[JobDetail] CHECK CONSTRAINT [FK_Career_JobDetail_Career_JobPosting]
GO
ALTER TABLE [career].[JobDetailOverride]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobDetailOverride_Career_JobDetail] FOREIGN KEY([JobDetailid])
REFERENCES [career].[JobDetail] ([JobDetailId])
GO
ALTER TABLE [career].[JobDetailOverride] CHECK CONSTRAINT [FK_Career_JobDetailOverride_Career_JobDetail]
GO
ALTER TABLE [career].[JobPosting]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobPosting_CompanyId_Career_Company] FOREIGN KEY([CompanyId])
REFERENCES [career].[Company] ([CompanyId])
GO
ALTER TABLE [career].[JobPosting] CHECK CONSTRAINT [FK_Career_JobPosting_CompanyId_Career_Company]
GO
ALTER TABLE [career].[JobPosting]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobPosting_CreatedByUserAccountId_Application_UserAccount] FOREIGN KEY([CreatedByUserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [career].[JobPosting] CHECK CONSTRAINT [FK_Career_JobPosting_CreatedByUserAccountId_Application_UserAccount]
GO
ALTER TABLE [career].[JobPosting]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobPosting_DepartmentId_Career_Department] FOREIGN KEY([DepartmentId])
REFERENCES [career].[Department] ([DepartmentId])
GO
ALTER TABLE [career].[JobPosting] CHECK CONSTRAINT [FK_Career_JobPosting_DepartmentId_Career_Department]
GO
ALTER TABLE [career].[JobPosting]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobPosting_HiringManagerUserAccountId_Application_UserAccount] FOREIGN KEY([HiringManagerUserAccountId])
REFERENCES [application].[UserAccount] ([UserAccountId])
GO
ALTER TABLE [career].[JobPosting] CHECK CONSTRAINT [FK_Career_JobPosting_HiringManagerUserAccountId_Application_UserAccount]
GO
ALTER TABLE [career].[JobPosting]  WITH CHECK ADD  CONSTRAINT [FK_Career_JobPosting_LocationId_Career_Location] FOREIGN KEY([LocationId])
REFERENCES [career].[Location] ([LocationId])
GO
ALTER TABLE [career].[JobPosting] CHECK CONSTRAINT [FK_Career_JobPosting_LocationId_Career_Location]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [application].[StoGetAdministrativeAssistants]
/************************************************************************************
Object Name: application.StoGetAdministrativeAssistants
Created By:  Michael Weber

Parameter List:
    N/A

Output List:
    UserAccountId  INT
	EmployeeNumber INT 

Purpose: Returns active user data for those with an "Admin Assistant" role assigned to them.

------------------------------------------------------------------------------------
Change History: 
01/11/2021 - Initial creation.

************************************************************************************/
AS
BEGIN 
    SET NOCOUNT ON;

    SELECT UA.UserAccountId
	     , UA.EmployeeNumber
	FROM application.UserAccount UA
	JOIN application.UserAccountToRoleType UTRT ON UTRT.UserAccountId = UA.UserAccountId
	JOIN application.RoleType RT ON RT.RoleTypeId = UTRT.RoleTypeId
	WHERE RT.Name = 'Admin Assistant'
	AND UA.IsActive = CAST(1 AS BIT);

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [application].[StoGetPhoneInterviewers]
/************************************************************************************
Object Name: application.StoGetPhoneInterviewers
Created By:  Michael Weber

Parameter List:
    N/A

Output List:
    UserAccountId  INT
	EmployeeNumber INT 

Purpose: Returns active user data for those with an "Phone Interviewer" role assigned to them.

------------------------------------------------------------------------------------
Change History: 
01/11/2021 - Initial creation.

************************************************************************************/
AS
BEGIN 
    SET NOCOUNT ON;

    SELECT UA.UserAccountId
	     , UA.EmployeeNumber
	FROM application.UserAccount UA
	JOIN application.UserAccountToRoleType UTRT ON UTRT.UserAccountId = UA.UserAccountId
	JOIN application.RoleType RT ON RT.RoleTypeId = UTRT.RoleTypeId
	WHERE RT.Name = 'Phone Interviewer'
	AND UA.IsActive = CAST(1 AS BIT);

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [application].[StoGetRoleTypes]
/************************************************************************************
Object Name: application.StoGetRoleTypes
Created By:  Michael Weber

Parameter List:
    N/A

Output List:
    RoleTypeId TINYINT
	Name VARCHAR(50)

Purpose: Returns the role type and it's id

------------------------------------------------------------------------------------
Change History: 
01/11/2021 - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    SELECT RoleTypeId
	      , Name
	FROM application.RoleType
	WHERE IsVisibleOnScreen = CAST(1 AS BIT)
	ORDER BY Name;

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [application].[StoGetUserAccountDetails]  @UserAccountId INT
/************************************************************************************
Object Name: application.GetUserAccountDetails
Created By:  Israel Alafe

Parameter List:
    @UserAccountId INT
    

Output List:
             [UserAccountId]
	         [EmployeeNumber]
		     [AdminAssistant_EmpNo]
		     [PhoneInterviewer_EmpNo]
		     [RoleName]
		     [StayInJobPosting]
             [SendInviteToAttendee]
             [ReceiveDailyEmailAlerts]
             [CanAutoEliminateApplicant]
             [IsActive]
             [DateDeactivated]

Purpose: Gets account details for  the specified UserAccountId

------------------------------------------------------------------------------------
Change History: 
01/21/2021 - Initial creation IOA.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;
	SELECT UA.[UserAccountId],
	       UA.[EmployeeNumber],
		   AUA.[EmployeeNumber] AdminAssistant_EmpNo,
		   PUA.[EmployeeNumber] PhoneInterviewer_EmpNo,
		   RT.[Name] AS RoleName,
		   UA.[StayInJobPosting],
           UA.[SendInviteToAttendee],
           UA.[ReceiveDailyEmailAlerts],
           UA.[CanAutoEliminateApplicant],
           UA.[IsActive],
           UA.[DateDeactivated]
		   
    FROM [application].[UserAccount] UA 
	LEFT JOIN [application].[UserAccountToPhoneInterviewer] P ON P.[UserAccountId] = UA.[UserAccountId]
	LEFT JOIN [application].[UserAccount] PUA ON  PUA.[UserAccountId] = P.[PhoneInterviewerUserAccountId]
	LEFT JOIN [application].[UserAccount] AUA ON AUA.[UserAccountId] = UA.[AdministrativeAssistantUserAccountId]
	LEFT JOIN [application].[UserAccountToRoleType] UTR ON UTR.[UserAccountId] = UA.[UserAccountId]
	LEFT JOIN [application].[RoleType] RT ON RT.[RoleTypeId] = UTR.[RoleTypeId]
    WHERE UA.[UserAccountId] = @UserAccountId;
    

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [application].[StoGetUserAccounts] @IsActiveValue BIT = 1
/************************************************************************************
Object Name: application.StoGetUserAccounts
Created By:  Michael Weber

Parameter List:
    @IsActiveValue       BIT

Output List:
	UserAccountId        INT
	EmployeeNumber       INT
	IsActive             BIT
	[HiringManager]		 BIT
	[AdminAssistant]	 BIT
	[HRAdmin]			 BIT
	[PhoneInterviewer]	 BIT
	[User]				 BIT
	Follower			 BIT

Purpose: Returns a grid vidw of users.

------------------------------------------------------------------------------------
Change History: 
01/07/2021 - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    CREATE TABLE #gridView
    (UserAccountId               INT PRIMARY KEY NOT NULL, 
     EmployeeNumber              INT NOT NULL, 
     [HiringManager]             BIT NOT NULL DEFAULT 0, 
     [AdminAssistant]            BIT NOT NULL DEFAULT 0, 
     [HRAdmin]                   BIT NOT NULL DEFAULT 0, 
     [PhoneInterviewer]          BIT NOT NULL DEFAULT 0, 
     [User]                      BIT NOT NULL DEFAULT 0, 
     [InterviewingHiringManager] BIT NOT NULL DEFAULT 0, 
     [CandidateForJobShared]     BIT NOT NULL DEFAULT 0, 
     [Follower]                  BIT NOT NULL DEFAULT 0
    );

    INSERT INTO #GridView(UserAccountId
                        , EmployeeNumber)
    SELECT UA.UserAccountId
         , UA.EmployeeNumber
    FROM application.UserAccount AS UA
    WHERE UA.IsActive = @IsActiveValue;

    UPDATE GV
    SET 
        HiringManager = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Hiring Manager';

    UPDATE GV
    SET 
        AdminAssistant = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Admin Assistant';

    UPDATE GV
    SET 
        HRAdmin = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'HR Admin';

    UPDATE GV
    SET 
        PhoneInterviewer = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Phone Interviewer';

    UPDATE GV
    SET 
        [User] = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'User';

    UPDATE GV
    SET 
        InterviewingHiringManager = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Interviewing Hiring Manager';

    UPDATE GV
    SET 
        CandidateforJobShared = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Candidate for Job Shared';

    UPDATE GV
    SET 
        Follower = CAST(1 AS BIT)
    FROM #gridView GV
         JOIN application.UserAccountToRoleType R ON R.UserAccountId = GV.UserAccountId
         JOIN application.RoleType RT ON RT.RoleTypeId = R.RoleTypeId
                                         AND RT.Name = 'Follower';

    SELECT GV.UserAccountId
         , GV.EmployeeNumber
         , GV.[HiringManager]
         , GV.[AdminAssistant]
         , GV.[HRAdmin]
         , GV.[PhoneInterviewer]
         , GV.[User]
         , GV.Follower
    FROM #gridView AS GV;

    DROP TABLE #gridView;

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [application].[StoInsertUserAccount] @EmployeeNumber                       INT, 
                                                     @AdministrativeAssistantUserAccountId INT          = NULL, 
                                                     @PhoneInterviewerUserAccountIds       VARCHAR(MAX) = '', 
                                                     @RoleTypeIds                          VARCHAR(MAX) = '', 
                                                     @StayInJobPosting                     BIT, 
                                                     @SendInviteToAttendee                 BIT, 
                                                     @ReceiveDailyEmailAlerts              BIT, 
                                                     @CanAutoEliminateApplicant            BIT, 
                                                     @IsActive                             BIT
/************************************************************************************
Object Name: application.StoInsertUserAccount
Created By:  Michael Weber

Parameter List:
	@EmployeeNumber                       INT
	@AdministrativeAssistantUserAccountId INT                 
		Defaults to NULL

	@PhoneInterviewerUserAccountIds       VARCHAR(MAX) 
		Defaults to an empty string. Comma separated string of INT's

	@RoleTypeIds                          VARCHAR(MAX) 
		Defaults to an empty string. Comma separated string of TINYINT's

	@StayInJobPosting                     BIT
	@SendInviteToAttendee                 BIT
	@ReceiveDailyEmailAlerts              BIT
	@CanAutoEliminateApplicant            BIT
	@IsActive                             BIT

Output List:
    N/A

Purpose: Inserts a record into the application.UserAccount table, any new zipcodes
         in the address.zipcode table and if phone interview data is present, inserts
		 data into application.UserAccountToPhoneInterviewer table.

------------------------------------------------------------------------------------
Change History: 
01/06/2021 - Initial creation.

************************************************************************************/
AS
SET NOCOUNT, XACT_ABORT ON;
BEGIN TRY

/* To Do
	add roll assignment logic.

*/
    IF EXISTS
             (
              SELECT 1
              FROM application.UserAccount
              WHERE EmployeeNumber = @EmployeeNumber
             )
    BEGIN
        DECLARE @ErrorMessage NVARCHAR(2048);

        SELECT @ErrorMessage = CONCAT('The Employee Number ', @EmployeeNumber, ' already exists');
        THROW 8675309, @ErrorMessage, 1;
    END;

    CREATE TABLE #PhoneInterviewerUserAccountIds(PhoneInterviewerUserAccountId INT NOT NULL);
    CREATE TABLE #RoleTypeIds(RoleTypeId TINYINT NOT NULL);

    DECLARE @UserAccountId INT;
    DECLARE @HavePhoneInterviewerData BIT = 0;

    IF @PhoneInterviewerUserAccountIds IS NULL
       OR @PhoneInterviewerUserAccountIds != ''
    BEGIN
        INSERT INTO #PhoneInterviewerUserAccountIds(PhoneInterviewerUserAccountId)
        SELECT value
        FROM STRING_SPLIT(@PhoneInterviewerUserAccountIds, ',');

        DELETE TPI
        FROM #PhoneInterviewerUserAccountIds TPI
        WHERE NOT EXISTS
                        (
                         SELECT 1
                         FROM application.UserAccount AS UA
                              JOIN application.UserAccountToRoleType AS UTRT ON UTRT.UserAccountId = UA.UserAccountId
                              JOIN application.RoleType AS RT ON RT.RoleTypeId = UTRT.RoleTypeId
                         WHERE UA.UserAccountId = TPI.PhoneInterviewerUserAccountId
                               AND UA.IsActive = CAST(1 AS BIT)
                               AND RT.Name = 'Phone Interviewer'
                        );


        IF EXISTS
                 (
                  SELECT 1
                  FROM #PhoneInterviewerUserAccountIds
                 )
        BEGIN
            SET @HavePhoneInterviewerData = CAST(1 AS BIT);
        END;
    END;

    IF @RoleTypeIds IS NOT NULL
       OR @RoleTypeIds != ''
    BEGIN
        INSERT INTO #RoleTypeIds(RoleTypeId)
        SELECT value
        FROM STRING_SPLIT(@RoleTypeIds, ',');

        DELETE TRT
        FROM #RoleTypeIds TRT
        WHERE NOT EXISTS
                        (
                         SELECT 1
                         FROM application.RoleType AS RT
                         WHERE RT.RoleTypeId = TRT.RoleTypeId
                        );
    END;

    BEGIN TRANSACTION;

    INSERT INTO application.UserAccount(EmployeeNumber
                                      , AdministrativeAssistantUserAccountId
                                      , StayInJobPosting
                                      , SendInviteToAttendee
                                      , ReceiveDailyEmailAlerts
                                      , CanAutoEliminateApplicant
                                      , IsActive
                                      , DateDeactivated)
    VALUES
        (@EmployeeNumber, 
         @AdministrativeAssistantUserAccountId, 
         @StayInJobPosting, 
         @SendInviteToAttendee, 
         @ReceiveDailyEmailAlerts, 
         @CanAutoEliminateApplicant, 
         @IsActive,
         CASE
             WHEN @IsActive = CAST(1 AS BIT)
             THEN NULL
             ELSE GETDATE()
         END
        );

    SET @UserAccountId = SCOPE_IDENTITY();

    INSERT INTO application.UserAccountToRoleType(UserAccountId
                                                , RoleTypeId)
    SELECT @UserAccountId
         , RoleTypeId
    FROM #RoleTypeIds;


    IF @HavePhoneInterviewerData = CAST(1 AS BIT)
    BEGIN

        INSERT INTO application.UserAccountToPhoneInterviewer(UserAccountId
                                                            , PhoneInterviewerUserAccountId)
        SELECT @UserAccountId
             , PhoneInterviewerUserAccountId
        FROM #PhoneInterviewerUserAccountIds;
    END;
    COMMIT TRANSACTION;

    DROP TABLE #PhoneInterviewerUserAccountIds;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END;
    THROW;
END CATCH;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[StoCreateStoredprocedure]
@SchemaName    NVARCHAR(255),
@ProcedureName NVARCHAR(255),
@CreatedBy     NVARCHAR(50) ,
@PurposeName   NVARCHAR(500)
/************************************************************************************
Object Name: dbo.StoCreateStoredprocedure
Created By:  Michael Weber

Parameter List:
    @SchemaName    NVARCHAR(255)
    @ProcedureName NVARCHAR(255)
    @CreatedBy     NVARCHAR(50) 
    @PurposeName   NVARCHAR(500)

Output List:
    ColumnA
    ColumnB

Purpose: The purpose of this stored procedure is to create other stored procedures!

------------------------------------------------------------------------------------
Change History: 
11/21/2018 - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX); 


SELECT @SQL = CONCAT('
CREATE PROCEDURE ', @SchemaName, '.', @ProcedureName, '
/************************************************************************************
Object Name: ', @SchemaName, '.', @ProcedureName, '
Created By:  ', @CreatedBy, '

Parameter List:
    @param1 datatype
    @param2 datatype

Output List:
    ColumnA
    ColumnB

Purpose: ', @PurposeName, '

------------------------------------------------------------------------------------
Change History: 
',(SELECT CONVERT(VARCHAR(10), GETDATE(), 101)), ' - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 1;

END;
GO

EXEC sys.sp_addextendedproperty 
     @name = N''MS_Description'', 
     @value = N''',@PurposeName,''', 
     @level0type = N''SCHEMA'', 
     @level0name = N''',@SchemaName,''', 
     @level1type = N''PROCEDURE'', 
     @level1name = N''', @ProcedureName, ''';
GO

');

PRINT @SQL;



END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[StoCreateTable] @Schema             NVARCHAR(255), 
                                    @Table              NVARCHAR(255), 
                                    @IdentityDataType   NVARCHAR(10), 
                                    @TableMSDescription NVARCHAR(500), 
                                    @CreatedBy          NVARCHAR(50) 
/************************************************************************************
Object Name: dbo.StoCreateTable
Created By:  Michael Weber

Parameter List:
    @param1 datatype
    @param2 datatype

Output List:
    ColumnA
    ColumnB

Purpose: This procedure will print out a table to .NET standards

------------------------------------------------------------------------------------
Change History: 
04/04/2019 - Initial creation.

************************************************************************************/
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SELECT @SQL = CONCAT('
CREATE TABLE ', @Schema, '.', @Table, '( ', @Table, 'Id ', @IdentityDataType, ' IDENTITY(1,1) NOT NULL
 ,DateCreated  DATETIME2(2) NOT NULL CONSTRAINT DF_', @Schema, '_', @Table, '_DateCreated DEFAULT (GETDATE()) 
 ,DateUpdated  DATETIME2(2) NOT NULL CONSTRAINT DF_', @Schema, '_', @Table, '_DateUpdated DEFAULT (GETDATE())
 ,CONSTRAINT PK_', @Schema, '_', @Table, ' PRIMARY KEY CLUSTERED 
(
	', @Table, 'Id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TRIGGER ', @Schema, '.', 'Tr', @Table, '_DateUpdated
/************************************************************************************
Object Name: ', @Schema, '.', 'Tr', @Table, '_DateUpdated
Created By:  ', @CreatedBy, '

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
',
   (
    SELECT CONVERT(VARCHAR(10), GETDATE(), 101)
   ), ' - Initial Creation

************************************************************************************/
ON ', @Schema, '.', @Table, '
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE ', @Schema, '.', @Table, '
SET DateUpdated = GETDATE() 
WHERE ', @Table, 'Id IN (	
    SELECT i.', @Table, 'Id
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.', @Table, 'Id = d.', @Table, 'Id );


GO

EXEC sys.sp_addextendedproperty 
    @name=N''MS_Description'', 
    @value=N''', @TableMSDescription, ''' , 
    @level0type=N''SCHEMA'',
    @level0name=N''', @schema, ''', 
    @level1type=N''TABLE'',
    @level1name=N''', @Table, '''
GO
');

    PRINT @SQL;

END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [applicant].[TrApplicant_DateUpdated]
/************************************************************************************
Object Name: applicant.TrApplicant_DateUpdated
Created By:  John Lapp

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [applicant].[Applicant]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [applicant].[Applicant]
SET [DateUpdated] = GETDATE() 
WHERE [ApplicantId] IN (	
    SELECT [i].[ApplicantId]
	FROM INSERTED [i] 
		INNER JOIN DELETED [d] ON [i].[ApplicantId] = [d].[ApplicantId] );
GO
ALTER TABLE [applicant].[Applicant] ENABLE TRIGGER [TrApplicant_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [applicant].[TrAsset_DateUpdated]
/************************************************************************************
Object Name: applicant.TrAsset_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [applicant].[Asset]
AFTER UPDATE  
AS 
	SET NOCOUNT ON;
	UPDATE [applicant].[Asset]
	SET [DateUpdated] = GETDATE() 
	WHERE [AssetId] IN (	
		SELECT [i].[AssetId]
		FROM INSERTED [i] 
			INNER JOIN DELETED [d] ON [i].[AssetId] = [d].[AssetId] );
GO
ALTER TABLE [applicant].[Asset] ENABLE TRIGGER [TrAsset_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [applicant].[TrEducationLevel_DateUpdated]
/************************************************************************************
Object Name: applicant.TrEducationLevel_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/20/2021 - Initial Creation

************************************************************************************/
ON [applicant].[EducationLevel]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE applicant.EducationLevel
SET DateUpdated = GETDATE() 
WHERE EducationLevelId IN (	
    SELECT i.EducationLevelId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.EducationLevelId = d.EducationLevelId );


GO
ALTER TABLE [applicant].[EducationLevel] ENABLE TRIGGER [TrEducationLevel_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [application].[TrPermission_DateUpdated]
/************************************************************************************
Object Name: application.TrPermission_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/08/2021 - Initial Creation

************************************************************************************/
ON [application].[Permission]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [application].[Permission]
SET DateUpdated = GETDATE() 
WHERE PermissionId IN (	
    SELECT i.PermissionId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.PermissionId = d.PermissionId );


GO
ALTER TABLE [application].[Permission] ENABLE TRIGGER [TrPermission_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [application].[TrRoleType_DateUpdated]
/************************************************************************************
Object Name: Application.TrRoleType_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/07/2021 - Initial Creation

************************************************************************************/
ON [application].[RoleType]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [Application].[RoleType]
SET DateUpdated = GETDATE() 
WHERE RoleTypeId IN (	
    SELECT i.RoleTypeId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.RoleTypeId = d.RoleTypeId );


GO
ALTER TABLE [application].[RoleType] ENABLE TRIGGER [TrRoleType_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [application].[TrUserAccount_DateUpdated]
/************************************************************************************
Object Name: Application.TrUserAccount_DateUpdated
Created By:  CAMP application user accounts.

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/06/2021 - Initial Creation

************************************************************************************/
ON [application].[UserAccount]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Application.UserAccount
SET DateUpdated = GETDATE() 
WHERE UserAccountId IN (	
    SELECT i.UserAccountId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.UserAccountId = d.UserAccountId );


GO
ALTER TABLE [application].[UserAccount] ENABLE TRIGGER [TrUserAccount_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [application].[TrUserAccountToPhoneInterviewer_DateUpdated]
/************************************************************************************
Object Name: Application.TrUserAccountToPhoneInterviewer_DateUpdated
Created By:  A relation between a user account and a the phone 

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/07/2021 - Initial Creation

************************************************************************************/
ON [application].[UserAccountToPhoneInterviewer]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Application.UserAccountToPhoneInterviewer
SET DateUpdated = GETDATE() 
WHERE UserAccountToPhoneInterviewerId IN (	
    SELECT i.UserAccountToPhoneInterviewerId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.UserAccountToPhoneInterviewerId = d.UserAccountToPhoneInterviewerId );


GO
ALTER TABLE [application].[UserAccountToPhoneInterviewer] ENABLE TRIGGER [TrUserAccountToPhoneInterviewer_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [application].[TrUserAccountToRoleType_DateUpdated]
/************************************************************************************
Object Name: application.TrUserAccountToRoleType_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/07/2021 - Initial Creation

************************************************************************************/
ON [application].[UserAccountToRoleType]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [application].[UserAccountToRoleType]
SET DateUpdated = GETDATE() 
WHERE UserAccountToRoleTypeId IN (	
    SELECT i.UserAccountToRoleTypeId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.UserAccountToRoleTypeId = d.UserAccountToRoleTypeId );


GO
ALTER TABLE [application].[UserAccountToRoleType] ENABLE TRIGGER [TrUserAccountToRoleType_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [application].[TrUserAction_DateUpdated]
/************************************************************************************
Object Name: [application].[TrUserAction_DateUpdated]
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/08/2021 - Initial Creation

************************************************************************************/
ON [application].[UserAction]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [application].[UserAction]
SET DateUpdated = GETDATE() 
WHERE UserActionId IN (	
    SELECT i.UserActionId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.UserActionId = d.UserActionId );


GO
ALTER TABLE [application].[UserAction] ENABLE TRIGGER [TrUserAction_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [candidate].[TrReferral_DateUpdated]
/************************************************************************************
Object Name: candidate.TrReferral_DateUpdated
Created By:  John Lapp

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/20/2021 - Initial Creation

************************************************************************************/
ON [candidate].[Referral]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE applicant.Referral
SET DateUpdated = GETDATE() 
WHERE ReferralId IN (	
    SELECT i.ReferralId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.ReferralId = d.ReferralId );


GO
ALTER TABLE [candidate].[Referral] ENABLE TRIGGER [TrReferral_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [candidate].[TrReferralType_DateUpdated]
/************************************************************************************
Object Name: candidate.TrReferralType_DateUpdated
Created By:  John Lapp

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [candidate].[ReferralType]
AFTER UPDATE  
AS 
	SET NOCOUNT ON;
	UPDATE [candidate].[ReferralType]
	SET [DateUpdated] = GETDATE() 
	WHERE [ReferralTypeId] IN (	
		SELECT [i].[ReferralTypeId]
		FROM INSERTED [i] 
			INNER JOIN DELETED [d] ON [i].[ReferralTypeId] = [d].[ReferralTypeId] );
GO
ALTER TABLE [candidate].[ReferralType] ENABLE TRIGGER [TrReferralType_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [candidate].[TrStatus_DateUpdated]
/************************************************************************************
Object Name: candidate.TrStatus_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/08/2021 - Initial Creation
************************************************************************************/
ON [candidate].[Status]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE [candidate].[Status]
SET DateUpdated = GETDATE() 
WHERE StatusId IN (	
    SELECT i.StatusId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.StatusId = d.StatusId );


GO
ALTER TABLE [candidate].[Status] ENABLE TRIGGER [TrStatus_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrCompany_DateUpdated]
/************************************************************************************
Object Name: Career.TrCompany_DateUpdated
Created By:  List of ClarkCompanies.

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[Company]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Career.Company
SET DateUpdated = GETDATE() 
WHERE CompanyId IN (	
    SELECT i.CompanyId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.CompanyId = d.CompanyId );


GO
ALTER TABLE [career].[Company] ENABLE TRIGGER [TrCompany_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrDepartment_DateUpdated]
/************************************************************************************
Object Name: career.TrDepartment_DateUpdated
Created By:  Israel Alafe

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[Department]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE career.Department
SET DateUpdated = GETDATE() 
WHERE DepartmentId IN (	
    SELECT i.DepartmentId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.DepartmentId = d.DepartmentId );


GO
ALTER TABLE [career].[Department] ENABLE TRIGGER [TrDepartment_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrJobDetail_DateUpdated]
/************************************************************************************
Object Name: Career.TrJobDetail_DateUpdated
Created By:  Michael Weber

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[JobDetail]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Career.JobDetail
SET DateUpdated = GETDATE() 
WHERE JobDetailId IN (	
    SELECT i.JobDetailId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.JobDetailId = d.JobDetailId );


GO
ALTER TABLE [career].[JobDetail] ENABLE TRIGGER [TrJobDetail_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrJobDetailOverride_DateUpdated]
/************************************************************************************
Object Name: Career.TrJobDetailOverride_DateUpdated
Created By:  Michael Weber

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[JobDetailOverride]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Career.JobDetailOverride
SET DateUpdated = GETDATE() 
WHERE JobDetailId IN (	
    SELECT i.JobDetailOverrideId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.JobDetailOverrideId = d.JobDetailOverrideId );


GO
ALTER TABLE [career].[JobDetailOverride] ENABLE TRIGGER [TrJobDetailOverride_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrJobPosting_DateUpdated]
/************************************************************************************
Object Name: Career.TrJobPosting_DateUpdated
Created By:  Job postings of many states. Current/Future/Hidden

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[JobPosting]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Career.JobPosting
SET DateUpdated = GETDATE() 
WHERE JobPostingId IN (	
    SELECT i.JobPostingId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.JobPostingId = d.JobPostingId );


GO
ALTER TABLE [career].[JobPosting] ENABLE TRIGGER [TrJobPosting_DateUpdated]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [career].[TrLocation_DateUpdated]
/************************************************************************************
Object Name: Career.TrLocation_DateUpdated
Created By:  Contains EVA BuildingId, ZipCodeId and Geography v

Parameter List:
    N/A

Output List:
    N/A

Purpose: Updates the DateUpdated column with the current date/time.

------------------------------------------------------------------------------------
Change History
01/19/2021 - Initial Creation

************************************************************************************/
ON [career].[Location]
AFTER UPDATE  
AS 
SET NOCOUNT ON;
UPDATE Career.Location
SET DateUpdated = GETDATE() 
WHERE LocationId IN (	
    SELECT i.LocationId
	FROM INSERTED i 
		INNER JOIN DELETED d ON i.LocationId = d.LocationId );


GO
ALTER TABLE [career].[Location] ENABLE TRIGGER [TrLocation_DateUpdated]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns active user data for those with an "Admin Assistant" role assigned to them.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoGetAdministrativeAssistants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns active user data for those with an "Phone Interviewer" role assigned to them.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoGetPhoneInterviewers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns the role type and it''s id' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoGetRoleTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gets account details for  the specified UserAccountId' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoGetUserAccountDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns a grid vidw of users.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoGetUserAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inserts a record into the application.UserAccount table, any new zipcodes in the address.zipcode table and if phone interview data is present, inserts data into application.UserAccountToPhoneInterviewer table.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'PROCEDURE',@level1name=N'StoInsertUserAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK to Applicant Asset table' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'AssetId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK to Applicant EducationLevel table' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'EducationLevelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Middle name of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email address of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone number of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cover letter, in text, of applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'CoverLetter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Applicant record is added by an existing employee' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'IsAddedByEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Applicant record is to be hidden' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'IsHidden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salary requested by applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'Salary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Denotes if the applicant is considered a Star Applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'IsStarApplicant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Denotes if the applicant has a legal conviction' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'HasConviction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Denotes a reason for conviction, if applicant has a conviction' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'ConvictionReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Denotes if an applicant at the time of submission has been on a specified period of unemployment and has received compensation for all or part of that time' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'HasUnemploymentCompensation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the applicant is authorized to work in the U.S.' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'IsAuthorizedToWorkInTheUnitedStates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the applicant requires an immigration case' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant', @level2type=N'COLUMN',@level2name=N'HasImmigrationCaseRequirement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores information about each applicant' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Applicant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores applicant''s asset file path' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Asset', @level2type=N'COLUMN',@level2name=N'FilePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores information about applicant''s asset' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'Asset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Level of education to order the list by' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'EducationLevel', @level2type=N'COLUMN',@level2name=N'LevelNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup table for applicants to select their highest level of education' , @level0type=N'SCHEMA',@level0name=N'applicant', @level1type=N'TABLE',@level1name=N'EducationLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the RoleType table' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'RoleTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the Candidate.Status table' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'StatusId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the UserAction table' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'UserActionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'matrix that defines what action a role type can perform at each step of the candidate workfow' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'Permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Checks if the role type is visible on screen' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'RoleType', @level2type=N'COLUMN',@level2name=N'IsVisibleOnScreen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' store information about all the roles available in CAMP' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'RoleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EVA Employee Number.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'EmployeeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the user stays on the job posting page after elimination of an applicant.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'StayInJobPosting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the user should sent invites to an attendee(s).' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'SendInviteToAttendee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if a user should receive daily emails for CAMP alerts.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'ReceiveDailyEmailAlerts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bit field to identify if applicants can be auto-eliminated from jobs for the specified hiring manager.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'CanAutoEliminateApplicant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the user account is active.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date when a user account is deactivated.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount', @level2type=N'COLUMN',@level2name=N'DateDeactivated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Michael Weber' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Michael Weber' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccountToPhoneInterviewer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the UserAccount table' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccountToRoleType', @level2type=N'COLUMN',@level2name=N'UserAccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the UserAccountToRoleTypeType table' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccountToRoleType', @level2type=N'COLUMN',@level2name=N'RoleTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'stores the different UserAccountToRoleTypes assigned to users in CAMP.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAccountToRoleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'provide url for different actions that can be taken within CAMP.' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAction', @level2type=N'COLUMN',@level2name=N'ActionUrlPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'action that can be taken within CAMP. (Add note, create job offer etc.)' , @level0type=N'SCHEMA',@level0name=N'application', @level1type=N'TABLE',@level1name=N'UserAction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK column that references the ReferralType table' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'Referral', @level2type=N'COLUMN',@level2name=N'ReferralTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'source employee name for candidate reference' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'Referral', @level2type=N'COLUMN',@level2name=N'EmployeeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Denotes if referral reward has been dispersed' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'Referral', @level2type=N'COLUMN',@level2name=N'HasAwardDisbursed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table contains referral information about the applicant ' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'Referral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores applicant referral source type name' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'ReferralType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores lookup list of applicant referral types' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'ReferralType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Points along the workflow of a candidate through CAMP.' , @level0type=N'SCHEMA',@level0name=N'candidate', @level1type=N'TABLE',@level1name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Michael Weber' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For the job postings, a lookup table for departments.' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains Job Title, Job Description and Job Duties large text fields. ' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'JobDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains Job Title, Job Description and Job Duties large text fields. ' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'JobDetailOverride'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Michael Weber' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'JobPosting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Michael Weber' , @level0type=N'SCHEMA',@level0name=N'career', @level1type=N'TABLE',@level1name=N'Location'
GO
