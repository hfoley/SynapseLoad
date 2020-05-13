# Synapse Load Solution - Create Azure Resources
The scripts in this folder are used to build the components used in the architecture.  Each script builds only one component so you can pick and choose what is needed for your environment.    
	

## Script List 
1. 01ResourceGroupCreate.ps1 - Script to create a resource group in your Azure subscription.  
2. 02AzureSQLDBCreate.ps1 - Script to create the Azure SQL Database to store the metadata table
3. 03AzureADLSCreate.ps1 - Script to create the Azure Data Lake Storage (gen 2) to store the parquet files for loading
4. 04ADF-CreateADF.ps1 - Script to create the Azure Data Factory 
5. 05SynapseCreate.ps1 - Script to create the Azure Synapse SQL pool (formerly Azure SQL Data Warehouse)

## Variable List 
Each PowerShell script will contain a variable section at the top.  Below is a list of variables used for the PowerShell scripts in this directory and some info on each one.  Any PowerShell variable and/or json file that needs edited with your information will have the text `***Change This***`.  This will allow you to do a text search/replace for this to edit with your details.  

| Variable        | Explanation |          
| ------------- |-------------| 
| $SubscriptionName     | holder | 
| $SubscriptionId      | holder    |  
| $resourceGroupName | holder      |
| $resourceGroupLocation | holder |
