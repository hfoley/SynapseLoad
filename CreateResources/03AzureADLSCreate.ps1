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