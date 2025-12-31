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
Install-Module PSParquet

Import-Parquet -Path "path/to/file.parquet"

Export-Parquet -InputObject $data -Path "path/to/file.parquet"
```