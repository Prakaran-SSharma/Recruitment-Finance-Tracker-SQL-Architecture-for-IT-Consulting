CREATE DATABASE [vendor_database];
GO
USE [vendor_database];
GO

CREATE TABLE [dbo].[Account](
	[account_team_id] [int] NOT NULL,
	[rm_name] [nvarchar](255) NULL,
	[rm_email] [nvarchar](255) NULL,
	[sm_name] [nvarchar](255) NULL,
	[sm_email] [nvarchar](255) NULL,
	[rec_name] [nvarchar](255) NULL,
	[rec_email] [nvarchar](255) NULL,
	[tl_name] [nvarchar](255) NULL,
	[tl_email] [nvarchar](255) NULL,
	[remarks] [nvarchar](255) NULL,
	[rm_code] [bigint] NULL,
	[sm_code] [bigint] NULL,
	[rec_code] [bigint] NULL,
	[tl_code] [bigint] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agency]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agency](
	[agency_id] [int] NOT NULL,
	[company_name] [nvarchar](255) NULL,
	[spoc_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[company_number] [nvarchar](255) NULL,
	[bank_name] [nvarchar](255) NULL,
	[sort_code] [nvarchar](255) NULL,
	[iban] [nvarchar](255) NULL,
	[bank_address] [nvarchar](255) NULL,
	[contact_number] [bigint] NULL,
	[vat_number] [bigint] NULL,
	[account_number] [bigint] NULL,
 CONSTRAINT [PK_Agency] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[candidate_id] [int] NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[nationality] [nvarchar](255) NULL,
	[passport_number] [nvarchar](255) NULL,
	[passport_valid_end_date] [datetime] NULL,
	[driving_license_number] [nvarchar](255) NULL,
	[home_address] [nvarchar](255) NULL,
	[bank_name] [nvarchar](255) NULL,
	[sort_code] [nvarchar](255) NULL,
	[bank_address] [nvarchar](255) NULL,
	[contact_number] [bigint] NULL,
	[account_number] [bigint] NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Limited]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Limited](
	[Limited_Company_id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[spoc_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[agency_number] [nvarchar](255) NULL,
	[bank_name] [nvarchar](255) NULL,
	[sort_code] [nvarchar](255) NULL,
	[iban] [nvarchar](255) NULL,
	[bank_address] [nvarchar](255) NULL,
	[contact_number] [bigint] NULL,
	[account_number] [bigint] NULL,
	[vat_number] [bigint] NULL,
 CONSTRAINT [PK_Limited] PRIMARY KEY CLUSTERED 
(
	[Limited_Company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Margin]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Margin](
	[margin_agency_id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[spoc_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[agency_number] [nvarchar](255) NULL,
	[bank_name] [nvarchar](255) NULL,
	[sort_code] [nvarchar](255) NULL,
	[iban] [nvarchar](255) NULL,
	[bank_address] [nvarchar](255) NULL,
	[contact_number] [bigint] NULL,
	[account_number] [bigint] NULL,
	[vat_number] [bigint] NULL,
 CONSTRAINT [PK_Margin] PRIMARY KEY CLUSTERED 
(
	[margin_agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workorder]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workorder](
	[work_order_id] [int] NOT NULL,
	[candidate_id] [int] NOT NULL,
	[agency_id] [int] NOT NULL,
	[margin_agency_id] [int] NOT NULL,
	[Limited_Company_id] [int] NOT NULL,
	[account_team_id] [int] NOT NULL,
	[resume_link] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[client_location] [nvarchar](255) NULL,
	[work_order_type] [nvarchar](255) NULL,
	[candidate_work_location] [nvarchar](255) NULL,
	[inside_ir35] [nvarchar](255) NULL,
	[paye_model] [nvarchar](255) NULL,
	[designation] [nvarchar](255) NULL,
	[wo_start_date] [datetime] NULL,
	[wo_end_date] [datetime] NULL,
	[notice_period_unit] [nvarchar](255) NULL,
	[payment_terms_units] [nvarchar](255) NULL,
	[invoice_frequency] [nvarchar](255) NULL,
	[remarks] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[cin_sap_id] [bigint] NULL,
	[notice_period] [bigint] NULL,
	[payment_terms_days] [bigint] NULL,
 CONSTRAINT [PK_Workorder] PRIMARY KEY CLUSTERED 
(
	[work_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_WorkorderOverview]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Document](
	[document_id] [int] NOT NULL,
	[document_type] [nvarchar](255) NULL,
	[document_number] [nvarchar](255) NULL,
	[valid_until] [datetime] NULL,
	[candidate_id] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
