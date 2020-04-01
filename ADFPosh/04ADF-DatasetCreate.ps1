<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$ScriptLoc = '***Change This***'
$DataFactoryName = "***Change This***" 
$DatasetName1 = "LookupMetadataLoad"
$DatasetFile1 = ".\DatasetSQLMetadataLoad.json"
$DatasetName2 = "SrcADLSFileLoad"
$DatasetFile2 = ".\DatasetSrcADLSFileLoad.json"
$DatasetName3 = "SinkSynapseTable"
$DatasetFile3 = ".\DatasetSinkSynapse.json"

Set-Location $ScriptLoc

Connect-AzAccount

Select-AzSubscription -SubscriptionName $SubscriptionName
Set-AzDataFactoryV2Dataset -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $DatasetName1 `
    -DefinitionFile $DatasetFile1

Select-AzSubscription -SubscriptionName $SubscriptionName
Set-AzDataFactoryV2Dataset -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $DatasetName2 `
    -DefinitionFile $DatasetFile2

Select-AzSubscription -SubscriptionName $SubscriptionName
Set-AzDataFactoryV2Dataset -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName -Name $DatasetName3 `
    -DefinitionFile $DatasetFile3
