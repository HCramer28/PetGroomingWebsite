/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_PetAssets]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PetAssets]') AND type in (N'U'))
ALTER TABLE [dbo].[PetAssets] DROP CONSTRAINT IF EXISTS [FK_PetAssets_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[PetAssets]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[PetAssets]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/19/2020 9:18:34 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PetAssets]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PetAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PetAssets](
	[PetAssetId] [int] IDENTITY(1,1) NOT NULL,
	[PetName] [varchar](50) NOT NULL,
	[OwnerId] [nvarchar](128) NOT NULL,
	[PetPhoto] [varchar](50) NULL,
	[Notes] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_PetAssets] PRIMARY KEY CLUSTERED 
(
	[PetAssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[PetAssetId] [int] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/19/2020 9:18:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202002102158059_InitialCreate', N'FinalProject.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3BA117E2FD0FF20E8A92D72AC5CBA8B6D609F831C276E836E2E58278BBE2D688976D895281D89CA4950F497F5A13FA97FA1438992255E74B115DB3958601191C36F86C321391C0EFDBFFFFC77FCD34BE05BCF384E484827F6C9E8D8B63075438FD0D5C44ED9F2874FF64F3FFEFE77E32B2F78B1BE1674679C0E5AD264623F31169D3B4EE23EE10025A380B87198844B3672C3C0415EE89C1E1FFFC53939713040D8806559E32F296524C0D9077C4E43EAE288A5C8BF093DEC27A21C6AE619AA758B029C44C8C5137B4628F2EFE3F09FD865A3C7EBD1CDD7E9286F655B173E4120D11CFB4BDB4294860C3190F7FC31C173168774358FA000F90FAF1106BA25F2132CFA71BE26EFDAA5E353DE2567DDB08072D38485414FC09333A123476EBE91A6ED5287A0C52BD0367BE5BDCE3439B1AF3D9C157D097D5080CCF07CEAC79C7862DF942C2E92E816B351D1709443CE6280FB358CBF8FAA884756E77647A54D9D8E8EF9BF236B9AFA2C8DF184E294C5C83FB2EED3854FDCBFE3D787F03BA693B393C5F2ECD3878FC83BFBF8677CF6A1DA53E82BD0D50AA008AC25C231C8869765FF6DCBA9B773E48665B34A9B5C2B604B303D6CEB06BD7CC674C59E60E29C7EB2AD1979C15E51228CEB9112984DD088C5297CDEA6BE8F163E2EEB9D469EFCFF06AEA71F3E0EC2F5163D935536F4127F983831CCAB2FD8CF6A932712E5D3AB36DEDF04D92C0E03FE5DB7AFBCF6DB3C4C6397772634923CA07885595DBAB1B336DE4E26CDA18637EB02F5F04D9B4BAA9AB796947768939950B0D8F56C28E47D5BBE9D2DEE228A60F032D3E21A693238F3A63592508E2C0DEDDA944EBA9A12852EFE9657C6AB00117F80A5B10317F04E96240E70D9CB9F433044447BCB7C8F92045606EF6F28796A101DFE1C40F43976D3180C76CE5010BD39B7FBA790E2DB3458F079B03B5E830DCDC3AFE10CB92C8CAF286FB535DEE7D0FD1EA6EC8A7A9788E147E61680FCF38104DD010611E7C2757192CCC098B1370DC1F92E00AF293B3BED0DC717AA7DBB26531F9140EF9B484BEAB78274ED9FE829141FC540A6F3539A44FD1CAE08ED266A416A1635A768155590F5159583759354509A05CD085AE5CCA906F3FCB2111ADEF5CB600FDFF7DB6EF336AD051535CE6185C47FC514C7B08C79F788311CD3F508745937F6E12C64C3C799BEF9DE9471FA8AFC7468561BCD866C11187E3664B0873F1B3231A1F89978DC2BE970202A8801BE13BDFEACD53EE724C9763D1D6ADDDC35F3DDAC01A6E9729124A14BB259A009858940465D7EF0E1ACF6A846DE1B3932021D0343277CCB8312E89B2D1BD51DBDC43E66D8BA70F350E114252EF254354287BC1E82153BAA46B07584A42EDC9F149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A4B1C61CA19B66AA20B737D40840B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC75D8953ECC4265B7C67835D0AFFED4D0CB359633B30CE66957411C018DCDB87818AB34A5703900F2E8766A0D289C960A0C2A5DA8981D635B60703ADABE4DD19687E44ED3AFED279F5D0CCB37E50DEFDB6DEA8AE3DD8664D1F07669AB9EF096D18B4C0B16A9E970B5E895F98E67006728AF359225C5DD94438F81CB37AC866EDEF6AFD50A7194436A226C0B5A1B5808A6B41054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A3D5A21345FA2CAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB2ADB424B94F062D159D195C4BC246DB95A4710A7AB8055BA9A8BE850F34D98A4847B9DB94756327CF9E120563C7906635BE415144E8AA9276254AAC799E7335FD61DE3F0929C8311C37D1E42295D2969C5818A315966A8135483A2371C22E11430BC4E33C532F50C8B47BAB61F92F5856B74F75108B7DA0A0E67FE72D1A2EF36B7BAEEA9408AC19F434E09E4D164ED7D881BEB9C5D3E1908F624D047F1AFA6940CD8E96B9757E8F576D9F97A8086347925F71A414AD29EE6E7D083A0D903A39061EACD29FD97CC0CC1026B517DE6855F1260FD58C5204ACAA28A620D6DE06D0E4D86C3468B2EFD87FCC5A11DE669E8984952A8028EA8951C97950C02A75DD51EB692955CC7A4D774429F7A40A2955F590B29A615213B25AB1119E41A37A8AEE1CD49C922ABA5ADB1D59935D5285D6546F80AD9159AEEB8EAA4940A9026BAABB63AFB351E4C5F4807732E38966EBAD2C3FFC6EB7971930DE66651C662BACDCF157812AC53DB1C42DBE0226CA0FD2AA8C27C0ADAD2A8F7D6C6755060CF34A54BB25AF2F448D57FB66CCDAD5776DB16FBAFA37E3F5B3DD37B510E520289394DCCB03A174F01B8B4358FB231CE5549693D856A146D8E85F138683112718CD7FF1A73EC17C592F086E10254B9CB03CDDC33E3D3E3995DEEF1CCE5B1A27493C5F7388353DA8A98FD90E32B7E8338ADD2714AB79145BBC3759832A21EA6BEAE19789FDAFACD57916EDE07F65C547D675F248C92F29543CC429B6FEADE6850E937FDF7CF83AD0D712DDB57AFD8F6F79D323EB2E8619736E1D4BBADC6484EB6F287A499337DD429A8D5F56BCDF09557BA6A0459526C4E6AF1216840DF222A190F20F017AF9635FD1B4AF0EB642D4BC2C180A6F10159A5E0E6C82657C35E0C127CB5E0DF4EBACFE15C126A2195F1010DA1F4C7E3FD07D192A5AEE71ABD19C8D76B124657A6ECDBFDE2A1973DF7B9392A6BDD5445753B17BC06D916EBD8165BCB34CE5C176474D22F260D8FB34ED37CF3E3E9484E3752AC87EF38C77995ADC705DF49BCA283E801C384D4ECFFEF386776D6BA678EE81275FF6CB0E3E306313995EFBCF01DEB5B199C2BC076E6CBD327D0FCCD6F6B57FEED9D23A6FA17BCFDB5553900CF732BA58705B5E6E1E388713FE220423C83DCAFC39A53E11AC2989B585E19AC4CCD49C81263356268EC257A16866DBAFAF62C36FECACA069666BC8DB6CE22DD6FF46DE82A699B7211B721F19C5DA7C445D9677CB3AD6941CF59E32886B3D6949586FF3591B2FD9DF53C2F0204AA9CD1EC31DF1FBC90F1E4425434E9D1EF9C0EA752FEC9D955F6684FD3B21AB3504FF9D468ADDDAAE59D25CD365586CDE9244058914A1B9C10C79B0A55EC48C2C91CBA09AC798B3F7E059DC8EDF742CB0774DEF5216A50CBA8C83855F0B787127A0897F96F45C97797C17653F6D324417404CC263F377F4E794F85E29F74C1313324070EF424474F958321ED95DBD9648B721ED0824D4573A450F38887C004BEEE81C3DE34D6403F3FB8C57C87D5D47004D20ED035157FBF892A0558C824460ACDBC327D8B017BCFCF87FB8633EB9A0540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9a6aad99-31ec-4ecd-84c4-4bf3498a3506', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9b791a21-9c82-4a4b-9cfc-1b66a1949974', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fb8346ea-88d2-4f7c-a7b0-82cc310c9ec9', N'Pet Owner')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'141ee9cc-ccaa-4421-acd0-bd90013342dd', N'fb8346ea-88d2-4f7c-a7b0-82cc310c9ec9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'14c5c8bd-08fb-4b5e-9d56-779bab6e2eda', N'fb8346ea-88d2-4f7c-a7b0-82cc310c9ec9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ae51750-8e5b-4ca4-90f6-58c5cb96a546', N'fb8346ea-88d2-4f7c-a7b0-82cc310c9ec9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'689171b6-8e64-4ec2-8903-af14d49eabe8', N'9a6aad99-31ec-4ecd-84c4-4bf3498a3506')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab9ecb10-caf9-421f-ac46-7bdcd4d39e62', N'9b791a21-9c82-4a4b-9cfc-1b66a1949974')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'141ee9cc-ccaa-4421-acd0-bd90013342dd', N'hmwarder28@att.net', 0, N'AFfcVx4IhPZWSApSPmV9cHLMOKF2PYdUNljECU6pZzujVij1eD10O+kEBmF3fnd1qQ==', N'3bbc0d95-74c3-4d88-9f4d-2a717c2ab9a9', NULL, 0, 0, NULL, 1, 0, N'hmwarder28@att.net')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'14c5c8bd-08fb-4b5e-9d56-779bab6e2eda', N'jberry@example.com', 0, N'AMIckOk1EkUWH3gRscrX8SfH5t5CkIX9sV0jMToiNxrZeU0qJrDyF4Q7vcGJr0VcnQ==', N'ab9d9cc8-0722-4187-95ea-8a9d25968aec', NULL, 0, 0, NULL, 1, 0, N'jberry@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2ae51750-8e5b-4ca4-90f6-58c5cb96a546', N'hstrobbe@test.com', 0, N'AKT72pfmJyUTF2wOlgvPw7666RQMxOz9olgVb5vLVW4TMN8USjJAXMWDVRrcOIeCkA==', N'1e05339a-a62c-4aec-8a60-a747503dffc0', NULL, 0, 0, NULL, 1, 0, N'hstrobbe@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'689171b6-8e64-4ec2-8903-af14d49eabe8', N'employee@example.com', 0, N'APTdxmrYSSV1meevihaKuSz/JE0aDjM9pa8uNa94YkUZe3saFODIHKws784lFlT0tg==', N'b8e3e878-592a-44d2-84d9-b8113b911b5c', NULL, 0, 0, NULL, 1, 0, N'employee@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab9ecb10-caf9-421f-ac46-7bdcd4d39e62', N'admin@example.com', 0, N'ALnDlq605Rna+q1k2HJnsSlSz3wNmyvkXZgwUEGHM0nkCBm38jZEiRCqKzkviK4MUw==', N'0ee51367-6c71-4477-92c0-4b7dc5b00e01', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (2, N'Raymore', N'5678', N'Raymore', N'MO', N'64083', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (3, N'Overland Park', N'1452', N'Overland Park', N'KS', N'66013', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (4, N'Lees Summit', N'1234 ', N'Lees Summit', N'MO', N'64083', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (7, N'Greenwood', N'7456', N'Greenwood', N'mo', N'64046', 3)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[PetAssets] ON 

INSERT [dbo].[PetAssets] ([PetAssetId], [PetName], [OwnerId], [PetPhoto], [Notes], [IsActive], [DateAdded]) VALUES (1, N'Hux', N'141ee9cc-ccaa-4421-acd0-bd90013342dd', N'hux.jpg', N'package I', 0, CAST(N'2020-02-11' AS Date))
INSERT [dbo].[PetAssets] ([PetAssetId], [PetName], [OwnerId], [PetPhoto], [Notes], [IsActive], [DateAdded]) VALUES (4, N'Butters', N'141ee9cc-ccaa-4421-acd0-bd90013342dd', N'butters.jpg', N'Kitty/ Package J', 1, CAST(N'2020-02-12' AS Date))
INSERT [dbo].[PetAssets] ([PetAssetId], [PetName], [OwnerId], [PetPhoto], [Notes], [IsActive], [DateAdded]) VALUES (5, N'Luna', N'2ae51750-8e5b-4ca4-90f6-58c5cb96a546', N'20190815_104834.jpg', N'Package B', 1, CAST(N'2020-02-13' AS Date))
INSERT [dbo].[PetAssets] ([PetAssetId], [PetName], [OwnerId], [PetPhoto], [Notes], [IsActive], [DateAdded]) VALUES (6, N'barry', N'14c5c8bd-08fb-4b5e-9d56-779bab6e2eda', N'puppy6.jpg', N'Puppy/ Package C', 1, CAST(N'2020-02-14' AS Date))
INSERT [dbo].[PetAssets] ([PetAssetId], [PetName], [OwnerId], [PetPhoto], [Notes], [IsActive], [DateAdded]) VALUES (8, N'Solar', N'2ae51750-8e5b-4ca4-90f6-58c5cb96a546', N'IMG_5736.jpg', N'puppy/Package A', 1, CAST(N'2020-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[PetAssets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (5, 2, CAST(N'2020-02-20' AS Date), 5)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (6, 2, CAST(N'2020-02-20' AS Date), 1)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (7, 2, CAST(N'2020-02-20' AS Date), 4)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (14, 2, CAST(N'2020-02-21' AS Date), 6)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (23, 2, CAST(N'2020-02-21' AS Date), 5)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (29, 2, CAST(N'2020-02-28' AS Date), 6)
INSERT [dbo].[Reservations] ([ReservationId], [LocationId], [ReservationDate], [PetAssetId]) VALUES (30, 4, CAST(N'2020-02-28' AS Date), 8)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'141ee9cc-ccaa-4421-acd0-bd90013342dd', N'haley', N'Cramer')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'14c5c8bd-08fb-4b5e-9d56-779bab6e2eda', N'Jake', N'Berry')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'2ae51750-8e5b-4ca4-90f6-58c5cb96a546', N'Hannah', N'Strobbe')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'7646d0c8-d479-4e2d-815e-f6a40db18665', N'Sandy', N'Warder')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'b9a4ed92-5bd2-46f8-ac74-e6f3ae88ba52', N'Haley', N'Cramer')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PetAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetAssets]'))
ALTER TABLE [dbo].[PetAssets]  WITH CHECK ADD  CONSTRAINT [FK_PetAssets_UserDetails] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PetAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[PetAssets]'))
ALTER TABLE [dbo].[PetAssets] CHECK CONSTRAINT [FK_PetAssets_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_PetAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_PetAssets] FOREIGN KEY([PetAssetId])
REFERENCES [dbo].[PetAssets] ([PetAssetId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_PetAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_PetAssets]
GO
