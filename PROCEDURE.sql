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

