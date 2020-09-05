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

<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables
You will get prompted at first to login with your account to Azure.  
You will get a second prompt that will create your SQL Admin account/password. 
IMPORTANT - use all lowercase on $azsqlserver logical server name due to potential bug (4/7/20) #>
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


<# Update the variables section appropriately for your environment.  
Update any reference to ***Change This*** in the variables #>
$startTime = Get-Date
$SubscriptionName = "***Change This***" 
$SubscriptionId = '***Change This***'
$resourceGroupName = "***Change This***"
$resourceGroupLocation = "***Change This***" 
$azstoragename = "***Change This***"
$containername = "***Change This***" 
$SKUName = "Standard_GRS"
$storagekind = "StorageV2"


Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

Write-Host "The Azure ADLS Gen 2 Storage creation script was started " $startTime

$ADLSCheck = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $azstoragename -ErrorAction SilentlyContinue
if(-not $ADLSCheck)
    {
    Write-Host "The ADLS storage '$azstoragename' doesn't exist and will be created"
    New-AzStorageAccount -ResourceGroupName $resourceGroupName -AccountName $azstoragename -Location $resourceGroupLocation -SkuName $SKUName -Kind $storagekind  -EnableHierarchicalNamespace $true
     $ctx = New-AzStorageContext -StorageAccountName $azstoragename -UseConnectedAccount
        $ContCheck = Get-AzStorageContainer -Name $containername -Context $ctx -ErrorAction SilentlyContinue
        if(-not $ContCheck)
            {
            Write-Host "The ADLS storage container '$containername' doesn't exist and will be created"
            New-AzStorageContainer -Name $containername -Context $ctx
            }
            else
            {
            Write-Host "The ADLS storage container '$containername' already there"
            }
    }
else 
    {
    Write-Host "The ADLS storage '$azstoragename' already created"
        $ctx = New-AzStorageContext -StorageAccountName $azstoragename -UseConnectedAccount
        $ContCheck = Get-AzStorageContainer -Name $containername -Context $ctx -ErrorAction SilentlyContinue
        if(-not $ContCheck)
            {
            Write-Host "The ADLS storage container '$containername' doesn't exist and will be created"
            New-AzStorageContainer -Name $containername -Context $ctx
            }
            else
            {
            Write-Host "The ADLS storage container '$containername' already there"
            }
    }
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
