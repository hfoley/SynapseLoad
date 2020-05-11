# Synapse Load Solution 
We were trying to tackle getting a large copy of SQL Server databases into Azure in a PaaS solution for analytics.  The first piece is to copy data from on-premises large SQL Servers to Azure Data Lake Gen 2.  We use Azure Data Factory for the data extracts and the loads.  We build reusable metadata driven pipelines utilzing data stored in a small Azure SQL Database.  
	
The data in parquet files will then be loaded into a Synapse Analytics solution diagrammed below.  

![alt text](https://github.com/hfoley/EDU/blob/master/images/SynapseLoadArchitecture.png?raw=true)

## Asset List 
	1. Azure Resource Group
	2. Azure SQL Database - metadata table location 
	3. Azure Data Lake Gen 2 - location to land extracted parquet files 
	4. Azure Data Factory - pipelines to extract data 
	5. Azure Synapse - destination to load parquet extracted files 
	
* [ADFPosh](https://github.com/hfoley/SynapseLoad/tree/master/ADFPosh)  - contains PowerShell scripts to build the ADF coponents and pipelines 
* [AzureSQLScripts](https://github.com/hfoley/SynapseLoad/tree/master/AzureSQLScripts)   - contains SQL Scripts to create and load the Azure SQL metadata table.  Also contains some sample scripts and scripts to monitor the load process.  
* [CreateResources](https://github.com/hfoley/SynapseLoad/tree/master/CreateResources)   - contains PowerShell scripts to build all the Azure components in the solution. 
 

## Steps
1. Create all assets.  If you'd like to create the Azure components you can use scripts in CreateResources.   Open each file and edit the variables section at the top.  You can do a search/replace for the text string `"***Change This***"`.  Run them individually starting at 01ResourceGroupCreate.ps1 and run them in order by naming. 
2. Connect to Azure SQL DB and run scripts 01  - 03 .  These scripts will create ADF.MetadataLoad schema, table, and an insert script to load the table that will drive the pipelines.  More details in AzureSQLScripts readme and in the comments of the scripts to run. 
3. Connect to Azure Synapse (make sure running) and run scripts to create your target tables (staging and final destination).  If you're using the sample use scripts in sample location.   
4. Run the scripts for creating the Data Factory components contained in ADFPosh directory.  


		

	
	

