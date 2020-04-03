<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables
You will get prompted at first to login with your account to Azure.  
You will get a second prompt that will create your SQL Admin account/password #>
$startTime = Get-Date
$SubscriptionName = "***Change This***" 
$SubscriptionId = '***Change This***'
$resourceGroupName = "***Change This***"
$resourceGroupLocation = "***Change This***" 
$azsqlserver = "***Change This***"
$azsqlDB = "***Change This***"
$edition = "***Change This***"
$ComputeModel = "***Change This***" 
$ComputeGen = "***Change This***"
$mincore = "***Change This***"
$maxcore = "***Change This***"
$pausemin = "***Change This***"

Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Write-Host "The Azure SQL Server and DB creation script was started " $startTime

$SQLServerCheck = Get-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $azsqlserver -ErrorAction SilentlyContinue
if(-not $SQLServerCheck)
    {
    Write-Host "SQL Server '$azsqlserver' doesn't exist and will be created"
    New-AzSqlServer -ResourceGroupName $resourceGroupName -Location $resourceGroupLocation -ServerName $azsqlserver -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)
    }
else 
    {Write-Host "SQL Server '$azsqlserver' already created"}


$SQLDBCheck = Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $azsqlserver -DatabaseName $azsqlDB -ErrorAction SilentlyContinue
if(-not $SQLDBCheck)
    {
    Write-Host "SQL DB '$azsqlDB' doesn't exist and will be created"
    New-AzSqlDatabase -ResourceGroupName $resourceGroupName  -ServerName $azsqlserver -DatabaseName $azsqlDB -ComputeModel $ComputeModel -Edition $edition -ComputeGeneration $ComputeGen `
    -MinVcore $mincore -MaxVcore $maxcore -AutoPauseDelayInMinutes $pausemin

    }
else 
    {Write-Host "SQL DB '$azsqlDB' already created"}

$endTime = Get-Date
write-host "Ended SQL Server and DB creation at " $endTime


