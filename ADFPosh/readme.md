 # Synapse Load Solution - Azure Data Factory
The components in this folder are to create the items in Azure Data Factory (ADF).  There are a combination of PowerShell scripts and json files needed to create all the things needed in ADF.  You will need to make some updates to all the PowerShell scripts and only the json files for linked services need updated.  Anything that needs updated in either the PowerShell script or corresponding json file will have the text string `"***Change This***"`.  You can do a find/replace on all files for that specific text to make it easier to find.  All files that need updated are in bold below.  
	

## File List 
1. **01ADF-CreateIR.ps1** - Script to create a self hosted IR in ADF.  You only need this piece if you'll be getting data from on prem
2. **02ADF-SetIR.ps1** - Script to configure the self hosted IR after it's installed on machine close to data sources on prem 
3. **03ADF-AzureSQLDBLinkedServerCreate.ps1** - Script to create the linked servers in ADF 
4. **04ADF-DatasetCreate.ps1** - Script to create the datasets in ADF 
5. **05ADF-PipelineCreate.ps1** - Scripts to create the pipelines in ADF 
6. **ADLSGen2LinkedService.json** - Json file tied to the creation of the linked server pointing to ADLS Gen 2 in ADF.  You will need to update the url property to point to the Azure Data Lake Storage.  **Use the data lake storage endpoint** You get to this in the Azure Portal for storage account and choose Properties on left pane.  Copy the url for data lake storage.  It will look like https://<name you mae>.dfs.core.windows.net/.  
7. **AzureSQLDBLinkedService.json** - Json file tied to the creation of the linked server pointing to SQL DB in ADF
8. **SynapseLinkedService.json** - Json file tied to the creation of the linked server pointing to Synapse in ADF
9. DatasetSinkSynapse.json - Json file tied to the creation of the sink dataset in ADF pointing to Synapse destination
10. DatasetSQLMetadataLoad.json - Json file tied to the creation of dataset in ADF pointing to Azure SQL metadata table 
11. DatasetSrcADLSFileLoad.json - Json file tied to the creation of the source dataset in ADF pointing to ADLS Gen 2 parquet files
12. IncrementalPipelineCreate.json - Json file tied to the creation of the incremental pipeline in ADF 
13. Truncate Load Synapse.json - Json file tied to the creation of the truncate/reload pipeline in ADF 
	
## Steps
1. Copy the files to a directory locally. 
2. Update the PowerShell scripts in bold above for your environment.  PowerShell scripts will have variables at the top of the script. 
3. Update the json files above with details for your environment.  Specifics to each file are below
	1. ADLSGen2LinkedService.json - You will need to update the URL path.  You can get this in the Azure Portal in the Properties pane.  Use the Data Lake Storage endpoint.  It will looks something like `https://<storage account name>.dfs.core.windows.net.`  
	2. AzureSQLDBLinkedService.json - You will need to change the connection string portion in this file.  You can get the servername in the Azure Portal Overview section.  There are 3 changes needed.  You need to change the logical servername, the Synapse database name, and the SQL Authenticated user to connect.  The details of the change are `data source=<logical servername>.database.windows.net;initial catalog=<metadata sql db name>;user id=<user account>"`
	3. SynapseLinkedService.json - You will need to change the connection string portion.  There are 3 changes needed.  You need to change the logical servername, the Synapse database name, and the SQL Authenticated user to connect.  The details of the change are `data source=<logical servername>.database.windows.net;initial catalog=<synapse db name>;user id=<user account>"`
4. If you need to create a self hosted IR - you can use the scripts 01ADF-CreateIR.ps1 and 02ADF-SetIR.ps1 to create them.  Or you can do this in the portal and is documented here https://docs.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime
5. If self hosted IR is not needed start with script 03ADF-AzureSQLDBLinkedServerCreate.ps1.  Run this script and validate in ADF the linked services are created.  You view those by clicking on Connections (botton left in authoring area in ADF).  
6. You'll need to update each of the linked services for each one with credential password and the storage account key.  You can also use Azure Key Vault instead.  After you've updated each linked service, test the connection of each one and save the changes.  
7. Run 04ADF-DatasetCreate.ps1 and validate there are 3 datasets created in ADF after running. 
8. Run 05ADF-PipelineCreate.ps1 and validate there are 2 pipelines created in ADF after running. 
