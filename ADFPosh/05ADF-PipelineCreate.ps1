<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #> 
$SubscriptionName = "***Change This***" 
$ResourceGroupName = "***Change This***" 
$DataFactoryLocation = "***Change This***" 
$ScriptLoc = '***Change This***'
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
