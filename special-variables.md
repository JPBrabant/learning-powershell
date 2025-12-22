# Automatic Variables or Built-in Variables

- `$PSScriptRoot`               — Contains the directory path of the script being executed
- `$PWD`                        — Current working directory
- `$PSVersionTable`             — Contains information about the PowerShell version and environment
- `$PSHome`                     — Directory where PowerShell is installed
- `$PSCommandPath`              — Full path of the script being run
- `$PSBoundParameters`          — Parameters passed to a script or function
- `$PSCmdlet`                   — Represents the cmdlet or function being executed
- `$PSHOME`                     — Installation directory for PowerShell
- `$PROFILE`                    — Path to the user profile
- `$_` or `$PSItem`             — Current object in the pipeline
- `$true`, `$false`, `$null`    — Boolean and null values
- `$HOME`                       — User's home directory
- `$args`                       — Array of parameters passed to a function
- `$Error`                      — Array of recent error objects
- `$LastExitCode`               — Exit code of the last native command
- `$PID`                        — Id of the current process
- `$PSCulture`                  — Culture of the current session (en_US, fr_CA)

You can find out more with

```pwsh
Get-Help about_Automatic_Variables
```


# Environment Variables

- `$env:PATH`                           — System PATH variable (directories searched for executables)
- `$env:USERNAME`                       — Current logged-in user
- `$env:COMPUTERNAME`                   — Name of the computer
- `$env:USERPROFILE`                    — User's profile directory (e.g., C:\Users\YourName)
- `$env:TEMP` or `$env:TMP`             — Temporary files directory
- `$env:HOMEDRIVE`                      — Drive letter of the user's home directory
- `$env:HOMEPATH`                       — Path of the user's home directory
- `$env:APPDATA`                        — Application data folder
- `$env:ProgramFiles`                   — Program Files directory
- `$env:windir` or `$env:SystemRoot`    — Windows directory

You can find out more with

```pwsh
Get-Help about_Environment_Variables
```