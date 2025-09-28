🧠 Architecture & Design
1. What business problem were you solving with this architecture?
Answer: I replaced manual Excel-based billing and tracking with a scalable SQL system to improve billing accuracy, automate vendor payouts, and enable audit-ready reporting across recruitment operations.


2. Why did you normalize the schema?
Answer: To eliminate redundancy, enforce referential integrity, and ensure scalability. Each entity—Candidate, Agency, Workorder, RateHistory—has its own table, linked via foreign keys.


3. How did you handle rate changes over time?
Answer: I created a RateHistory table with effective_date and linked it to candidates. This allows tracking rate volatility and supports monthly billing summaries.


4. What indexing strategy did you use?
Answer: I applied non-clustered indexes on foreign keys and date fields like candidate_id, agency_id, wo_start_date, and status to optimize joins and filters.

📊 Reporting & Views

5. How do you generate monthly billing reports?
Answer: Using the sp_GetBillingSummary procedure, which joins RateHistory and Candidate filtered by month. It outputs bill rate, paye rate, and agency rate for finance exports.


6. How do you track active placements?
Answer: Through the vw_ActiveWorkorders view, which filters workorders by status = 'Active' or wo_end_date >= GETDATE().


7. How do you measure agency performance?
Answer: The vw_AgencyPerformance view aggregates total candidates, workorders, average bill rate, and total billing per agency.

🔄 Workflow Automation

8. How do you onboard a new candidate with all related data?
Answer: I use the usp_InsertFullCandidateData procedure, which inserts candidate, agency, margin, limited company, workorder, rate, and document data in a single transaction.


9. How do you update candidate or agency details?
Answer: Using UPDATE statements on respective tables (Candidate, Agency) with filters on candidate_id or agency_id.


10. How do you verify pending billing from last month?
Answer: I compare vw_MonthlyBillingSummary for the previous month with actual payments received. Discrepancies are flagged for follow-up.

🧩 Strategic & Business Questions

11. What was the impact of moving from Excel to SQL?
Answer: It reduced manual effort by 80%, improved billing accuracy, enabled real-time reporting, and supported compliance across 100+ placements.


12. How does this architecture support audit and compliance?
Answer: All entities are relationally linked, documents are tracked via Document table, and views provide historical snapshots for audit trails.


13. How would you scale this for multiple geographies or clients?
Answer: By adding client and region dimensions, partitioning large tables, and parameterizing stored procedures for multi-client logic.

