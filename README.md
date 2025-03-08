![Hackathon Logo](docs/images/hackathon.png?raw=true "Hackathon Logo")
# Sitecore Hackathon 2025

- MUST READ: **[Submission requirements](SUBMISSION_REQUIREMENTS.md)**
- [Entry form template](ENTRYFORM.md)
  
### ⟹ [Insert your documentation here](ENTRYFORM.md) <<

# Hackathon Submission Entry form

## Team name
⟹ team-codesheroes

## Category
⟹ Integration

## Description
⟹ Write a clear description of your hackathon entry.  

  - Module Purpose - Automate the Manual data insertion from API(JSON) to Sitecore Item using PowerShell Script
  - Automates API JSON data conversion into multiple Sitecore datasources from a template, reducing manual effort and ensuring consistency. Ideal for dynamic content like product catalogs or event listings.

_You can alternately paste a [link here](#docs) to a document within this repo containing the description._

## Video link
⟹ Provide a video highlighing your Hackathon module submission and provide a link to the video. You can use any video hosting, file share or even upload the video to this repository. _Just remember to update the link below_

⟹ [Replace this Video link](#video-link)

## Pre-requisites and Dependencies

⟹ Running Sitecore 10.4 Instance
⟹ Sitecore.PowerShell.Extensions/ PowerShell ISE to run PowerShell script

## Installation instructions
⟹ instruction on how to install module.  

1. Use the Sitecore Installation wizard to install the [package](#https://github.com/Sitecore-Hackathon/2025-CodeSheroes/tree/main/Sitecore%20Packages)
Please install
- Template Packages
- Demo Content Packages
- API Data Sync PowerShell Packages
2. Open PowerShell ISE --> Settings --> Rebuild --> Sync Library with Content Editor Ribbon
![Sync Library](docs/images/Sync Library.png?raw=true "Sync Library")

### Configuration
⟹ Open PowerShell ISE --> Settings --> Rebuild --> Sync Library with Content Editor Ribbon
![Sync Library](docs/images/Sync Library.png?raw=true "Sync Library")

## Usage instructions
⟹ Go To Developer Ribbon
(If its not visible, then right click in the ribbon area and add it)
![DeveloperRibbon](docs/images/DeveloperRibbon.png?raw=true "DeveloperRibbon")

⟹ You will see a button named APIDataSync in the Ribbon
![APIDataSync_Button](docs/images/APIDataSync_Button.png?raw=true "APIDataSync_Button")

⟹ Click on the Button and you will see the model
![APIDataSync_Model](docs/images/APIDataSync_Model.png?raw=true "APIDataSync_Model")

⟹ Select Template for the fields mapping
⟹ Select parent Data Source Item
⟹ Select API item to get the api URL
⟹ Click Data Sync 
![APIDataSync_Model_OK](docs/images/APIDataSync_Model_OK.png?raw=true "APIDataSync_Model_OK")

⟹ See the Data Source item with the entries created from API data
![DataSourceItem](docs/images/DataSourceItem.png?raw=true "DataSourceItem")


## Comments
Templates and APIs are tightly mapped with the field names. We have created 3 different Templates and Data Sources for Demo purpose. 
Also created 3 API items and added the respective API URL's in it.
While running the Data Sync command, Please select the correct Template, Data Source and API item to mapped the correct data.

