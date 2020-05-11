# Synapse Load Solution - SQL Scripts 
The scripts in this folder are used to populate and build the components in the Azure SQL Database that we'll use to pass information to Azure data factory pipelines.  I also have loaded components if you'd like to follow along using sample dataset, you can use the items contained in the Sample subdirectory.  
	

## Script List 
	1. 01-CreateADFSchema.sql - Script to create an "ADF" schema for the ADF metadata table 
	2. 02-CreateMetadataLoadTable.sql - Script to create the metadata table 
	3. 03-InsertRecordsToMetadataLoad.sql - script to insert records in metadata table 

