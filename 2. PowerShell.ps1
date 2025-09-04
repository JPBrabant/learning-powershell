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
Get-Help Import-Csv           # Syntaxe, Description
Get-Help Import-Csv -Examples
Get-Help Import-Csv -Full     # Syntaxe, Description, full Parameter info and Examples
Get-Help Import-Csv -Detailed # Syntaxe, Description, partial Parameter info and Examples
Get-Help Import-Csv -Parameter *

# Can be used to see all members part of the selected object
Get-Process -Id $PID | Get-Member                              # Member include both Properties and Methods.
Get-Process -Id $PID | Get-Member -MemberType Property         # Only Properties.
Get-Process -Id $PID | Get-Member | Sort-Object -Property Name # Sort the output.

# Get all property name and value
Get-Process | Select-Object -First 1 -Property *

# If you are looking for a command about object but you forgot it's name
*object # CTRL+TAB will show all command ending with object

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

Write-Verbose 'Test' # Only show up if the script is called with -Verbose

'a' | Out-Null # Hide the output

# Paging.
# Should be like more but does not work.
(Invoke-WebRequest -Uri https://google.com).RawContent | Out-Host -Paging
(Invoke-WebRequest -Uri https://google.com).RawContent | more

########
# LINQ #
########

# Measure
Get-Process | Measure-Object # Number of process
Get-Process | Measure-Object -Word # Number of word in a string
Get-Process | Measure-Object -Line # Number of line in a string
Get-Process | Measure-Object -Character # Number of character in a string
Get-Process | Measure-Object -Property Id -Minimum # Maximum, Sum, Average, ...

# Filtering.
Get-Process | Where-Object -Property PriorityClass -Value Normal -EQ # Long form
Get-Process | Where-Object PriorityClass -EQ Normal                  # Short form
Get-Process | where PriorityClass -EQ Normal                         # Shortest form
Get-Process | Where-Object {$_.PriorityClass -eq "Normal"}           # Script block syntax

# Select

# Property
Get-Process | Select-Object -Property Id # Return an array of PSCustomObject with 1 property Id (so it include a header row)
Get-Process | Select-Object -ExpandProperty Id # Return an array of Int32, no object, no header row.
Get-Process | Select-Object -ExpandProperty Modules # Can be used to expand an object to show it properties (return a System.Diagnostics.ProcessModule)

# Top 10.
Get-Process | Select-Object -First 10 # Last, Unique, Skip, Index

# Selecting column.
Get-Process | Select-Object -Property ID, Name

# For-each with a {} script block. $_ name refer to the current iteration of Get-Process
Get-Process | ForEach-Object -Process { Write-Host $_.Name  }

# Another example using multiline, and using Begin and End, execute before and after Process.
1..5 | ForEach-Object -Begin {
    Write-Host "Starting the pipeline. Creating value."
    $value = 0
    $value
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
Get-Module SqlServer -ListAvailable # Check if SqlServer module is installed
Install-Module SqlServer

###########################
# COLLECTION AND DATATYPE #
###########################

@(1,2,3) # Array
@{Test = $true, $str = "String"} # Hash table

# Custom object multiline
[PSCustomObject]@{
    KeyName1 = "Value 1"
    KeyName2 = "Value 2"
}

# Custom object one line
[PSCustomObject]@{Name="CustomObject";Expand=@(1,2,3,4,5)}

50MB # You can use MB, GB, KB, ...

############
# OPERATOR #
############

-and
-or
-not
"Lastname:FirstName:Address" -split ":", 2, "SimpleMatch" # The separator, max number of instance and options (https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_split)
-replace
"1" -as [Int32]
"1" -is [String]
"1" -isnot [Int32]

##################
# ERROR HANDLING #
##################

try {
    Invoke-WebRequest -UseBasicParsing -Uri "https://www.simons.ca/"
}
catch {
    Write-Output $_.Exception.Message
}

##########
# OTHERS #
##########

# grep.
Select-String

##################
# WHERE OPERATOR #
##################

-Match "^p.*" # Regular expression
-NotMatch
-Like "p.*" # wildcard characters : *, ?, [0-9], [abc]
-NotLike

-Contains "Svchost" # $array -contains $value
-NotContains

-In "Svchost", "TaskHost", "WsmProvHost" # $value -in $array (reverse syntax of contains)
-NotIn

-EQ # Equal
-NE # Not equal

-GE # greater than or equal 
-GT # greater than 
-LE # less than or equal 
-LT # less than 

-Is [datetime] # Indicates that this cmdlet gets objects if the property value is an instance of the specified .NET type. Ex.:
-IsNot

"Test" | Where-Object Length      # gets objects if the property exist and has a value
"Test" | Where-Object -Not Length # gets objects if the property doesn't exist or has a value of $null or $false.
