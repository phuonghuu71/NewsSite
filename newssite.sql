USE [master]
GO
/****** Object:  Database [NewsSite]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE DATABASE [NewsSite]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NewsSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NewsSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NewsSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NewsSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NewsSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NewsSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [NewsSite] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NewsSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NewsSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NewsSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NewsSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NewsSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NewsSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NewsSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NewsSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NewsSite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NewsSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NewsSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NewsSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NewsSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NewsSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NewsSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NewsSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NewsSite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NewsSite] SET  MULTI_USER 
GO
ALTER DATABASE [NewsSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NewsSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NewsSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NewsSite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NewsSite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NewsSite] SET QUERY_STORE = OFF
GO
USE [NewsSite]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[info]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[web_name] [nvarchar](50) NOT NULL,
	[web_des] [nvarchar](200) NULL,
	[web_about] [ntext] NULL,
 CONSTRAINT [PK_dbo.info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[post_title] [nvarchar](200) NOT NULL,
	[post_slug] [nvarchar](200) NULL,
	[post_teaser] [nvarchar](500) NOT NULL,
	[post_review] [nvarchar](500) NULL,
	[post_content] [ntext] NULL,
	[post_type] [int] NOT NULL,
	[post_tag] [nvarchar](200) NULL,
	[create_date] [datetime] NULL,
	[edit_date] [datetime] NULL,
	[dynasty] [nvarchar](50) NULL,
	[ViewCount] [int] NOT NULL,
	[Rated] [int] NOT NULL,
	[AvatarImage] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[seriesID] [int] IDENTITY(1,1) NOT NULL,
	[seriesName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_dbo.Series] PRIMARY KEY CLUSTERED 
(
	[seriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StickyPosts]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StickyPosts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[priority] [int] NOT NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK_dbo.StickyPosts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PostTags]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PostTags](
	[PostID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Tbl_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SeriesPost]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SeriesPost](
	[PostID] [int] NOT NULL,
	[seriesID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Tbl_SeriesPost] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[seriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/21/2021 4:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[userrole] [varchar](20) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202012141408180_Initialization', N'DVCP.Migrations.Configuration', 0x1F8B0800000000000400ED1DD96EE436F27D81FD07418F0BA7DB07026C8CEE044E7B266B6C3C36DC3DB3FB66B025BA2D44A23A12E5B111E4CBF2904FDA5F585227C5433C5ADDF60C8200814DB12E56B1AA485679FEF7C79FB31F9E93D87B82591EA568EE9F4C8E7D0FA2200D23B499FB057EF8E69FFE0FDFFFFD6FB37761F2EC7D6AE69DD1790412E573FF11E3EDF9749A078F3001F92489822CCDD3073C09D2640AC2747A7A7CFCDDF4E4640A090A9FE0F2BCD95D817094C0F217F2EB224501DCE202C4D76908E3BC1E275F962556EF034860BE05019CFB979F16B7936A9AEF5DC411202C2C61FCE07B00A114034C183CFF98C325CE52B4596EC90088572F5B48E63D80388735E3E7DD7453198E4FA90CD30EB0411514394E134B842767F5A24C7970A7A5F5DB4523CBF68E2C2F7EA152974B37F76FD31CFB1E4FE87C116774526F552774EE9147478E5A8D13C3A0FF1D798B22C64506E708163803F191775BACE328F8377C59A5BF403447451CB3AC1066C8B7DE0019BACDD22DCCF0CB1D7CA819DC12A2F751E87BD33EF094876E6179C04A902B84CF4E7DEF036103AC63D8EA9C117A89D30CFE0411CC0086E12DC01866446557212C574D60812358E43013E80D83943C12DC316CC08875921DE67BD7E0F9678836F871EE135DFADEFBE81986CD48CDFA4714910D4980705640896806B4F3B8D88C40DA444A08C8FA0CD0FA768F6266F029829F47206E402B4811260633408CFC38DAAA121A3A0B374103F66F054106C9B6BA0FC9FF1A5A97E4E71571F73A501846D809307C4120A73B7740F12388F68918D7222D3AA5BBA9E28EBA9DDD505C3C010CB2AB046CC6F028C3B472E2368BBC21F3639AC610203DC71FC053B4291D2E876FB58EEFFF95E22A22DDC1B89C933F46DB2A8E4F96380A7E79A19FEFE9D4DB9BE58A4891A5C95D1A97720A9FEF5720DB40AA95543D6799165960C9E692787A984BB96C9137733A0EB94F2DE5863BFE7BC3BD0D672BB0D1F055CD9070453FA8792ABFDA728409E0C7D2ED4B38A21FA49AEC7D1074D8FF2AD3DE6CDAA53983C94F670EA629500771F044C825073A64FAB3CDA2348B3A67BB4338D26551833BA0B2A671FC07BF1B867C8C9B05D64EC2D0FACAD907B7BCBC247B75696F7F1DE4A1ACB0A2487F3E4046ED6687161182F77DAA08E2647B2B9AF499191E997A70AB23345D4CAE063B94BD11721A6373CB307734ADE120AF34AB5E0AE0645455B437B32A3AF7E066D59CD26DED4A7ABADFF36D02D2B9318D65D5BFDB866090E79FD32C1CA07CA275A06EA41FC8748DD0677BB925A0AB9DA59A6B1833910F7F6852BA03C30C9BCF72E4F9B7933BF80F5C5FA187D4D423D4D3FFCAAD395A9FE1FA5EB32F0CC38CE5BEA0844398EFFD2E81D201EBB418FBDA4C65A817799E0651A91BE12CD8ED983ECBEF50E8191C152AF6FB070E2207B1DC684B6C953033F7FF21ACC730F2366077C865688F2793130133B17298513303F1827807B26F2284C52D11A120DA8258CF04076A73694FF5D152E2BF5CC22D44743FE8177947165A4ADC8ED7ADD46CCA98CDB035F139BE4AD9CA2BA161450FD98FF20CC118667DF01844EA226D99766A19EB5F348D20693FA9ED1096279CB184EC0753154F8AC8DAF15425C806FB5685D3D017880BE7E408A4F298EC3F799E6DE501A472EF467BF4AD5F851702830904CC6A0668FA42C7E0B3EC6691C855673F791DB378CD539C4B8899ED45766B17C97A6A17CCA60FDCB951190A3644E910D54E43C4517FD0C057475201BADCA31A506A0832D86A2F6980DB1454006FBF70181855CBD691C9A8999903978CBC159A2512AD1C9C0E05A3364B1D187452443D0B27D30C9644B8C8129763300E1A45421DDF46B18F5D4BB9B5EE207D65D803B28B51D1202EBAC9DD8B840C8A8AC79D65E60E94A2CC0341D2204C320CD75B7E40667954DCC1CC9BB342EBCCBB6AA369556E540FCCA68ABAA4D935D86EC9B185A953AA47BC6555A4B4F866695FC4935438A6412EA9E569B96D2991A326D840EE2B214D387D1F6539BE0418AC013D382DC24498C6862E85636D28B1D149D453E36C9BD9F4E72E3AB2354592985E03BD279224342128CFCF9C6E45308FD685811864AA47A5451A1709D21C10D4789ABC8245A3CA3534DCD4453F0243F5B825B6AA8C4740560DDB725617EA88ACD51F2CF135B53702BEE68325BEB6BE4640D87EB195B82CA211E52D876D71019922B098E40C61EA95CAB0C87A1FCCF131F5332C3666D81C575B52C3626A07CDF13035332C2666D81C575D38C3E2A987CC71F42A67584CBD0FE6F89A8B5E1655332662994D398F279C5C0487CA8535DE3B1BF96E36B174F5E0CC11C2DE8F0F01AB5696F7C096DEB72D53E8EDD276D472BF5B4495D7D2B12AF33654AF14DC44B50A40E586696B057A5B46517BA0C7543DCB8AB8AAF137A31EC5E1C04C39F4F06CAF1929946A31EBF774761DA52FF31A1CA236DAC137A38AEACCE1AA8BF232C25E1972B0FD66A0DDDB328F072934A2F481ED5B71CF09B6A3E698BAA75F1653376A275DF596CB4B578D7E6531BCB9C572B55B05BC81E92A21F713B9BB47501647376A87A97CD5E41185E2CD900E4FFD6AC963AA870F6F25FDEB0DF1A8DEBBB0539FC97BD364A76FF5851EB7488A8B3D7161CC932C8A521681E8DAB4E4ED3953BE308C92AFA899E3EFA4DCF55A5DF369B45A4D92E95492180C2D1B7B5FF996D4C95E821AF2659EE5ECA246E186919FD23A87F6A691BB519CD5B77BFA7648E1BAAF9AE27B84F7A728A4577DCB971CC36442274C96BFC68B382A6F4F9A09D700450F905845595AE39F1E9F9C728D956FA7C9719AE7612CB91DE53B1DFB0A3B68036244D7565B07E450B7C691109E1BAF50089FE7FE6F25C8B977F5DFFB0AEAC8BBC9889ACFBD63EF7796B079F319DBB8889E40163C824C2C0EDAB52FB1C3AC16ED2AFF88A25F0B22DE8A704FE55173E1D8B22815F05B5701FB1D8926B85D1B10EB576817F999E6C2D2B4766C2D343111C74E42FA332E1B02ED50099D85AE88B84E4385426DB10A8D852E6AE8B515BA209034158EA5CA7E39EC3AD231E7D2DAE5E0F377AB07DD8BA7E7DBAB9C37A47DB8A8C1CCE3856DFB938386C6EB49DA8BB6C43624C7F868D5CDE3B08E6374D9EC6505B9C61A27876AD7B5E2B07AE33493EC2D3344CC02CACD6FE7E61019DA1387A488EFFC90EAFBCC1E2FDFD8A15F86570D5BD22BB52F3666F16D0B069BD8A52B61AC6444684230489D8D35ABBA333353AEF28A64CCC8D810B1CB0E2A28557260112DED49377016C4ADF4E518532D94E5187E5F4D5362DC37A05B028DA0A3DD9A76AA2267970E1A5981AD73A38F5315BEA2BA62DF8D375F5EA38DF43ADAD6084E844BF01B74096388A1771154379C0B90072014B70BBD1C1EA2CD3EBC301C1835E47C11C6A37E1AB27395AF613BB2270376F38BBA93EBED2BB31F0B750EBD7EEDCB8486681ED28894AF616FC8FDAC98BFF3D690D737C97D318E475E0EF556BD8EF29992511AAF3089B2BE1A7331D59EF261762FB6A2A4760053316F39DDB5C5D4C8318DD8527AA816526317F4EA2DA3627B0EAF2BB12954D9135ABDF5CFFD709D12AD56072D793B94BA5D54D32D2A2331D0A768DF4E2A2560DC6AAAEA3495619536C7C97A50952DA832ACD20E3697EE5419F248D6B72A3311E532B31FA58BD2E6C546DDC16D689012522F3D756ED50471AD0ED787CBDA7BD75F66D66AABE8D41DBFBFB66D93D4B6D92A8AB27612583426BE14707C819BA64EBDC0F26A2FC9E14DDB09FC7A42F7DA7F35EDC4FBD230B3857B5581638B69A0D9812A3E3E41E67A1B5E4FC851FBA3857E68AD605A7D8FD3FD2CD620926C88F9871B481696479B0E05FD671C100C7A79503B87C6B8261DE3386AA67077D0D7108390244917198E1E4080C9E700E679F9E7A23E81B82053DE256B185EA19B026F0B4C4486C93AEEF576D1B46E887ED9E2DDE77976B32DFFBCDA18221036235A6974837E2CA2386CF97E2FB90C57A0A0F962FD54477589E993DDE6A5C5F421458688EAE56BD3DC154CB6314196DFA02578822EBC1163FD196E40F0D29492AA91E815D15FF6D96504361948F21A47074F7E25361C26CFDFFF1F655C31A4BF640000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[info] ON 

INSERT [dbo].[info] ([id], [web_name], [web_des], [web_about]) VALUES (1, N'GameNews', N'Trang web chính thức của GameNews', N'Về GameNews')
SET IDENTITY_INSERT [dbo].[info] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([post_id], [userid], [post_title], [post_slug], [post_teaser], [post_review], [post_content], [post_type], [post_tag], [create_date], [edit_date], [dynasty], [ViewCount], [Rated], [AvatarImage], [status]) VALUES (2, 1, N'Cơ hội nào cho đại diện duy nhất của Việt Nam vô địch “CKTG” của bom tấn MOBA toàn cầu?', N'co-hoi-nao-cho-dai-dien-duy-nhat-cua-viet-nam-vo-dich-cktg-cua-bom-tan-moba-toan-cau', N'Vào tháng 11 tới, đại diện của Việt Nam là SBTC Esports sẽ thi đấu tại CKTG của Liên Minh: Tốc Chiến.', NULL, N'<p>V&agrave;o th&aacute;ng 11 sắp tới, giải đấu Wild Rift: Horizon Cup 2021 hay c&ograve;n được cộng đồng&nbsp;<a href="https://gamek.vn/vua-bai-rc-va-pha-gay-do-sap-di-cktg-toc-chien-cuoi-cung-ngay-ngay-ve-ke-fame-va-lam-tien-garena-20211023111333195.chn" target="_blank" title="“Vua bãi r*c” và pha gáy dơ “sắp đi CKTG” Tốc Chiến, cuối cùng ngày ngày về ké fame và làm tiền Garena">Tốc Chiến</a>&nbsp;Việt Nam gọi l&agrave; Chung Kết Thế Giới của tựa game MOBA di động n&agrave;y. Đại diện của Việt Nam l&agrave; SBTC Esports c&ugrave;ng Team Secret l&agrave; hai đội tuyển của Đ&ocirc;ng Nam &Aacute; sẽ thi đấu c&ugrave;ng c&aacute;c c&aacute;i t&ecirc;n tới từ nhiều quốc gia/khu vực kh&aacute;c tr&ecirc;n thế giới bao gồm Trung Quốc, Brazil, Mỹ Latinh, Ch&acirc;u &Acirc;u, Bắc Mỹ, H&agrave;n Quốc v&agrave; Nhật Bản.</p>

<p>C&oacute; thể n&oacute;i, 10 đội tuyển tham dự CKTG lần n&agrave;y của&nbsp;<a href="https://gamek.vn/vua-bai-rc-va-pha-gay-do-sap-di-cktg-toc-chien-cuoi-cung-ngay-ngay-ve-ke-fame-va-lam-tien-garena-20211023111333195.chn" target="_blank" title="“Vua bãi r*c” và pha gáy dơ “sắp đi CKTG” Tốc Chiến, cuối cùng ngày ngày về ké fame và làm tiền Garena">Tốc Chiến</a>&nbsp;kh&ocirc;ng phải l&agrave; qu&aacute; nhiều, song c&oacute; kh&aacute; đầy đủ c&aacute;c gương mặt đến từ nhiều nơi tr&ecirc;n thế giới. Điều n&agrave;y cho thấy Riot đang nỗ lực để tạo n&ecirc;n một giải đấu to&agrave;n cầu cho tựa game MOBA di động &ldquo;non trẻ&rdquo; của m&igrave;nh, nhất l&agrave; khi m&agrave;&nbsp;<a href="https://gamek.vn/vua-bai-rc-va-pha-gay-do-sap-di-cktg-toc-chien-cuoi-cung-ngay-ngay-ve-ke-fame-va-lam-tien-garena-20211023111333195.chn" target="_blank" title="“Vua bãi r*c” và pha gáy dơ “sắp đi CKTG” Tốc Chiến, cuối cùng ngày ngày về ké fame và làm tiền Garena">Tốc Chiến</a>&nbsp;c&ograve;n gặp kh&aacute; nhiều vấn đề tại nhiều khu vực tr&ecirc;n thế giới, trong đ&oacute; c&oacute; Việt Nam.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/28/photo-1-1635414773600331428245.jpg" target="_blank" title=""><img alt="Cơ hội nào cho đại diện duy nhất của Việt Nam vô địch “CKTG” của bom tấn MOBA toàn cầu? - Ảnh 1." id="img_378119754248830976" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/28/photo-1-1635414773600331428245.jpg" title="Cơ hội nào cho đại diện duy nhất của Việt Nam vô địch “CKTG” của bom tấn MOBA toàn cầu? - Ảnh 1." /></a></p>

<p>Đại diện của ch&uacute;ng ta l&agrave; SBTC Esports, đội tuyển đang c&oacute; th&agrave;nh t&iacute;ch tốt nhất tại khu vực với chuỗi trận bất bại k&eacute;o d&agrave;i, l&agrave; đội tuyển&nbsp;<a href="https://gamek.vn/vng-co-quyen-hanh-gi-voi-toc-chien-co-dang-bi-game-thu-doi-xu-nguyn-rua-den-muc-tan-nhan-the-nay-20211022235205562.chn" target="_blank" title="Thực quyền của VNG với Tốc Chiến, có thật sự là &quot;sân chơi của VNG, quyền của VNG&quot; để rồi bị đối xử thế này?">Tốc Chiến</a>&nbsp;số 1 thế giới v&agrave; l&agrave; đương kim v&ocirc; địch của SEA Championship. Đương nhi&ecirc;n, SBTC Esports sẽ l&agrave; c&aacute;i t&ecirc;n s&aacute;ng gi&aacute; nhất cho ng&ocirc;i vị qu&aacute;n qu&acirc;n của CKTG sắp diễn ra.</p>

<p>Nhưng SBTC Esports sẽ phải đối mặt với nhiều đội tuyển đến từ c&aacute;c khu vực &ldquo;cứng&rdquo;, đặc biệt l&agrave; hai đội tuyển tới từ Trung Quốc, quốc gia vốn kh&aacute; mạnh về Esports Mobile. Đ&acirc;y mới chỉ l&agrave; giải đấu quốc tế đầu ti&ecirc;n mang quy m&ocirc; to&agrave;n cầu của Li&ecirc;n Minh:&nbsp;<a href="https://gamek.vn/vng-co-quyen-hanh-gi-voi-toc-chien-co-dang-bi-game-thu-doi-xu-nguyn-rua-den-muc-tan-nhan-the-nay-20211022235205562.chn" target="_blank" title="Thực quyền của VNG với Tốc Chiến, có thật sự là &quot;sân chơi của VNG, quyền của VNG&quot; để rồi bị đối xử thế này?">Tốc Chiến</a>&nbsp;v&agrave; thi đấu tập trung tại Singapore. &Aacute;p lực đương nhi&ecirc;n l&agrave; rất lớn song cơ hội cũng l&agrave; kh&ocirc;ng nhỏ để đại diện của Việt Nam khẳng định bản lĩnh của m&igrave;nh tr&ecirc;n trường quốc tế.</p>

<p>Nếu giữ vững được phong độ của m&igrave;nh như c&aacute;c giải đấu vừa qua, SBTC Esports ho&agrave;n to&agrave;n c&oacute; cơ hội tạo n&ecirc;n kỳ t&iacute;ch khi đưa&nbsp;<a href="https://gamek.vn/vng-co-quyen-hanh-gi-voi-toc-chien-co-dang-bi-game-thu-doi-xu-nguyn-rua-den-muc-tan-nhan-the-nay-20211022235205562.chn" target="_blank" title="Thực quyền của VNG với Tốc Chiến, có thật sự là &quot;sân chơi của VNG, quyền của VNG&quot; để rồi bị đối xử thế này?">Tốc Chiến</a>&nbsp;Việt Nam l&ecirc;n Top 1 to&agrave;n cầu. Tất nhi&ecirc;n, đ&oacute; mới chỉ l&agrave; kỳ vọng c&ograve;n thực tế ra sao th&igrave; vẫn c&ograve;n phải đợi giải đấu n&agrave;y ch&iacute;nh thức bắt đầu. Nhưng chắc chắn SBTC Esports sẽ nhận được sự cổ vũ rất lớn của cộng đồng game thủ&nbsp;<a href="https://gamek.vn/vng-co-quyen-hanh-gi-voi-toc-chien-co-dang-bi-game-thu-doi-xu-nguyn-rua-den-muc-tan-nhan-the-nay-20211022235205562.chn" target="_blank" title="Thực quyền của VNG với Tốc Chiến, có thật sự là &quot;sân chơi của VNG, quyền của VNG&quot; để rồi bị đối xử thế này?">Tốc Chiến</a>&nbsp;Việt Nam v&agrave; thậm ch&iacute; l&agrave; cả những người y&ecirc;u Esports n&oacute;i chung. H&atilde;y c&ugrave;ng chờ xem, kỳ t&iacute;ch c&oacute; xảy ra hay kh&ocirc;ng nh&eacute;.</p>
', 1, NULL, CAST(N'2021-10-28T17:29:47.980' AS DateTime), CAST(N'2021-11-05T10:51:52.717' AS DateTime), N'Timeline', 76, 3, N'co-hoi-nao-cho-dai-dien-duy-nhat-cua-viet-nam-vo-dich-cktg-cua-bom-tan-moba-toan-cau-2.jpg', 1)
INSERT [dbo].[Posts] ([post_id], [userid], [post_title], [post_slug], [post_teaser], [post_review], [post_content], [post_type], [post_tag], [create_date], [edit_date], [dynasty], [ViewCount], [Rated], [AvatarImage], [status]) VALUES (3, 1, N'10 điểm yếu "vô lý" của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.1)', N'10-diem-yeu-vo-ly-cua-cac-nhan-vat-marvel-iron-man-so-huu-suc-manh-vo-dich-hoa-ra-rat-so-dieu-nay-p1', N'Mặc dù sở hữu sức mạnh lớn nhưng một số nhân vật Marvel thực sự có những điểm yếu vô lý khiến các fan phải ngỡ ngàng.', NULL, N'<p>Ngo&agrave;i sức mạnh to lớn, c&aacute;c nh&acirc;n vật&nbsp;<a href="https://gamek.vn/5-sieu-anh-hung-marvel-duoc-lay-cam-hung-tu-cac-nhan-vat-trong-the-gioi-thuc-tu-ngoai-hinh-den-tinh-cach-deu-sao-y-ban-chinh-20211021130955706.chn" target="_blank" title="5 siêu anh hùng Marvel được lấy cảm hứng từ các nhân vật trong thế giới thực, từ ngoại hình đến tính cách đều ">si&ecirc;u anh h&ugrave;ng</a>&nbsp;v&agrave; nh&acirc;n vật phản diện trong vũ trụ Marvel cũng tồn tại những điểm yếu. Điều n&agrave;y được x&acirc;y dựng l&ecirc;n để cuộc chiến giữa hai b&ecirc;n kh&ocirc;ng bị nh&agrave;m ch&aacute;n v&agrave; kịch t&iacute;nh hơn.</p>

<p>Điều th&uacute; vị l&agrave; một số điểm yếu của c&aacute;c nh&acirc;n vật Marvel đ&ocirc;i khi được đưa ra một c&aacute;ch v&ocirc; l&yacute;. Với những điểm yếu m&agrave; họ c&oacute;, c&aacute;c si&ecirc;u anh h&ugrave;ng hoặc phản diện c&oacute; thể bị đ&aacute;nh bại một c&aacute;ch dễ d&agrave;ng theo c&aacute;ch kh&aacute; nực cười. V&agrave; dưới đ&acirc;y l&agrave; điểm yếu của một số nh&acirc;n vật khiến c&aacute;c fan phải ngỡ ng&agrave;ng.</p>

<p><strong>Electro &ndash; Nước</strong></p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/27/anh-6-1635319691917401068477.jpg" target="_blank" title=""><img alt="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 1." id="img_377720957468590080" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/27/anh-6-1635319691917401068477.jpg" title="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 1." /></a></p>

<p>Electro l&agrave; một nh&acirc;n vật phản diện cấp B với Người Nhện, nhưng anh ta cũng l&agrave; một trong những kẻ &aacute;c mạnh nhất trong vũ trụ Marvel với sức mạnh vượt trội. Về cơ bản, Electro l&agrave; một loại pin sống v&agrave; c&oacute; thể sử dụng năng lượng của n&oacute; để tạo ra sự hỗn loạn. Tuy nhi&ecirc;n, c&oacute; một điểm yếu khiến n&oacute; rất dễ bị đ&aacute;nh bại đ&oacute; l&agrave; nước. Đ&uacute;ng vậy, nước c&oacute; thể khiến anh ta bị đoản mạch v&agrave; mất sức.</p>

<p><strong>Human Torch - Amiăng</strong></p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/27/anh-7-16353196919541243300088.jpg" target="_blank" title=""><img alt="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 2." id="img_377720954834055168" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/27/anh-7-16353196919541243300088.jpg" title="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 2." /></a></p>

<p>Nh&igrave;n cơ thể của Human Torch chứa đầy lửa, c&oacute; lẽ nhiều người cho rằng điểm yếu lớn nhất của nh&acirc;n vật n&agrave;y ch&iacute;nh l&agrave; nước. Tuy nhi&ecirc;n, v&agrave;o những năm 1960, Huma Torch được cho l&agrave; c&oacute; điểm yếu lớn trước vật liệu l&agrave;m từ amiăng để rồi kẻ &aacute;c c&oacute; t&ecirc;n Asbestos Man trở th&agrave;nh kẻ th&ugrave; kh&ocirc;ng đội trời chung của hắn.</p>

<p>Điều n&agrave;y l&agrave; do ngo&agrave;i việc độc hại, amiăng c&ograve;n l&agrave; một vật liệu chống ch&aacute;y. Tr&ecirc;n thực tế, người ta cho rằng Asbestos Man c&oacute; một tấm lưới c&oacute; thể dập tắt ngọn lửa của Human Torch ngay lập tức</p>

<p><strong>Daredevil &ndash; Tiếng ồn</strong></p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/27/anh-8-16353196919801549773083.jpg" target="_blank" title=""><img alt="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 3." id="img_377720954825383936" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/27/anh-8-16353196919801549773083.jpg" title="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 3." /></a></p>

<p>Daredevil l&agrave; một nh&acirc;n vật c&oacute; gi&aacute;c quan phi thường. Anh ta c&oacute; thể nghe thấy nhịp tim của ai đ&oacute; v&agrave; ghi nhớ m&ugrave;i của họ. Nhờ khả năng n&agrave;y m&agrave; Daredevil c&oacute; thể biết rằng Peter Parker v&agrave; Người Nhện l&agrave; c&ugrave;ng một người chỉ bằng c&aacute;ch ngửi m&ugrave;i cơ thể. D&ugrave; vậy, Daredevil sẽ ngay lập tức &quot;bất lực&quot; nếu nghe thấy tiếng động lớn v&igrave; n&oacute; sẽ can thiệp trực tiếp v&agrave;o sức mạnh của si&ecirc;u gi&aacute;c quan của anh ta.</p>

<p><strong>Venom - Lửa</strong></p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/27/anh-9-1635319692012437832360.jpg" target="_blank" title=""><img alt="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 4." id="img_377720956636143616" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/27/anh-9-1635319692012437832360.jpg" title="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 4." /></a></p>

<p>Lo&agrave;i Symbiotes thường sợ đến mức muốn bất lực d&ugrave; chỉ với một ngọn lửa nhỏ, nhưng với trường hợp của Venom th&igrave; c&oacute; kh&aacute;c đ&ocirc;i ch&uacute;t. Venom đ&atilde; trui r&egrave;n khả năng chống chịu của n&oacute; qua kh&aacute; nhiều lần v&agrave; ho&agrave;n to&agrave;n c&oacute; thể chịu đựng nếu ngọn lửa đ&oacute; kh&ocirc;ng qu&aacute; khủng khiếp. B&ecirc;n cạnh đ&oacute; Venom rất sợ &acirc;m thanh cao tần. C&aacute;c dạng &acirc;m thanh khi chưa đạt đến mức n&agrave;y th&igrave; kh&ocirc;ng m&agrave; chỉ c&oacute; thể g&acirc;y ch&uacute;t kh&oacute; chịu cho Venom m&agrave; th&ocirc;i.</p>

<p><strong>Luke Cage - Laser</strong></p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/27/anh-10-1635319692290364067334.jpg" target="_blank" title=""><img alt="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 5." id="img_377720955883700224" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/27/anh-10-1635319692290364067334.jpg" title="10 điểm yếu vô lý của các nhân vật Marvel, Iron Man sở hữu sức mạnh vô địch hóa ra rất sợ điều này (P.2) - Ảnh 5." /></a></p>

<p>Nếu bạn đ&atilde; đọc truyện tranh hoặc xem loạt phim Luke Cage, bạn sẽ biết rằng nh&acirc;n vật Marvel n&agrave;y c&oacute; sức mạnh v&agrave; sức chịu đựng v&ocirc; c&ugrave;ng lớn. Bởi v&igrave; Luke Cage c&oacute; một l&agrave;n da được cho l&agrave; cứng như th&eacute;p để kh&ocirc;ng bị thương hay trầy xước g&igrave; ngay cả khi bị kẻ th&ugrave; bắn.</p>

<p>Mặc d&ugrave; vậy, Luke Cage vẫn c&oacute; thể bị thương nếu kẻ th&ugrave; sử dụng vũ kh&iacute; ph&aacute;t ra tia laze khi tấn c&ocirc;ng. Nếu bị tia laze bắn tr&uacute;ng, l&agrave;n da từng cứng như th&eacute;p của Luke sẽ bị thương như một người b&igrave;nh thường.</p>
', 1, NULL, CAST(N'2021-10-28T17:33:14.147' AS DateTime), CAST(N'2021-11-04T18:23:39.893' AS DateTime), N'Timeline', 19, 3, N'10-diem-yeu-vo-ly-cua-cac-nhan-vat-marvel-iron-man-so-huu-suc-manh-vo-dich-hoa-ra-rat-so-dieu-nay-p1-25.jpg', 1)
INSERT [dbo].[Posts] ([post_id], [userid], [post_title], [post_slug], [post_teaser], [post_review], [post_content], [post_type], [post_tag], [create_date], [edit_date], [dynasty], [ViewCount], [Rated], [AvatarImage], [status]) VALUES (4, 1, N'T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT', N't1-6-lan-vao-vong-loai-van-thua-cai-ten-nay-faker-xung-dang-ky-luc-gia-cua-lang-lmht', N'Có một đội vào vòng loại nhiều hơn T1 nhưng không một tuyển thủ nào sánh được với Faker.', NULL, N'<p>Trong lịch sử&nbsp;<a href="https://gamek.vn/cktg.htm" target="_blank" title="cktg">CKTG</a>, nếu phải kể một c&aacute;i t&ecirc;n được coi l&agrave; &ldquo;vua&rdquo; của giải đấu n&agrave;y, th&igrave; chắc chắn c&aacute;i t&ecirc;n đầu ti&ecirc;n m&agrave; mọi người nghĩ đến phải l&agrave;&nbsp;<a href="https://gamek.vn/skt-t1.htm" target="_blank" title="skt t1">SKT T1</a>/T1. Trong cả 6 lần m&agrave; đội tuyển n&agrave;y được tham dự CKTG (t&iacute;nh cả năm 2021), họ đều đứng đầu bảng, đều v&agrave;o v&ograve;ng loại trực tiếp v&agrave; đ&aacute;ng ch&uacute; &yacute; hơn, họ đều v&agrave;o được tới &iacute;t nhất l&agrave; B&aacute;n Kết v&agrave; 3/6 trận B&aacute;n Kết m&agrave; họ đ&atilde; đấu, th&igrave; sau đ&oacute; họ gi&agrave;nh lu&ocirc;n chức v&ocirc; địch. 1 lần họ về nh&igrave; v&agrave; 1 lần dừng ch&acirc;n ở B&aacute;n Kết (ri&ecirc;ng B&aacute;n Kết 2021 chưa thi đấu).</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/28/-1635396775547376456469.jpg" target="_blank" title="SKT T1 là đội rất giàu thành tích trong lịch sử LMHT nói chung và CKTG nói riêng"><img alt="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 1." id="img_378044267089604608" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/28/-1635396775547376456469.jpg" title="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 1." /></a></p>

<p>SKT T1 l&agrave; đội rất gi&agrave;u th&agrave;nh t&iacute;ch trong lịch sử LMHT n&oacute;i chung v&agrave; CKTG n&oacute;i ri&ecirc;ng</p>

<p>Tuy vậy, số lần bước v&agrave;o v&ograve;ng loại trực tiếp của SKT T1/T1 lại thấp hơn so với 1 c&aacute;i t&ecirc;n. Ch&iacute;nh l&agrave;&nbsp;<a href="https://gamek.vn/fnatic.htm" target="_blank" title="fnatic">Fnatic</a>&nbsp;- đại diện ch&acirc;u &Acirc;u v&agrave; l&agrave; một trong những đội tuyển gi&agrave;u truyền thống của l&agrave;ng LMHT. Đội tuyển n&agrave;y đ&atilde; c&oacute; 7 lần bước v&agrave;o v&ograve;ng loại trực tiếp trong lịch sử CKTG, v&agrave; ở lần đầu ti&ecirc;n, họ đ&atilde; gi&agrave;nh lu&ocirc;n chức v&ocirc; địch. Những lần hiếm hoi m&agrave; FNC kh&ocirc;ng v&agrave;o v&ograve;ng loại trực tiếp l&agrave; những năm 2012, 2014, 2016 v&agrave; 2021. Ri&ecirc;ng 2016, đội tuyển n&agrave;y thậm ch&iacute; c&ograve;n kh&ocirc;ng được đi CKTG.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/28/-1635396777523471683209.jpg" target="_blank" title="Fnatic mới là đội sở hữu số lần vào vòng loại trực tiếp nhiều nhất lịch sử CKTG"><img alt="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 2." id="img_378044274839633920" src="https://gamek.mediacdn.vn/133514250583805952/2021/10/28/-1635396777523471683209.jpg" title="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 2." /></a></p>

<p>Fnatic mới l&agrave; đội sở hữu số lần v&agrave;o v&ograve;ng loại trực tiếp nhiều nhất lịch sử CKTG</p>

<p>Tuy vậy, so về số lần v&agrave;o v&ograve;ng loại trực tiếp, SKT T1/T1 c&oacute; thể thua FNC nhưng ri&ecirc;ng th&agrave;nh t&iacute;ch c&aacute; nh&acirc;n, th&igrave; chưa c&oacute; bất kỳ một tuyển thủ n&agrave;o c&oacute; thể vượt qua được&nbsp;<a href="https://gamek.vn/faker.htm" target="_blank" title="faker">Faker</a>. Bởi v&igrave; gắn b&oacute; với duy nhất 1 m&agrave;u &aacute;o kể từ khi thi đấu chuy&ecirc;n nghiệp, do đ&oacute;, Faker l&agrave; tuyển thủ c&oacute; nhiều chức v&ocirc; địch CKTG nhất, nhiều lần v&agrave;o B&aacute;n Kết nhất trong suốt chiều d&agrave;i lịch sử giải đấu cấp độ cao nhất của l&agrave;ng LMHT.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/28/-16353967775691598461924.jpg" target="_blank" title="Nhưng Faker thì luôn là tuyển thủ kiêm kỷ lục gia của làng LMHT"><img alt="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 3." id="img_378044276107784192" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/28/-16353967775691598461924.jpg" title="T1 6 lần vào vòng loại vẫn thua cái tên này, Faker xứng đáng kỷ lục gia của làng LMHT - Ảnh 3." /></a></p>

<p>Nhưng Faker th&igrave; lu&ocirc;n l&agrave; tuyển thủ ki&ecirc;m kỷ lục gia của l&agrave;ng LMHT</p>

<p>Với việc đang c&ugrave;ng T1 chuẩn bị cho trận B&aacute;n Kết trước DWG KIA, Faker cũng đang đứng trước cơ hội trở th&agrave;nh tuyển thủ đầu ti&ecirc;n v&agrave; duy nhất của l&agrave;ng LMHT bước v&agrave;o 5/6 trận chung kết CKTG m&agrave; m&igrave;nh được tham dự. Thậm ch&iacute;, nếu gi&agrave;nh được chiếc c&uacute;p v&ocirc; địch, kh&ocirc;ng chỉ ho&agrave;n th&agrave;nh t&acirc;m nguyện m&agrave; Faker sẽ thiết lập một kỷ lục mới về tuyển thủ sở hữu nhiều chức v&ocirc; địch CKTG nhất - một th&agrave;nh t&iacute;ch m&agrave; rất kh&oacute; c&oacute; ai c&oacute; thể l&agrave;m được, kể cả l&agrave; thời gian d&agrave;i sau n&agrave;y đi chăng nữa.</p>
', 1, NULL, CAST(N'2021-10-28T17:42:59.207' AS DateTime), CAST(N'2021-11-04T18:25:43.100' AS DateTime), N'Timeline', 58, 3, N't1-6-lan-vao-vong-loai-van-thua-cai-ten-nay-faker-xung-dang-ky-luc-gia-cua-lang-lmht-4.jpeg', 1)
INSERT [dbo].[Posts] ([post_id], [userid], [post_title], [post_slug], [post_teaser], [post_review], [post_content], [post_type], [post_tag], [create_date], [edit_date], [dynasty], [ViewCount], [Rated], [AvatarImage], [status]) VALUES (7, 2, N'3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực "phế" mà game thủ Genshin Impact cần tránh', N'3-sai-lam-chi-mang-co-the-khien-hu-tao-tro-nen-cuc-phe-ma-game-thu-genshin-impact-can-tranh', N'Việc game thủ xây dựng, sử dụng sai lầm Hu Tao hoàn toàn có thể khiến một "siêu DPS" của Genshin Impact trở nên cực kỳ yếu.
', NULL, N'<p><strong>Cố gắng lấy cộng hưởng 2 Hỏa</strong></p>

<p>Một trong những lợi thế của hệ Hỏa trong&nbsp;<a href="https://gamek.vn/genshin-impact.htm" target="_blank" title="genshin impact">Genshin Impact</a>&nbsp;đ&oacute; l&agrave; sở hữu cộng hưởng 2 Hỏa cung cấp tới 25% tấn c&ocirc;ng căn bản cho to&agrave;n đội. Điều n&agrave;y khiến cho lượng s&aacute;t thương của to&agrave;n bộ đội h&igrave;nh trở n&ecirc;n lớn hơn rất nhiều. Tuy nhi&ecirc;n với ri&ecirc;ng&nbsp;<a href="https://gamek.vn/hu-tao.htm" target="_blank" title="hu tao">Hu Tao</a>&nbsp;th&igrave; cộng hưởng 2 Hỏa lại kh&ocirc;ng cần thiết bởi l&yacute; do cực kỳ đơn giản đ&oacute; l&agrave; tấn c&ocirc;ng căn bản của nh&acirc;n vật n&agrave;y thuộc h&agrave;ng thấp nhất game. V&igrave; vậy việc c&oacute; th&ecirc;m cộng hưởng 2 Hỏa th&igrave; lượng damage m&agrave; Hu Tao g&acirc;y ra cũng chẳng cao hơn l&agrave; bao.</p>

<p>&nbsp;</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/photo-1-16358287816081980668803.jpg" target="_blank" title="Tấn công căn bản của Hu Tao là cực kỳ thấp nên cộng hưởng 2 Hỏa không mang lại nhiều sát thương"><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 1." id="img_379856240167604224" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/photo-1-16358287816081980668803.jpg" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 1." /></a></p>

<p>Tấn c&ocirc;ng căn bản của Hu Tao l&agrave; cực kỳ thấp n&ecirc;n cộng hưởng 2 Hỏa kh&ocirc;ng mang lại nhiều s&aacute;t thương</p>

<p>Hơn nữa, việc cố gắng lấy cộng hưởng 2 Hỏa c&ograve;n khiến cho khả năng tạo phản ứng li&ecirc;n tục của Hu Tao bị hạn chế đi kh&aacute; nhiều. Trong một đội h&igrave;nh xoay quanh Hu Tao th&igrave; bạn sẽ phải c&oacute; 1 hoặc 2 nh&acirc;n vật cấp dấu Thủy, Băng li&ecirc;n tục để tối đa lượng damage của nh&acirc;n vật n&agrave;y. Việc chơi 2 nh&acirc;n vật Hỏa (bao gồm Hu Tao) sẽ khiến bạn kh&ocirc;ng thể đưa th&ecirc;m c&aacute;c unit c&oacute; khả năng hỗ trợ khi&ecirc;n, s&aacute;t thương mạnh kh&aacute;c như Zhongli, Albedo.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/hu-1635829042896793935739.jpg" target="_blank" title="Những hỗ trợ như Zhongli, Albedo sẽ giúp cho Hu Tao sinh tồn, gây sát thương tốt hơn rất nhiều thay vì cố gắng lấy cộng hưởng 2 Hỏa"><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 2." id="img_379857326841626624" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/hu-1635829042896793935739.jpg" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 2." /></a></p>

<p>Những hỗ trợ như Zhongli, Albedo sẽ gi&uacute;p cho Hu Tao sinh tồn, g&acirc;y s&aacute;t thương tốt hơn rất nhiều thay v&igrave; cố gắng lấy cộng hưởng 2 Hỏa</p>

<p><strong>Chọn th&aacute;nh dị vật sai lầm</strong></p>

<p>C&oacute; một sự thật l&agrave; b&iacute; cảnh Mật Cung V&ocirc; Vọng l&agrave; nơi được mệnh danh l&agrave; kh&oacute; farm th&aacute;nh dị vật nhất Genshin Impact. Để c&oacute; thể c&oacute; được đủ bộ 4 m&oacute;n Diệm Liệt Ma Nữ Ch&aacute;y Rực th&igrave; game thủ sẽ phải bỏ ra rất nhiều thời gian, c&ocirc;ng sức để đ&aacute;nh b&iacute; cảnh n&agrave;y li&ecirc;n tục. Với nhiều game thủ kh&ocirc;ng c&oacute; t&iacute;nh ki&ecirc;n tr&igrave; cao th&igrave; họ sẽ dễ rơi v&agrave;o t&igrave;nh trạng nản ch&iacute; v&agrave; bỏ qua b&iacute; cảnh n&agrave;y của&nbsp;<a href="https://gamek.vn/mihoyo.htm" target="_blank" title="mihoyo">miHoYo</a>. Từ đ&oacute; dẫn tới việc chọn th&aacute;nh dị vật sai lầm cho Hu Tao.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/hu1-16358291577281479074127.jpg" target="_blank" title="Việc farm được một bộ 4 Diệm Liệt Ma Nữ Cháy Rực ưng ý cho Hu Tao là điều không dễ chút nào"><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 3." id="img_379857807713452032" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/hu1-16358291577281479074127.jpg" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 3." /></a></p>

<p>Việc farm được một bộ 4 Diệm Liệt Ma Nữ Ch&aacute;y Rực ưng &yacute; cho Hu Tao l&agrave; điều kh&ocirc;ng dễ ch&uacute;t n&agrave;o</p>

<p>Ch&uacute;ng ta cần nhớ rằng bộ Diệm Liệt Ma Nữ Ch&aacute;y Rực l&agrave; ph&ugrave; hợp nhất với Hu Tao khi tăng cả s&aacute;t thương nguy&ecirc;n tố Hỏa lẫn lượng damage của c&aacute;c phản ứng Bốc Hơi, Tan Chảy... Những bộ th&aacute;nh dị vật kh&aacute;c như D&ograve;ng Hồi Ức Bất Tận hay set mix 2 Ma Nữ, 2 T&ocirc;ng Thất... cũng chẳng thể cho lượng s&aacute;t thương đầu ra lớn với Hu Tao. V&igrave; vậy d&ugrave; c&oacute; gặp nhiều kh&oacute; khăn th&igrave; việc cố gắng kiếm một bộ 4 Ma Nữ l&agrave; điều v&ocirc; c&ugrave;ng quan trọng để Hu Tao c&oacute; thể g&acirc;y damage hiệu quả.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/photo-1-1635829653862988949440.jpg" target="_blank" title="Hu Tao sẽ bị thiếu hụt sát thương đi khá nhiều nếu như không sử dụng 4 món Diệm Liệt Ma Nữ Cháy Rực"><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 4." id="img_379859894072950784" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/photo-1-1635829653862988949440.jpg" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 4." /></a></p>

<p>Hu Tao sẽ bị thiếu hụt s&aacute;t thương đi kh&aacute; nhiều nếu như kh&ocirc;ng sử dụng 4 m&oacute;n Diệm Liệt Ma Nữ Ch&aacute;y Rực</p>

<p><strong>Kh&ocirc;ng nắm r&otilde; kỹ năng hủy động t&aacute;c thừa khi trọng k&iacute;ch</strong></p>

<p>Mặc d&ugrave; l&agrave; một nh&acirc;n vật DPS mạnh nhưng Hu Tao vẫn tồn tại một số điểm yếu. Trong số đ&oacute; th&igrave; đ&ograve;n trọng k&iacute;ch xuy&ecirc;n qua mục ti&ecirc;u l&agrave; điều khiến cho nh&acirc;n vật n&agrave;y dễ rơi v&agrave;o t&igrave;nh trạng l&atilde;ng ph&iacute; s&aacute;t thương. Nếu bạn cứ spam trọng k&iacute;ch li&ecirc;n tục th&igrave; sẽ khiến nh&acirc;n vật kh&ocirc;ng tập trung s&aacute;t thương v&agrave;o một mục ti&ecirc;u, tốn thể lực v&agrave; kh&oacute; c&oacute; thể n&eacute; đ&ograve;n đ&aacute;nh từ qu&aacute;i vật.</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/1-1635830268112230597728.png" target="_blank" title="Ngay khi bạn đang sử dụng trong kích..."><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 5." id="img_379862467658190848" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/1-1635830268112230597728.png" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 5." /></a></p>

<p>Ngay khi bạn đang sử dụng trong k&iacute;ch...</p>

<p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/11/2/2-1635830268451211467071.png" target="_blank" title="... hãy ấn nhảy ngay lập tức để hủy động tác thừa"><img alt="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 6." id="img_379862466633547776" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/11/2/2-1635830268451211467071.png" title="3 sai lầm chí mạng có thể khiến Hu Tao trở nên cực phế mà game thủ Genshin Impact cần tránh - Ảnh 6." /></a></p>

<p>... h&atilde;y ấn nhảy ngay lập tức để hủy động t&aacute;c thừa</p>

<p>V&igrave; vậy để c&oacute; thể sử dụng Hu Tao hiệu quả, bạn n&ecirc;n nắm r&otilde; kỹ năng hủy động t&aacute;c thừa khi tung đ&ograve;n trọng k&iacute;ch. Về cơ bản th&igrave; trước khi hoạt ảnh của đ&ograve;n đ&aacute;nh trọng k&iacute;ch kết th&uacute;c, bạn sẽ d&ugrave;ng ph&iacute;m nhảy để c&oacute; thể giữ Hu Tao ở gần với mục ti&ecirc;u bạn đang tấn c&ocirc;ng. Bạn cũng c&oacute; thể d&ugrave;ng h&agrave;nh động lướt theo hướng ngược lại để c&oacute; thể hủy động t&aacute;c thừa n&agrave;y. Điều n&agrave;y sẽ gi&uacute;p bạn tiết kiệm kh&aacute; nhiều thời gian khi g&acirc;y s&aacute;t thương v&agrave; gi&uacute;p Hu Tao hiệu quả hơn hẳn ở khoản g&acirc;y damage.</p>
', 1, NULL, CAST(N'2021-11-05T07:17:13.230' AS DateTime), CAST(N'2021-11-05T07:43:57.753' AS DateTime), N'Timeline', 12, 3, N'3-sai-lam-chi-mang-co-the-khien-hu-tao-tro-nen-cuc-phe-ma-game-thu-genshin-impact-can-tranh-4.jpg', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([seriesID], [seriesName]) VALUES (1, N'haha')
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
SET IDENTITY_INSERT [dbo].[StickyPosts] ON 

INSERT [dbo].[StickyPosts] ([id], [priority], [post_id]) VALUES (1, 1, 2)
INSERT [dbo].[StickyPosts] ([id], [priority], [post_id]) VALUES (2, 2, 3)
INSERT [dbo].[StickyPosts] ([id], [priority], [post_id]) VALUES (3, 3, 4)
SET IDENTITY_INSERT [dbo].[StickyPosts] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (1, N'GAME MOBILE')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (2, N'GAME ONLINE')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (3, N'ESPORTS')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (4, N'PC/CONSOLE')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (5, N'CÔNG NGHỆ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (6, N'PHIM ẢNH')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (7, N'TIN TỨC')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (8, N'CỘNG ĐỒNG')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
INSERT [dbo].[Tbl_PostTags] ([PostID], [TagID]) VALUES (2, 1)
INSERT [dbo].[Tbl_PostTags] ([PostID], [TagID]) VALUES (7, 2)
INSERT [dbo].[Tbl_PostTags] ([PostID], [TagID]) VALUES (4, 3)
INSERT [dbo].[Tbl_PostTags] ([PostID], [TagID]) VALUES (3, 6)
GO
INSERT [dbo].[Tbl_SeriesPost] ([PostID], [seriesID]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userid], [username], [password], [fullname], [userrole], [status]) VALUES (1, N'admin', N'0192023A7BBD73250516F069DF18B500', N'PPHP', N'admin', 1)
INSERT [dbo].[Users] ([userid], [username], [password], [fullname], [userrole], [status]) VALUES (2, N'phuong', N'60C9312821B0D1EB614810A21F159147', N'Hữu Phương', N'editor', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_post_slug]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_post_slug] ON [dbo].[Posts]
(
	[post_slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_userid]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_userid] ON [dbo].[Posts]
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_post_id]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_post_id] ON [dbo].[StickyPosts]
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostID]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostID] ON [dbo].[Tbl_PostTags]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TagID]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_TagID] ON [dbo].[Tbl_PostTags]
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostID]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostID] ON [dbo].[Tbl_SeriesPost]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_seriesID]    Script Date: 11/21/2021 4:12:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_seriesID] ON [dbo].[Tbl_SeriesPost]
(
	[seriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Users_userid]
GO
ALTER TABLE [dbo].[StickyPosts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StickyPosts_dbo.Posts_post_id] FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([post_id])
GO
ALTER TABLE [dbo].[StickyPosts] CHECK CONSTRAINT [FK_dbo.StickyPosts_dbo.Posts_post_id]
GO
ALTER TABLE [dbo].[Tbl_PostTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tbl_PostTags_dbo.Posts_PostID] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([post_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_PostTags] CHECK CONSTRAINT [FK_dbo.Tbl_PostTags_dbo.Posts_PostID]
GO
ALTER TABLE [dbo].[Tbl_PostTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tbl_PostTags_dbo.Tags_TagID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_PostTags] CHECK CONSTRAINT [FK_dbo.Tbl_PostTags_dbo.Tags_TagID]
GO
ALTER TABLE [dbo].[Tbl_SeriesPost]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tbl_SeriesPost_dbo.Posts_PostID] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([post_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_SeriesPost] CHECK CONSTRAINT [FK_dbo.Tbl_SeriesPost_dbo.Posts_PostID]
GO
ALTER TABLE [dbo].[Tbl_SeriesPost]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tbl_SeriesPost_dbo.Series_seriesID] FOREIGN KEY([seriesID])
REFERENCES [dbo].[Series] ([seriesID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_SeriesPost] CHECK CONSTRAINT [FK_dbo.Tbl_SeriesPost_dbo.Series_seriesID]
GO
USE [master]
GO
ALTER DATABASE [NewsSite] SET  READ_WRITE 
GO
