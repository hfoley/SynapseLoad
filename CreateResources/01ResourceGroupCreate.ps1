<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #>
$startTime = Get-Date
$SubscriptionName = "***Change This***" 
$SubscriptionId = '***Change This***'
$resourceGroupName = "***Change This***"
$resourceGroupLocation = "***Change This***" 

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Write-Host "The resource group creation script was started " $startTime

$RGCheck = Get-AzResourceGroup -Name  $resourceGroupName -ErrorAction SilentlyContinue
if(-not $RGCheck)
    {
    Write-Host "Resource group '$resourceGroupName' doesn't exist and will be created"
    New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
    }
else 
    {Write-Host "Resource group '$resourceGroupName' already created"}

$endTime = Get-Date
write-host "Ended resource group creation at " $endTime

