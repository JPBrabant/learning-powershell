# Variable expansion

Variable placed inside double-quote will be expanded. 

```pwsh
$name = "John"
Write-Host "Hello, $name"  # Output: Hello, John
```

Single quote will not allow for expansion.

# Expanding subexpressions

Expand subexpressions using $()

```pwsh
Write-Host "Calculate $(2 + 2)" # Output Calculate 4
```

# Escaping special characters

Use the backtick to escape special character.

```pwsh
`$ # Dollar sign
`" # Double quote
`` # Back tick
```

# Special characters

```pwsh
`n # New line
`t # Tab
```

# Multi-line command

## Backtick (`) — Line continuation character

There is multiple way to input a command on multiple lines. 

One of those is using the backtick:

```pwsh
New-ScheduledTaskAction `
    -Execute "pwsh" `
    -Argument "-File test.ps1"
```

This way should be avoided because what you are actually doing is escaping the new line character at the end of the line. Consequently, adding a space after the backtick will break this technic.

## Pipeline (|) — Natural line break

PowerShell automatically continues to the next line after a pipe:

```pwsh
Get-Process |
    Where-Object { $_. CPU -gt 100 }
```

## Open parentheses, braces, or brackets

PowerShell continues to the next line when there's an unclosed opening character:

```pwsh
Get-ChildItem |
    Where-Object {
        $_.Length -gt 1MB -and
        $_.CreationTime -gt (Get-Date).AddDays(-7)
    }
```

## Splatting — Using hash tables
This is particularly useful for commands with many parameters:

```pwsh
$params = @{
    Path   = 'C:\Logs'
    Filter = '*.log'
}
Get-ChildItem @params
```

## Here-strings (for multi-line strings)

```pwsh
Get-WingetPackage --custom @"
/COMPONENTS=gitlfs 
/o:EditorOption=CustomEditor 
/o:CustomEditorPath=edit.exe
"@
```