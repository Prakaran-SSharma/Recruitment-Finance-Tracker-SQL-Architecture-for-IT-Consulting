# Recruitment-Finance-Tracker-SQL-Architecture-for-IT-Consulting


🔍 Overview
This project showcases a complete SQL-based data architecture designed for an IT consulting recruitment firm. It replaces legacy Excel workflows with a scalable, auditable, and automation-ready system for managing candidate placements, vendor billing, and financial reporting.
Built from scratch using SQL Server Management Studio (SSMS), the solution includes normalized tables, indexed relationships, analytical views, and stored procedures that power recruitment operations across Finance, Vendor Management, and Delivery teams.

🧠 Key Features
- Normalized Schema: Candidate, Agency, Limited Company, Margin, Workorder, Rate History, Account Team, and Document tables with referential integrity.
- Analytical Views:
- vw_ActiveWorkorders: Live tracker for billing and payout
- vw_MonthlyBillingSummary: Finance snapshot by month
- vw_AgencyPerformance: Vendor scorecard with billing totals
- vw_CandidateWorkSummary: Lifecycle and rate history
- Stored Procedures:
- sp_GetBillingSummary: Monthly billing export
- sp_GetMonthlyCandidateHires: Hiring velocity by agency
- usp_InsertFullCandidateData: End-to-end onboarding engine
- Dimensional Modeling: Includes Dim_Date for time intelligence and Power BI integration.

💼 Business Impact
- Migrated manual Excel-based billing into a fully relational SQL system
- Enabled Finance team with export-ready billing reports and margin breakdowns
- Improved vendor transparency and SLA tracking across 100+ placements
- Reduced manual reporting effort by 80% through reusable views and procedures

🛠️ Tech Stack
- SQL Server Management Studio (SSMS)
- T-SQL (DDL, DML, Views, Stored Procedures)
- Power BI (optional integration)


