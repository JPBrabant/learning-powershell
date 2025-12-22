# Scheduler

## Get all task in a folder

```pwsh
Get-ScheduledTask -TaskPath "\MyTaskFolder\"
```

## Create a new scheduled task

```pwsh
$action = New-ScheduledTaskAction `
            -Execute "pwsh" `
            -Argument "-NoProfile -ExecutionPolicy Bypass -File `"C:\dev\script.ps1`""

$trigger = New-ScheduledTaskTrigger `
            -Weekly `
            -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday `
            -At 9:00AM

# Define the principal (user context) - run as the current user
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive

$settings = New-ScheduledTaskSettingsSet `
                -AllowStartIfOnBatteries `
                -DontStopIfGoingOnBatteries `
                -StartWhenAvailable `
                -RunOnlyIfNetworkAvailable: $false `
                -DontStopOnIdleEnd

Register-ScheduledTask `
    -TaskName "Name" `
    -Description "Runs script.ps1 every hour" `
    -Action $action `
    -Trigger $trigger `
    -Principal $principal `
    -Settings $settings
```

# Process

# Services

# Permissions

# Event logs
