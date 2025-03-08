# Inputs from user
# ***TemplateItem - List to select Template
# ***ParentItem - List to select data source item folder
# ***Apiitem - List to select API
$dialogParameters = @(
    @{ Name = "TemplateItem"; Title = "Select Template"; Source = "/sitecore/templates/Project/DataSourceTemplates"; Editor = "droplist";Mandatory = $true},
    @{ Name = "ParentItem"; Title = "Select Data Source"; Source = "/sitecore/content/Home/Data"; Editor = "droplist"; Mandatory = $true },
	@{ Name = "Apiitem"; Title = "Select Api"; Source = "/sitecore/content/Home/APIs"; Editor = "droplist"; Mandatory = $true }
)
# Model dialog configuration
$dialog = Read-Variable -Parameters $dialogParameters `
    -Description "This module is used to Sync data from an API to Sitecore items." `
    -Width 400 -Height 200 `
    -Title "Sitecore API Data Sync" `
    -OkButtonName "Sync Data" `
    -CancelButtonName "Cancel"
	
# Define the paths from User Input
$parentPath = $ParentItem.Paths.FullPath
$templatePath = $TemplateItem.Paths.FullPath
$apidetailsPath=$($Apiitem.Paths.FullPath)

# Get the API URL to fetch data
$apiitem = Get-Item -Path $apidetailsPath
$apiUrl=$($apiitem["url"])

# Fetch data from the API
try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get
    if ($response) {
        Write-Host "Data retrieved successfully!"
        
        # Process and display each record
        foreach ($item in $response) {
            # Ensure eventname is not empty to avoid creating invalid items
            if ($item.eventname) {
                try {
                    # Create a new item under the specified parent data spurce folder
                    $newItem = New-Item -Path $parentPath -Name $($item.eventname) -ItemType $templatePath -Force
                    
                    # Begin editing the new item
                    $newItem.Editing.BeginEdit()
                    try {
                        # Set field values from the API response
                        $newItem["eventname"] = $item.eventname
                        $newItem["year"] = $item.year
                        $newItem["link"] = $item.link
                        $newItem["coordinator"] = $item.coordinator
                        $newItem["email"] = $item.email
                        # End the editing session
                        $newItem.Editing.EndEdit()
                        Write-Host "Item created successfully: $($item.eventname)"
                    } catch {
                        # Cancel the editing if there is an error updating the item
                        $newItem.Editing.CancelEdit()
                        Write-Host "Error updating item: $($item.eventname)"
                    }
                } catch {
                    Write-Host "Error creating item for: $($item.eventname)"
                }
            } else {
                Write-Host "Skipping item with missing 'eventname'"
            }
        }
    } else {
        Write-Host "No data found from the API."
    }
} catch {
    Write-Host "Error retrieving data from API: $_"
}
