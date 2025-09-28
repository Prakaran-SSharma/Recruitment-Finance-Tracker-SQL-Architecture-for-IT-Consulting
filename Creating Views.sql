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
