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
1. Create all assets.  If you'd like to create the Azure components you can use scripts in CreateResources.   Open each file and edit the variables section at the top.  You can do a search/replace for the text string '***Change This***'.  Run them individually starting at 01ResourceGroupCreate.ps1 and run them in order by naming. 
2. Create target tables and if incremental loads the staging table 
3. Connect to Azure SQL DB and run scripts in order.  These scripts will create ADF.MetadataLoad schema, table, and an insert script to load the table that will drive the pipelines 
4. Update json files for your environment 
	a. ADLSGen2LinkedService.json - url to ADLS  data lake endpoint <https://yourstorageaccount.dfs.core.windows.net>
	b. AzureSQLDBLinkedService.json - connection string to your Azure SQL Database for metadata <"integrated security=False;encrypt=True;connection timeout=30;data source=yoursqldb.database.windows.net;initial catalog=yourdbname;user id=youraccount"> 
	c. SynapseLinkedService.json - connection string to your Synapse destination <integrated security=False;encrypt=True;connection timeout=30;data source=yoursynapse.database.windows.net;initial catalog=yourSynapsedbname;user id=youruserid>
		
5. Create self hosted IR - run PoSH 01ADF-CreateIR.ps1 *change variables
6. Get a key from running script 02ADF-SetIR.ps1
7. Login to VM Install bits on machine - https://www.microsoft.com/en-us/download/details.aspx?id=39717
8. Will ask for key after the install is complete
9. Run script to create linked services 
10. Update passwords/keys for all 3 linked services created in ADF in portal 
	
	
	

