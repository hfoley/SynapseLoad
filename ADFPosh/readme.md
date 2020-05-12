 # Synapse Load Solution - Azure Data Factory
The components in this folder are to create the items in Azure Data Factory (ADF).  There are a combination of PowerShell scripts and json files needed to create all the things needed in ADF.  You will need to make some updates to all the PowerShell scripts and only some of the json files.  Anything that needs updated in either the PowerShell script or corresponding json file will have the text string `"***Change This***"`.  You can do a find/replace on all files for that specific text to make it easier to find.  
	

## File List 
	1. 01ADF-CreateIR.ps1 - Script to create a self hosted IR in ADF.  You only need this piece if you'll be getting data from on prem
	2. 02ADF-SetIR.ps1 - Script to configure the self hosted IR after it's installed on machine close to data sources on prem 
	3. 03ADF-AzureSQLDBLinkedServerCreate.ps1 - Script to create the linked servers in ADF 
	4. 04ADF-DatasetCreate.ps1 - Script to create the datasets in ADF 
	5. 05ADF-PipelineCreate.ps1 - Scripts to create the pipelines in ADF 
	6. ADLSGen2LinkedService.json - Json file tied to the creation of the linked server pointing to ADLS Gen 2 in ADF
	7. AzureSQLDBLinkedService.json - Json file tied to the creation of the linked server pointing to SQL DB in ADF
	8. SynapseLinkedService.json - Json file tied to the creation of the linked server pointing to Synapse in ADF
	9. DatasetSinkSynapse.json - Json file tied to the creation of the sink dataset in ADF pointing to Synapse destination
	10. DatasetSQLMetadataLoad.json - Json file tied to the creation of dataset in ADF pointing to Azure SQL metadata table 
	11. DatasetSrcADLSFileLoad.json - Json file tied to the creation of the source dataset in ADF pointing to ADLS Gen 2 parquet files
	12. IncrementalPipelineCreate.json - Json file tied to the creation of the incremental pipeline in ADF 
	13. Truncate Load Synapse.json - Json file tied to the creation of the truncate/reload pipeline in ADF 

