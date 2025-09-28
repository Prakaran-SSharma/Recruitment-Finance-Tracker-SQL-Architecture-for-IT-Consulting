USE [master]
GO
/****** Object:  Database [vendor_database]    Script Date: 9/28/2025 6:30:10 PM ******/
CREATE DATABASE [vendor_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vendor_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KARANSHARMA\MSSQL\DATA\vendor_database.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vendor_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KARANSHARMA\MSSQL\DATA\vendor_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [vendor_database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vendor_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vendor_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vendor_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vendor_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vendor_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vendor_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [vendor_database] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vendor_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vendor_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vendor_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vendor_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vendor_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vendor_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vendor_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vendor_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vendor_database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vendor_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vendor_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vendor_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vendor_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vendor_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vendor_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vendor_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vendor_database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vendor_database] SET  MULTI_USER 
GO
ALTER DATABASE [vendor_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vendor_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vendor_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vendor_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vendor_database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vendor_database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vendor_database] SET QUERY_STORE = ON
GO
ALTER DATABASE [vendor_database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [vendor_database]
GO
/****** Object:  FullTextCatalog [ftCatalog]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE FULLTEXT CATALOG [ftCatalog] WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE VIEW [dbo].[vw_WorkorderOverview] AS
SELECT 
    w.work_order_id,
    c.full_name AS candidate_name,
    a.company_name AS agency_name,
    m.name AS margin_agency_name,
    l.name AS ltd_company_name,
    acc.rm_name AS rm_name,
    w.client_name,
    w.client_location,
    w.wo_start_date,
    w.wo_end_date,
    w.status
FROM Workorder w
INNER JOIN Candidate c ON w.candidate_id = c.candidate_id
INNER JOIN Agency a ON w.agency_id = a.agency_id
INNER JOIN Margin m ON w.margin_agency_id = m.margin_agency_id
INNER JOIN Limited l ON w.Limited_Company_id = l.Limited_Company_id
INNER JOIN Account acc ON w.account_team_id = acc.account_team_id;
GO
/****** Object:  View [dbo].[vw_ActiveWorkorders]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ActiveWorkorders] AS
SELECT 
    w.work_order_id,
    w.candidate_id,
    c.full_name AS candidate_name,
    w.client_name,
    w.client_location,
    w.designation,
    w.wo_start_date,
    w.wo_end_date,
    w.status
FROM dbo.Workorder w
INNER JOIN dbo.Candidate c ON w.candidate_id = c.candidate_id
WHERE w.wo_end_date >= GETDATE() OR w.status = 'Active';
GO
/****** Object:  Table [dbo].[RateHistory]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateHistory](
	[Rate_id] [int] NOT NULL,
	[candidate_id] [int] NOT NULL,
	[effective_date] [datetime] NULL,
	[agency_paye_rate] [bigint] NULL,
	[paye_rate] [bigint] NULL,
	[margin_agency_rate] [bigint] NULL,
	[idc_margin] [bigint] NULL,
	[bill_rate] [bigint] NULL,
 CONSTRAINT [PK_RateHistory] PRIMARY KEY CLUSTERED 
(
	[Rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_CandidateWorkSummary]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CandidateWorkSummary] AS
SELECT 
    c.candidate_id,
    c.full_name AS candidate_name,
    COUNT(DISTINCT w.work_order_id) AS total_work_orders,
    MIN(w.wo_start_date) AS first_work_start,
    MAX(w.wo_end_date) AS last_work_end,
    AVG(r.paye_rate) AS avg_paye_rate,
    AVG(r.bill_rate) AS avg_bill_rate
FROM dbo.Candidate c
LEFT JOIN dbo.Workorder w ON c.candidate_id = w.candidate_id
LEFT JOIN dbo.RateHistory r ON c.candidate_id = r.candidate_id
GROUP BY c.candidate_id, c.full_name;
GO
/****** Object:  View [dbo].[vw_MonthlyCandidateHires]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MonthlyCandidateHires] AS
SELECT 
    FORMAT(w.wo_start_date, 'yyyy-MM') AS HireMonth,
    COUNT(DISTINCT w.candidate_id) AS CandidatesHired
FROM Workorder w
GROUP BY FORMAT(w.wo_start_date, 'yyyy-MM');
GO
/****** Object:  View [dbo].[vw_MonthlyBillingSummary]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MonthlyBillingSummary] AS
SELECT 
    FORMAT(r.effective_date, 'yyyy-MM') AS BillingMonth,
    AVG(r.bill_rate) AS AvgBillRate,
    AVG(r.paye_rate) AS AvgPayeRate,
    AVG(r.agency_paye_rate) AS AvgAgencyPayeRate,
    COUNT(r.Rate_id) AS RateChangeCount
FROM RateHistory r
GROUP BY FORMAT(r.effective_date, 'yyyy-MM');
GO
/****** Object:  View [dbo].[vw_MonthlyWorkorderByAgency]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MonthlyWorkorderByAgency] AS
SELECT 
    a.company_name AS AgencyName,
    FORMAT(w.wo_start_date, 'yyyy-MM') AS Month,
    COUNT(w.work_order_id) AS WorkorderCount
FROM Workorder w
JOIN Agency a ON w.agency_id = a.agency_id
GROUP BY a.company_name, FORMAT(w.wo_start_date, 'yyyy-MM');
GO
/****** Object:  View [dbo].[vw_MonthlyRateChangesPerCandidate]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MonthlyRateChangesPerCandidate] AS
SELECT 
    c.full_name,
    FORMAT(r.effective_date, 'yyyy-MM') AS RateMonth,
    COUNT(r.Rate_id) AS RateChangeCount
FROM RateHistory r
JOIN Candidate c ON r.candidate_id = c.candidate_id
GROUP BY c.full_name, FORMAT(r.effective_date, 'yyyy-MM');

GO
/****** Object:  View [dbo].[vw_AgencyPerformance]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_AgencyPerformance] AS
SELECT 
    a.agency_id,
    a.company_name AS agency_name,
    COUNT(DISTINCT w.candidate_id) AS total_candidates,
    COUNT(w.work_order_id) AS total_workorders,
    AVG(r.bill_rate) AS avg_bill_rate,
    SUM(r.bill_rate) AS total_billings
FROM dbo.Agency a
LEFT JOIN dbo.Workorder w ON a.agency_id = w.agency_id
LEFT JOIN dbo.RateHistory r ON w.candidate_id = r.candidate_id
GROUP BY a.agency_id, a.company_name;
GO
/****** Object:  View [dbo].[vw_CandidateDetails]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CandidateDetails] AS
SELECT 
    c.candidate_id,
    c.full_name AS candidate_name,
    c.email,
    c.contact_number,
    c.nationality,
    w.work_order_id,
    w.client_name,
    w.client_location,
    w.designation,
    w.wo_start_date,
    w.wo_end_date,
    a.agency_id,
    a.company_name AS agency_name,
    r.effective_date,
    r.agency_paye_rate,
    r.paye_rate,
    r.margin_agency_rate,
    r.idc_margin,
    r.bill_rate,
    w.status
FROM dbo.Candidate c
LEFT JOIN dbo.Workorder w ON c.candidate_id = w.candidate_id
LEFT JOIN dbo.Agency a ON w.agency_id = a.agency_id
LEFT JOIN dbo.RateHistory r ON c.candidate_id = r.candidate_id;
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[date_id] [int] NOT NULL,
	[full_date] [date] NULL,
	[year] [int] NULL,
	[quarter] [int] NULL,
	[month] [int] NULL,
	[day] [int] NULL,
	[weekday] [nvarchar](20) NULL,
	[is_weekend] [bit] NULL,
	[is_holiday] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 9/28/2025 6:30:11 PM ******/
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
/****** Object:  Index [IX_Document_candidate_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Document_candidate_id] ON [dbo].[Document]
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateHistory_candidate_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateHistory_candidate_id] ON [dbo].[RateHistory]
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RateHistory_effective_date]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_RateHistory_effective_date] ON [dbo].[RateHistory]
(
	[effective_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_account_team_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_account_team_id] ON [dbo].[Workorder]
(
	[account_team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_agency_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_agency_id] ON [dbo].[Workorder]
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_candidate_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_candidate_id] ON [dbo].[Workorder]
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_Limited_Company_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_Limited_Company_id] ON [dbo].[Workorder]
(
	[Limited_Company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_margin_agency_id]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_margin_agency_id] ON [dbo].[Workorder]
(
	[margin_agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Workorder_status]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_status] ON [dbo].[Workorder]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Workorder_wo_start_date]    Script Date: 9/28/2025 6:30:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Workorder_wo_start_date] ON [dbo].[Workorder]
(
	[wo_start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Candidate] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[Candidate] ([candidate_id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Candidate]
GO
ALTER TABLE [dbo].[RateHistory]  WITH CHECK ADD  CONSTRAINT [FK_RateHistory_Candidate] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[Candidate] ([candidate_id])
GO
ALTER TABLE [dbo].[RateHistory] CHECK CONSTRAINT [FK_RateHistory_Candidate]
GO
ALTER TABLE [dbo].[Workorder]  WITH CHECK ADD  CONSTRAINT [FK_Workorder_Account] FOREIGN KEY([account_team_id])
REFERENCES [dbo].[Account] ([account_team_id])
GO
ALTER TABLE [dbo].[Workorder] CHECK CONSTRAINT [FK_Workorder_Account]
GO
ALTER TABLE [dbo].[Workorder]  WITH CHECK ADD  CONSTRAINT [FK_Workorder_Agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[Agency] ([agency_id])
GO
ALTER TABLE [dbo].[Workorder] CHECK CONSTRAINT [FK_Workorder_Agency]
GO
ALTER TABLE [dbo].[Workorder]  WITH CHECK ADD  CONSTRAINT [FK_Workorder_Candidate] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[Candidate] ([candidate_id])
GO
ALTER TABLE [dbo].[Workorder] CHECK CONSTRAINT [FK_Workorder_Candidate]
GO
ALTER TABLE [dbo].[Workorder]  WITH CHECK ADD  CONSTRAINT [FK_Workorder_Limited] FOREIGN KEY([Limited_Company_id])
REFERENCES [dbo].[Limited] ([Limited_Company_id])
GO
ALTER TABLE [dbo].[Workorder] CHECK CONSTRAINT [FK_Workorder_Limited]
GO
ALTER TABLE [dbo].[Workorder]  WITH CHECK ADD  CONSTRAINT [FK_Workorder_Margin] FOREIGN KEY([margin_agency_id])
REFERENCES [dbo].[Margin] ([margin_agency_id])
GO
ALTER TABLE [dbo].[Workorder] CHECK CONSTRAINT [FK_Workorder_Margin]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBillingSummary]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetBillingSummary]
    @Month VARCHAR(7)
AS
BEGIN
    SELECT 
        r.candidate_id,
        c.full_name,
        r.effective_date,
        r.bill_rate,
        r.paye_rate,
        r.agency_paye_rate
    FROM RateHistory r
    JOIN Candidate c ON r.candidate_id = c.candidate_id
    WHERE FORMAT(r.effective_date, 'yyyy-MM') = @Month
    ORDER BY r.effective_date;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_GetMonthlyCandidateHires]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetMonthlyCandidateHires]
    @Month VARCHAR(7)  -- Format: 'YYYY-MM'
AS
BEGIN
    SELECT 
        w.candidate_id,
        c.full_name,
        w.wo_start_date,
        w.client_name,
        a.company_name AS Agency
    FROM Workorder w
    JOIN Candidate c ON w.candidate_id = c.candidate_id
    JOIN Agency a ON w.agency_id = a.agency_id
    WHERE FORMAT(w.wo_start_date, 'yyyy-MM') = @Month
    ORDER BY w.wo_start_date;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRateChangesByCandidate]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetRateChangesByCandidate]
    @CandidateId INT,
    @Month VARCHAR(7)
AS
BEGIN
    SELECT 
        r.Rate_id,
        r.effective_date,
        r.paye_rate,
        r.agency_paye_rate,
        r.margin_agency_rate,
        r.bill_rate
    FROM RateHistory r
    WHERE r.candidate_id = @CandidateId
      AND FORMAT(r.effective_date, 'yyyy-MM') = @Month
    ORDER BY r.effective_date;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetWorkordersByAgency]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetWorkordersByAgency]
    @AgencyId INT,
    @Month VARCHAR(7)
AS
BEGIN
    SELECT 
        w.work_order_id,
        w.candidate_id,
        c.full_name,
        w.wo_start_date,
        w.designation,
        w.client_name,
        w.status
    FROM Workorder w
    JOIN Candidate c ON w.candidate_id = c.candidate_id
    WHERE w.agency_id = @AgencyId
      AND FORMAT(w.wo_start_date, 'yyyy-MM') = @Month
    ORDER BY w.wo_start_date;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetWorkordersByStatus]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetWorkordersByStatus]
    @Status NVARCHAR(255),
    @FromDate DATE = NULL,
    @ToDate DATE = NULL
AS
BEGIN
    SELECT 
        w.work_order_id,
        c.full_name,
        w.status,
        w.wo_start_date,
        w.wo_end_date,
        w.client_name
    FROM Workorder w
    JOIN Candidate c ON w.candidate_id = c.candidate_id
    WHERE w.status = @Status
      AND (@FromDate IS NULL OR w.wo_start_date >= @FromDate)
      AND (@ToDate IS NULL OR w.wo_end_date <= @ToDate)
    ORDER BY w.wo_start_date;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertFullCandidateData]    Script Date: 9/28/2025 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertFullCandidateData]
    -- Candidate Info
    @candidate_id INT,
    @full_name NVARCHAR(255),
    @email NVARCHAR(255),
    @nationality NVARCHAR(255),
    @passport_number NVARCHAR(255),
    @passport_valid_end_date DATETIME,
    @driving_license_number NVARCHAR(255),
    @home_address NVARCHAR(255),
    @bank_name NVARCHAR(255),
    @sort_code NVARCHAR(255),
    @bank_address NVARCHAR(255),
    @contact_number BIGINT,
    @account_number BIGINT,

    -- Workorder Info
    @agency_id INT,
    @margin_agency_id INT = NULL,
    @Limited_Company_id INT = NULL,
    @account_team_id INT,
    @resume_link NVARCHAR(255),
    @client_name NVARCHAR(255),
    @client_location NVARCHAR(255),
    @work_order_type NVARCHAR(255),
    @candidate_work_location NVARCHAR(255),
    @inside_ir35 NVARCHAR(255),
    @designation NVARCHAR(255),
    @wo_start_date DATETIME,
    @wo_end_date DATETIME,
    @notice_period_unit NVARCHAR(255),
    @payment_terms_units NVARCHAR(255),
    @invoice_frequency NVARCHAR(255),
    @remarks NVARCHAR(255),
    @status NVARCHAR(255),
    @cin_sap_id BIGINT,
    @notice_period BIGINT,
    @payment_terms_days BIGINT,

    -- Rate Info
    @effective_date DATETIME,
    @agency_paye_rate BIGINT,
    @paye_rate BIGINT,
    @margin_agency_rate BIGINT,
    @idc_margin BIGINT,
    @bill_rate BIGINT,

    -- Account team data 
    @rm_name NVARCHAR(255),
    @rm_email NVARCHAR(255),
    @sm_name NVARCHAR(255),
    @sm_email NVARCHAR(255),
    @rec_name NVARCHAR(255),
    @rec_email NVARCHAR(255),
    @tl_name NVARCHAR(255),
    @tl_email NVARCHAR(255),
    @rm_code BIGINT,
    @sm_code BIGINT,
    @rec_code BIGINT,
    @tl_code BIGINT,

    -- Margin Agency Info
    @margin_name NVARCHAR(255) = NULL,
    @margin_spoc_name NVARCHAR(255) = NULL,
    @margin_email NVARCHAR(255) = NULL,
    @margin_address NVARCHAR(255) = NULL,
    @margin_agency_number NVARCHAR(255) = NULL,
    @margin_iban NVARCHAR(255) = NULL,
    @margin_vat_number BIGINT = NULL,

    -- Limited Company Info
    @limited_name NVARCHAR(255) = NULL,
    @limited_spoc_name NVARCHAR(255) = NULL,
    @limited_email NVARCHAR(255) = NULL,
    @limited_address NVARCHAR(255) = NULL,
    @limited_agency_number NVARCHAR(255) = NULL,
    @limited_iban NVARCHAR(255) = NULL,
    @limited_vat_number BIGINT = NULL,

    -- Agency Info
    @agency_name NVARCHAR(255),
    @agency_spoc_name NVARCHAR(255),
    @agency_email NVARCHAR(255),
    @agency_address NVARCHAR(255),
    @agency_number NVARCHAR(255),
    @agency_iban NVARCHAR(255),
    @agency_vat_number BIGINT,

    -- Document Info
    @document_type NVARCHAR(255),
    @document_number NVARCHAR(255),
    @valid_until DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Insert Candidate
        INSERT INTO dbo.Candidate (
            candidate_id,full_name, email, nationality, passport_number, passport_valid_end_date,
            driving_license_number, home_address, bank_name, sort_code, bank_address,
            contact_number, account_number
        )
        VALUES (
            @candidate_id,@full_name, @email, @nationality, @passport_number, @passport_valid_end_date,
            @driving_license_number, @home_address, @bank_name, @sort_code, @bank_address,
            @contact_number, @account_number
        );

        -- 2. Insert Margin Agency if applicable
        IF @work_order_type = 'Margin Agency'
        BEGIN
            INSERT INTO dbo.Margin (
                name, spoc_name, email, address, agency_number,
                bank_name, sort_code, iban, bank_address,
                contact_number, account_number, vat_number
            )
            VALUES (
                @margin_name, @margin_spoc_name, @margin_email, @margin_address, @margin_agency_number,
                @bank_name, @sort_code, @margin_iban, @bank_address,
                @contact_number, @account_number, @margin_vat_number
            );

            SET @margin_agency_id = SCOPE_IDENTITY();
        END

        -- 3. Insert Limited Company if applicable
        IF @work_order_type = 'Limited Company'
        BEGIN
            INSERT INTO dbo.Limited (
                name, spoc_name, email, address, agency_number,
                bank_name, sort_code, iban, bank_address,
                contact_number, account_number, vat_number
            )
            VALUES (
                @limited_name, @limited_spoc_name, @limited_email, @limited_address, @limited_agency_number,
                @bank_name, @sort_code, @limited_iban, @bank_address,
                @contact_number, @account_number, @limited_vat_number
            );

            SET @Limited_Company_id = SCOPE_IDENTITY();
        END

        -- 4. Insert Account Team (if not already exists – here assume it’s new)
        INSERT INTO dbo.Account (
            rm_name, rm_email, sm_name, sm_email,
            rec_name, rec_email, tl_name, tl_email,
            remarks, rm_code, sm_code, rec_code, tl_code
        )
        VALUES (
            @rm_name, @rm_email, @sm_name, @sm_email,
            @rec_name, @rec_email, @tl_name, @tl_email,
            @remarks, @rm_code, @sm_code, @rec_code, @tl_code
        );

        SET @account_team_id = SCOPE_IDENTITY();

        -- 5. Insert Workorder
        INSERT INTO dbo.Workorder (
            candidate_id, account_team_id, agency_id,
            margin_agency_id, Limited_Company_id,
            resume_link, client_name, client_location,
            work_order_type, candidate_work_location,
            inside_ir35, designation, wo_start_date, wo_end_date,
            notice_period_unit, payment_terms_units, invoice_frequency,
            remarks, status, cin_sap_id, notice_period, payment_terms_days
        )
        VALUES (
            @candidate_id, @account_team_id, @agency_id,
            @margin_agency_id, @Limited_Company_id,
            @resume_link, @client_name, @client_location,
            @work_order_type, @candidate_work_location,
            @inside_ir35, @designation, @wo_start_date, @wo_end_date,
            @notice_period_unit, @payment_terms_units, @invoice_frequency,
            @remarks, @status, @cin_sap_id, @notice_period, @payment_terms_days
        );

        -- 6. Insert Rate History
        INSERT INTO dbo.RateHistory (
            candidate_id, effective_date,
            agency_paye_rate, paye_rate,
            margin_agency_rate, idc_margin, bill_rate
        )
        VALUES (
            @candidate_id, @effective_date,
            @agency_paye_rate, @paye_rate,
            @margin_agency_rate, @idc_margin, @bill_rate
        );

        -- 7. Insert Document
        INSERT INTO dbo.Document (
            candidate_id, document_type, document_number, valid_until
        )
        VALUES (
            @candidate_id, @document_type, @document_number, @valid_until
        );

        COMMIT TRANSACTION;
        PRINT 'Candidate and all related data inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [vendor_database] SET  READ_WRITE 
GO
