# Help

## Update help

Execute as administrator:

```pwsh
Update-Help
```

## Getting help

```pwsh
Get-Help -Name <cmdlet>
help <cmdlet> # Use paging
```

- DEFAULT — Syntax and description only
- `-Detailed` — Syntax, description, partial parameter info and examples
- `-Full` — Syntax, description, full parameter info, examples and notes
- `-Parameter <parameterName>` — Can also be the star wild card
- `-Examples` 

You can also get help about specific concepts in PowerShell called about pages.

```pwsh
help about_* # Show all about pages
help about_Parameters
```

# Commands

```pwsh
Get-Command
```

# Member

```pwsh
Get-Member
```