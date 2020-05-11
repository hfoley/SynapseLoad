SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ADF].[MetadataLoad](
	[FileName] [varchar](100) NULL,
	[BlobContainer] [varchar](100) NULL,
	[TargetTableSchema] [varchar](10) NULL,
	[StagingTable] [varchar](100) NULL,
	[TargetTable] [varchar](100) NULL,
	[ColumnKey] [varchar](100) NULL
) ON [PRIMARY]
GO


