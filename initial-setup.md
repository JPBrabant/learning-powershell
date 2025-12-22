# Core vs Windows

There are 2 versions of PowerShell: **Windows PowerShell** (command `powershell`), which only runs on Windows, and **PowerShell Core** (command `pwsh`), the newer cross-platform version.

Here is how to check which one you have installed : 

```cmd
where pwsh
where powershell
```

Check which version is installed:

```cmd
pwsh -Command "$PSVersionTable"
powershell -Command "$PSVersionTable"
```

# Installation

Install or update to the latest version of PowerShell Core using winget. Stick to the official release (not Preview versions, which don't support the `pwsh` command for script execution).

```cmd
winget (install|update) --exact --id Microsoft.PowerShell
```