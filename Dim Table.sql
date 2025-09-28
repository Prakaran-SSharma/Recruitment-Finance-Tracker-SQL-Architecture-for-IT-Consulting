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
