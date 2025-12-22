# Requires

Require PowerShell latest version. Put this line at the begining of your file.

```pwsh
#Requires -Version 7
```

# Error Action Preference

Stop script exepction when an error occur. Put this line at the begining of your file.

```pwsh
$ErrorActionPreference = "Stop"
```

# Importing modules

```pwsh
<#
.SYNOPSIS
    Installs, updates, and imports required PowerShell modules.

.DESCRIPTION
    This function checks if specified PowerShell modules are available on the system.
    If a module is not installed, it will be installed from the PowerShell Gallery.
    If a module is already installed, it will attempt to update it to the latest version.
    After installation or update, the module is imported into the current session.

.PARAMETER Modules
    An array of module names to install, update, and import.
    This parameter is mandatory.

.EXAMPLE
    Install-RequiredModules -Modules @('Microsoft.PowerShell.SecretManagement', 'ImportExcel')
    
    Installs or updates the SecretManagement and ImportExcel modules, then imports them.

.EXAMPLE
    Install-RequiredModules -Modules 'Pester'
    
    Installs or updates the Pester module, then imports it.

.NOTES
    - Requires PowerShell 7 or later
    - Modules are installed with -Scope CurrentUser to avoid requiring elevated permissions
    - Update-Module is called for existing modules to ensure they are up to date
#>
function Install-RequiredModules {
    param (
        [Parameter(Mandatory = $true)]
        [string[]]$Modules
    )
    
    foreach ($module in $Modules) {
        if (-not (Get-Module -ListAvailable -Name $module)) {
            Write-Information -MessageData "Installing $module module"
            Install-Module -Name $module -Scope CurrentUser
        } else {
            Write-Information -MessageData "Trying to update $module module"
            Update-Module -Name $module
        }
        Import-Module -Name $module
    }
}
```

# Show popup

```pwsh
<#
.SYNOPSIS
    Displays a Windows Forms message box with customizable buttons and icons.

.DESCRIPTION
    This function creates and displays a message box dialog using Windows Forms.
    It supports various button configurations (OK, OK/Cancel, Yes/No, Yes/No/Cancel)
    and icon types (Information, Warning, Error, Question).
    The function returns the user's response as a string.

.PARAMETER Message
    The message text to display in the message box.
    This parameter is mandatory.

.PARAMETER Title
    The title text displayed in the message box title bar.
    Default value is "Information".

.PARAMETER ButtonType
    The type of buttons to display in the message box.
    Valid values: "OK", "OKCancel", "YesNo", "YesNoCancel"
    Default value is "OK".

.PARAMETER IconType
    The type of icon to display in the message box.
    Valid values: "Information", "Warning", "Error", "Question"
    Default value is "Information".

.OUTPUTS
    System.String
    Returns the button that was clicked (e.g., "OK", "Cancel", "Yes", "No").

.EXAMPLE
    Show-Popup -Message "Operation completed successfully!"
    
    Displays an information message box with an OK button.

.EXAMPLE
    $result = Show-Popup -Message "Do you want to continue?" -Title "Confirm" -ButtonType "YesNo" -IconType "Question"
    if ($result -eq "Yes") { Write-Host "User confirmed" }
    
    Displays a confirmation dialog and captures the user's response.

.EXAMPLE
    Show-Popup -Message "An error occurred during processing" -Title "Error" -IconType "Error"
    
    Displays an error message box.

.NOTES
    Requires System.Windows.Forms assembly.
#>
function Show-Popup {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [string]$Title = "Information",
        [ValidateSet("OK", "OKCancel", "YesNo", "YesNoCancel")]
        [string]$ButtonType = "OK",
        [ValidateSet("Information", "Warning", "Error", "Question")]
        [string]$IconType = "Information"
    )

    Add-Type -AssemblyName System.Windows.Forms

    $buttonMap = @{
        "OK" = [System.Windows.Forms.MessageBoxButtons]::OK
        "OKCancel" = [System.Windows.Forms.MessageBoxButtons]::OKCancel
        "YesNo" = [System.Windows.Forms.MessageBoxButtons]::YesNo
        "YesNoCancel" = [System.Windows.Forms.MessageBoxButtons]::YesNoCancel
    }

    $iconMap = @{
        "Information" = [System.Windows.Forms.MessageBoxIcon]::Information
        "Warning" = [System.Windows.Forms.MessageBoxIcon]::Warning
        "Error" = [System.Windows.Forms.MessageBoxIcon]::Error
        "Question" = [System.Windows.Forms.MessageBoxIcon]::Question
    }

    $result = [System.Windows.Forms.MessageBox]::Show(
        $Message,
        $Title,
        $buttonMap[$ButtonType],
        $iconMap[$IconType]
    )

    return $result.ToString()
}
```

# Format datetime

```pwsh
<#
.SYNOPSIS
    Formats a DateTime object to a standardized ISO-like string format.

.DESCRIPTION
    This function converts a DateTime object to a string in the format "yyyy-MM-dd HH:mm:ss".
    If the input DateTime is null, the function returns null.
    This is useful for consistent date/time formatting across the application.

.PARAMETER DateTime
    The DateTime object to format. This parameter accepts null values.
    If null is provided, the function returns null.

.OUTPUTS
    System.String or $null
    Returns a formatted date/time string in "yyyy-MM-dd HH:mm:ss" format, or null if input is null.

.EXAMPLE
    Format-IsoDateTime -DateTime (Get-Date)
    
    Returns the current date and time formatted as "2025-12-22 14:30:45".

.EXAMPLE
    $timestamp = [DateTime]::Parse("2025-12-25 10:00:00")
    Format-IsoDateTime -DateTime $timestamp
    
    Returns "2025-12-25 10:00:00".

.EXAMPLE
    Format-IsoDateTime -DateTime $null
    
    Returns $null.

.NOTES
    The format used is "yyyy-MM-dd HH:mm:ss" which is similar to ISO 8601 but without the 'T' separator.
#>
function Format-IsoDateTime {
    param (
        [Parameter(Mandatory = $false)]
        [AllowNull()]
        [Nullable[datetime]]$DateTime
    )

    if ($null -eq $DateTime) {
        return $null
    }
    
    return $DateTime.ToString("yyyy-MM-dd HH:mm:ss")
}
```