#json list of blobs
/*

[
	{
		"name": "container1",
		"type": "Folder"
	},
	{
		"name": "container2",
		"type": "Folder"
	},
	{
		"name": "container3",
		"type": "Folder"
	}
]

*/
$blobs_list = Get-Content "BlobsList.json" | ConvertFrom-Json

#connect to azure
Connect-AzAccount

#set current context
Set-AzContext -Subscription "xxxx-xxxx-xxxx-xxxx-xxxx"

#crete st account context
$st_context = New-AzStorageContext -StorageAccountName "staccountname"

#remove
foreach($nm in $blobs_list.name)
{
    Remove-AzStorageContainer -Name $nm -Context $st_context -Force
    Write-Host "removed $($nm)"
}

