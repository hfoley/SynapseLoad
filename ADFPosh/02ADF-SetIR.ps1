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