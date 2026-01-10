# General web request

```pwsh
Invoke-WebRequest -Uri "http://google.com"
iwr "http://google.com"
```

This command does not allow you to easily parse the HTML back. 

# REST

```pwsh
Invoke-RestMethod
irm
```