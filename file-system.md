# Files

## Listing files



## Creating files and directories

```pwsh
New-Item -ItemType File -Path <path>
ni <path>

New-Item -ItemType Directory <path>
mkdir <path>
```

- `-Force`                          — Overwrite file content
- `-Value "content"`                — Set the content of the file, can be passed by pipeline
- `-Path <path> -Name <fileName>`   — A combination of path and file name can be used

