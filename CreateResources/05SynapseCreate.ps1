<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables
You will get prompted at first to login with your account to Azure.  
You will get a second prompt that will create your SQL Admin account/password 
IMPORTANT - use all lowercase for now on SQL Server logical name 4/6/20 #>
$startTime = Get-Date
$SubscriptionName = "***Change This***" 
$SubscriptionId = '***Change This***'
$resourceGroupName = "***Change This***"
$resourceGroupLocation = "***Change This***" 
$azsqlserver = "***Change This***"
$azsynapsename = "***Change This***"
$edition = "***Change This***"
$synapselvl = "***Change This***" 


Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Write-Host "The Azure Synapse Server and DB creation script was started " $startTime

$SQLServerCheck = Get-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $azsqlserver -ErrorAction SilentlyContinue
if(-not $SQLServerCheck)
    {
    Write-Host "SQL Server '$azsqlserver' doesn't exist and will be created"
    New-AzSqlServer -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -ServerName $azsqlserver -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)
    }
else 
    {Write-Host "SQL Server '$azsqlserver' already created"}


$SQLSynapseCheck = Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $azsqlserver -DatabaseName $azsynapsename -ErrorAction SilentlyContinue
if(-not $SQLSynapseCheck)
    {
    Write-Host "Synapse DB '$azsynapsename' doesn't exist and will be created"
    New-AzSqlDatabase -ResourceGroupName $resourceGroupName  -ServerName $azsqlserver -DatabaseName $azsynapsename -Edition $edition -RequestedServiceObjectiveName $synapselvl  
    }
else 
    {Write-Host "Synapse DB '$azsynapsename' already created"}

$endTime = Get-Date
write-host "Ended Azure Synapse Server and DB creation script was started " $endTime
