# Files

## Listing files

```pwsh
Get-ChildItem
gci
ls
```

## Creating files and directories

```pwsh
New-Item -ItemType File -Path <path>
ni <path>

New-Item -ItemType Directory <path>
mkdir <path>
md <path>
```

- `-Force`                          — Overwrite file content
- `-Value "content"`                — Set the content of the file, can be passed by pipeline
- `-Path <path> -Name <fileName>`   — A combination of path and file name can be used

## Remove, move, copy

```pwsh
Remove-Item
rm

Move-Item
mv

Copy-Item
cp
```

## Content

```pwsh
Get-Content
cat

Set-Content
```

# Location

```pwsh
Set-Location
sl
cd
```