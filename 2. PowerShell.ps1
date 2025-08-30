# Minimum Version 7.5 and Core (instead of Desktop)
#Requires -Version 7.5
#Requires -PSEdition Core

# Get the current version of PowerShell.
Get-Host
$PSVersionTable


####################
# EXPLORING cmdlet #
####################

# Update all the help doc (execute as administrator).
Update-Help

# Find all command about CSV.
Get-Command -Name *Csv*

# Get help about Import-Csv command. 
Get-Help Import-Csv
Get-Help Import-Csv -Examples
Get-Help Import-Csv -Full
Get-Help Import-Csv -Detailed
Get-Help Import-Csv -Parameter *

# Can be used to see all members part of the selected object
Get-Process -Id $PID | Get-Member                              # Member include both Properties and Methods.
Get-Process -Id $PID | Get-Member -MemberType Property         # Only Properties.
Get-Process -Id $PID | Get-Member | Sort-Object -Property Name # Sort the output.

# Get all property name and value
Get-Process | Select-Object -First 1 -Property *


#######################
# FILES AND DIRECTORY #
#######################

# ls.
Get-ChildItem -Path 'C:\Git\Learning PowerShell\'
Get-ChildItem -Recurse -Path 'C:\Git\'

# See the content of a file.
Get-Content -Path 'C:\Git\Learning PowerShell\Test1.ps1'

# Create a file or directory
New-Item -ItemType File -Path NewFile.txt
New-Item -ItemType Directory -Path TestFolder

Remove-Item -Path NewFile.txt


#########
# ALIAS #
#########

Get-Alias -Name gci
Get-Alias -Definition Get-ChildItem


#################
# SHOWING STUFF #
#################

# Format.
Import-Csv -Path .\insurance.csv | Select-Object -First 10 | Format-Table
Import-Csv -Path .\insurance.csv | Select-Object -First 10 | Format-List

# Writing.
Write-Host -Object 'Test'

# Paging.
# Should be like more but does not work.
(Invoke-WebRequest -Uri https://google.com).RawContent | Out-Host -Paging
(Invoke-WebRequest -Uri https://google.com).RawContent | more

########
# LINQ #
########

# Top 10.
Get-Process | Select-Object -First 10

# Filtering.
Get-Process | Where-Object WorkingSet -GT 50MB # LT, Is, EQ, Not, etc.

# Selecting column.
Get-Process | Select-Object ID, Name

# For-each with a {} script block. $_ name refer to the current iteration of Get-Process
Get-Process | ForEach-Object -Process { Write-Host $_.Name  }

# Another example using multiline, and using Begin and End, execute before and after Process.
1..5 | ForEach-Object -Begin {
    Write-Host "Starting the pipeline. Creating value."
    $value = 0
} -Process {
    Write-Host "Adding $_ to value."
    $value += $_
} -End {
    Write-Host "Finished the pipeline. Displaying value."
    $value
}

# Sort.
Get-Process -Id $PID | Get-Member | Sort-Object -Property Name


##################
# MODULE (ADDON) #
##################

Get-Module -ListAvailable
$Env:PSModulePath -split ';'
Find-Module -Filter DevOps





# grep.
Select-String

# Accessing a property
$process = Get-Process -Id $PID 
$process.Name
# or
(Get-Process -Id $PID).Name

# Try - catch
try {
    Invoke-WebRequest -UseBasicParsing -Uri "https://www.simons.ca/simons/json/ajaxStoreAvailabilityPopup.jsp?prdId=6955-209209&skuId=3943273&__=0.14130918214642296"
}
catch {
    Write-Output $_.Exception.Message
}

