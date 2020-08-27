<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #>

$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$DataFactoryName = "***Change This***" 
$SharedIntegrationRuntimeName = "***Change This***" 
$SharedIntegrationRuntimeDescription = "Self Hosted IR to ***Change This***"


Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

$SharedIR = Set-AzDataFactoryV2IntegrationRuntime `
    -ResourceGroupName $ResourceGroupName `
    -DataFactoryName $DataFactoryName `
    -Name $SharedIntegrationRuntimeName `
    -Type SelfHosted `
    -Description $SharedIntegrationRuntimeDescription
<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$DataFactoryName = "***Change This***" 
$SharedIntegrationRuntimeName = "***Change This***" 
$SharedIntegrationRuntimeDescription = "Self Hosted IR to ***Change This***"

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Get-AzDataFactoryV2IntegrationRuntimeKey `
    -ResourceGroupName $ResourceGroupName `
    -DataFactoryName $DataFactoryName `
    -Name $SharedIntegrationRuntimeName
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
<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$ScriptLoc = "***Change This***"
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
<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$ScriptLoc = "***Change This***"
$DataFactoryName = "***Change This***" 
$PipelineName1 = "Synapse Incremental Load"
$PipelineFile1 = ".\IncrementalPipelineCreate.json"
$PipelineName2 = "Synapse Truncate Load"
$PipelineFile2 = ".\Truncate Load Synapse.json"


Set-Location $ScriptLoc

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

$Pipeline1 = Set-AzDataFactoryV2Pipeline `
    -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName `
    -Name $PipelineName1 `
    -DefinitionFile $PipelineFile1

$Pipeline2 = Set-AzDataFactoryV2Pipeline `
    -DataFactoryName $DataFactoryName `
    -ResourceGroupName $ResourceGroupName `
    -Name $PipelineName2 `
    -DefinitionFile $PipelineFile2
