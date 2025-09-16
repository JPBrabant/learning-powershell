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

# Figuring out the type of an object (don't forget most command return an array of object)
(ps)[0].GetType().FullName


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
Import-Csv -Path .\insurance.csv | Select-Object -First 10 | Format-Table -AutoSize
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

# Measure the time it take to run a command. Piping to out-host allow you to see the result of the command.
Measure-Command -Expression { Get-ChildItem -Recurse C:\Git | Out-Host } 

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

$array = @()
$array = @(1,2,3) # Array
$array = 1,2,3
$array = @( # No comma
    1
    2
    3
) # Array

$hashTable = @{}
$hasTable = @{Test = $true, $str = "String"} # Hash table
$hasTable = @{ # No comma
    KeyName1 = "Value 1"
    KeyName2 = "Value 2"
}

# Custom object multiline
[PSCustomObject]@{
    KeyName1 = "Value 1"
    KeyName2 = "Value 2"
}

# Custom object one line
[PSCustomObject]@{Name="CustomObject";Expand=@(1,2,3,4,5)}

# String multiline
@"
Text
"@

50MB # You can use MB, GB, KB, ...


##########
# STRING #
##########

"Lastname;FirstName;Address" -split ";" # There is other option for this command, see about_split.
"John", "Smith" -join " "
$_.Name -replace '\.txt$','.log'

# https://learn.microsoft.com/dotnet/api/system.string.format
"Value {0} inside a string" -f $value
"Price is {0:C2}" -f $dollarValue # Format as a currency

# Clipboard
Get-Content 'test.txt' | Set-Clipboard
Get-Clipboard


########
# DATE #
########

Get-Date
Get-Date + New-TimeSpan -Hour 6
(Get-Date).AddDays(2)


#########
# REGEX #
#########

'' -match ''
'' -replace '', ''
Select-String -Pattern ''

# Visual representation of regex at : https://www.debuggex.com/

# . : Any character
# a* : Zero or more time
# b+ : One or more time
# c{2} : 2 times
# c{2,4} : 2 to 4 times
# c{2,} : minimum 2 times
# d? : 0 or 1 time
# All previous quantifier are greedy, they can be made lazy with .*?
# \ : Escape special char
# Non printable char : \t (tab), \n\r (line feed and carriage return)
# [abc]
# [a-c]
# [^aeiou] : Not a vowel
# \d or \D : Digit or not a digit
# \w or \W : Word character (a-z, 0-9, _) or not a word character
# \s or \S : White space

# one|two : OR
# (one|two) : group

# Automatic variable
'The first rule is' -match 'first'
$Matches # Contain an array with [0] = 'first'

# $Matches[0] : Alway contain the whole match
# $Matches[1] : If using group, they will show up after 1
# (?<GroupName>regex) : Named capture group $Matches["GroupName"]

# Achors
'C:\Test' -match '^C' # Start with C
'C:\Test' -match 'Test$' # End with test
'The first day is monday' -replace '\bday\b', 'night' # \b is a Word bondary, it wont replace the day inside monday.

# Look ahead and look behind
# Describe what happen before or after an expression without affecting what is captures in the $Matches array
"includedRegex(?=, lookAheadRegex)"
"(?<=, lookBehindRegex)includedRegex"

# Regex option
# i : case insensitive
# m : multi-line
# s : single-line
# n : ignore unamed group
# x : ignore unsacaped white space (allow you to use comment)

# Exemple
# x option allow comment
# n ignore unamed group
# /s and /s usefull to parse output of linux or DOS command like ls
$regex = '(?xn)
# Start of string
^
# Left hand side of the table
\s*
# First column
(?<Protocol>\S*)\s+
'

############
# OPERATOR #
############

-and
-or
-not

"1" -as [Int32] # or simplit [Int32]"1" or [Xml]$newVar
"1" -is [String]
"1" -isnot [Int32]

# Call operator : execute a string or script block
& 'note.exe'

# Background job operator
$job = Get-Process &
Get-Job
$job | Receive-Job # Show the output of Receive-Job when finished.

# Ternary operator
$val = $valBool ? $trueVal : $falseVal

# Null coalescing
$val = $valueA ?? 'Default value' # If valueA is not null, assign valueA, if null assign 'Default value'

# Chain operator
program1.exe && program2.exe # Only run program 2 if program 1 did not fail (throw Exception).


###############
# FILE SYSTEM #
###############

Get-ChildItem # Need to use -Force if testing for hidden file
Get-Item      # Need to use -Force if testing for hidden file
New-Item
Remove-Item
Test-Path 
Get-ItemProperty
Set-ItemProperty
Get-Content
Get-Acl
Set-Acl
$tmpFile = New-TemporaryFile
Set-Location # "Set-Location -" and "Set-Location +" allow you to go backward or foward in history
Invoke-Item # Open .txt file with Notepad for example
Get-FileHash -Algorithm SHA1 -Path .


##################
# ERROR HANDLING #
##################

try {
    Invoke-WebRequest -UseBasicParsing -Uri "https://www.simons.ca/"
}
catch {
    Write-Output $_.Exception.Message
}


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


###############
# WEB REQUEST #
###############

# Best at dealing with HTML.
# The parameter -UseBasicParsing is not used anymore.
# Use Regex to parse or content or the custom module PSParseHTML.
Invoke-WebRequest -Uri "https://evenko.ca/fr/salles/place-bell"

# Best at dealing with JSON or XML.
Invoke-RestMethod 


####################
# SPECIAL VARIABLE #
####################

# Home
Set-Location ~
Set-Location $HOME
Set-Location $env:USERPROFILE

# C:\Program Files
Set-Location C:\progra~1 # 64 bits
Set-Location C:\progra~2 # 32 bits
Set-Location C:\progra~3 # C:\ProgramData


#######
# JOB #
#######

Start-Job -Name TestJob -ScriptBlock { Start-Sleep -Seconds 10 }
Get-Job -Name TestJob | Receive-Job -Wait
1..10 | ForEach-Object -Parallel { Write-Host $_ }


###########
# PROCESS #
###########

# It will open in the default program for that type of file. 
# Alias : start
Start-Process C:\Git # File explorer
start test.txt # Notepad


############
# FUNCTION #
############

function New-Function {
    param (
         [String] $param1 = 'Default value',
            [Int] $param2 = 1,
        [Boolean] $param3 = $false
    )

}

##################
# USEFULL SCRIPT #
##################

# List all command for the Winget module.
Get-Command -Module Microsoft.WinGet.Client | Where-Object CommandType -eq Cmdlet | Sort-Object Name