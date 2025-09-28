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
