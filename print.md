# Table and list output

# Write

# String manipulation

Almost all cmdlets output objects, if you want to do string manipulation on the output you need to convert it to a string.

```pwsh
Get-Help Get-Alias | Out-String
```