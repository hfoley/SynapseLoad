<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #>
$startTime = Get-Date
$SubscriptionName = "***Change This***" 
$SubscriptionId = '***Change This***'
$resourceGroupName = "***Change This***"
$resourceGroupLocation = "***Change This***" 
$azadfname = "***Change This***"
$endTime = Get-Date

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Write-Host "The Azure Data Factory creation script was started " $startTime

$ADFCheck = Get-AzDataFactoryV2 -ResourceGroupName $resourceGroupName -Name $azadfname -ErrorAction SilentlyContinue
if(-not $ADFCheck)
    {
    Write-Host "The Azure Data Factory '$azadfname' doesn't exist and will be created"
    New-AzDataFactoryV2 -ResourceGroupName $resourceGroupName -Name $azadfname –Location $resourceGroupLocation
    }
else 
    {
   Write-Host "The Azure Data Factory '$azadfname' already there"
    }

write-host "Ended Azure Data Factory creation at " $endTime