<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$ScriptLoc = '***Change This***'
$DataFactoryName = "***Change This***" 
$LinkedServiceName1 = "AzureSQLDBLnkSvr"
$LinkedServiceFile1 = ".\AzureSQLDBLinkedService.json"
$LinkedServiceName2 = "ADLSGen2LnkSvr"
$LinkedServiceFile2 = ".\ADLSGen2LinkedService.json"
$LinkedServiceName3 = "SynapseLnkSvr"
$LinkedServiceFile3 = ".\SynapseLinkedService.json"

Set-Location $ScriptLoc

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Set-AzDataFactoryV2LinkedService -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $LinkedServiceName1 `
    -DefinitionFile $LinkedServiceFile1

Set-AzDataFactoryV2LinkedService -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $LinkedServiceName2 `
    -DefinitionFile $LinkedServiceFile2

Set-AzDataFactoryV2LinkedService -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $LinkedServiceName3 `
    -DefinitionFile $LinkedServiceFile3
