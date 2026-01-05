# Csv

```pwsh
Import-Csv
ipcsv

Export-Csv
epcsv

ConvertFrom-Csv

ConvertTo-Csv
```

# Json

```pwsh
ConvertFrom-Json

ConvertTo-Json

Test-Json
```

# Parquet

```pwsh
Install-Module -Name PSParquet -Scope CurrentUser

Import-Module PSParquet

Import-Parquet -Path ".\file.parquet"

Export-Parquet -InputObject $data -Path ".\file.parquet"
```

# Xml

## Generic Xml document

```pwsh
[xml]$xmlDoc = Get-Content -Path ".\file.xml"

# Access the root element and its children using dot notation
$xmlDoc.Configuration.Settings.Item
```

## PowerShell object saved as Xml

```pwsh
Get-Process | Export-Clixml -Path .\process.xml
$processes = Import-Clixml -Path .\process.xml
```

# Excel

```pwsh
Install-Module -Name ImportExcel -Scope CurrentUser

Import-Module ImportExcel

Import-Excel -Path ".\file.xlsx" -WorksheetName "SalesData"

Export-Excel -Path ".\file.xlsx"
```