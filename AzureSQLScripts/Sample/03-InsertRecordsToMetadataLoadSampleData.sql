/*Insert data into [ADF].[MetadataLoad] table 
	[FileName] << File to load into Synapse and needs to match the parameter you pass to ADF pipeline 
   ,[BlobContainer] << ADLS container where parquet file to load exists
   ,[TargetTableSchema] << schema for target and staging tables 
   ,[StagingTable] << used for incremental load pipelines in Synapse
   ,[TargetTable] << final destination table loaded into Synapse
   ,[ColumnKey] << column used to match the loading from Staging to Target

		   ***REPLACE VALUES BASED ON YOUR ENVIRONMENT ***
*/ 

INSERT INTO [ADF].[MetadataLoad]
           ([FileName]
           ,[BlobContainer]
           ,[TargetTableSchema]
           ,[StagingTable]
           ,[TargetTable]
           ,[ColumnKey])
     VALUES
           ('ParquetStudent'
           ,'hopemadecont'
		   ,'ADF'
           ,'Student_Stg'
           ,'Student'
		   ,'CRMID')
GO



