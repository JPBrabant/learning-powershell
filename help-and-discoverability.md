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
- `-Parameter <parameterName>` — Support wildcards
- `-Examples` 

You can also get help about specific concepts in PowerShell called about pages.

```pwsh
help about_* # Show all about pages
help about_Parameters
```

# Commands

```pwsh
Get-Command -Name Curl # Almost like a Where.exe.
gcm Import-* # Allow searching with wildcard
gcm -Module Microsoft.WinGet.Client # Show all commands in a module
gcm -CommandType ...
```

`-CommandType`
- `Alias`       — Same as using `Get-Alias`
- `Function`    — Like `mkdir`
- `Cmdlet`      — PowerShell command are called cmdlet
- `Application` — Like `curl.exe` and `edit.exe`

# Alias

```pwsh
Get-Alias -Definition Get-Command # All alias of Get-Command
Get-Alias -Name gcm # The command linked to the alias gcm
gal gcm
```

# Member

```pwsh
Get-Member
```

# Type

```pwsh
(gci)[0].GetType().FullName
```