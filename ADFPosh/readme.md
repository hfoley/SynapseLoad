 # Synapse Load Solution - Azure Data Factory
The components in this folder are to create the items in Azure Data Factory (ADF).  There are a combination of PowerShell scripts and json files needed to create all the things needed in ADF.  You will need to make some updates to all the files.  
	

## File List 
	1. 01ADF-CreateIR.ps1 - Script to create a self hosted IR in ADF.  You only need this piece if you'll be getting data from on prem
	2. 02ADF-SetIR.ps1 - Script to configure the self hosted IR after it's installed on machine close to data sources on prem 
	3. 03ADF-AzureSQLDBLinkedServerCreate.ps1 - script to create the linked servers in ADF 
	4. 04ADF-DatasetCreate.ps1
	5. 05ADF-PipelineCreate.ps1
	6. ADLSGen2LinkedService.json
	7. AzureSQLDBLinkedService.json
	8. DatasetSinkSynapse.json
	9. DatasetSQLMetadataLoad.json
	10. DatasetSrcADLSFileLoad.json
	11. IncrementalPipelineCreate.json
	12. SynapseLinkedService.json
	13. Truncate Load Synapse.json

