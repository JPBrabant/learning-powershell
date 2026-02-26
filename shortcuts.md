# Shortcuts

Anything that can make me more productive should be here.

## PowerShell shortcuts

### Default shell association 

```pwsh
start C:\         # Open file explorer at this directory
start C:\test.txt # Open notepad
ii C:\
ii C:\test.txt
```

### Direct access to programs

```pwsh
notepad C:\test.txt
code C:\dev
```

### Navigating

```pwsh
sl - # Go to previous directory
```


## Windows Terminal shortcut

### Auto complete `TAB`

### Menu complete `CTRL+SPACE`

### Accepts inline suggestion `Right Arrow`

### Switch between InlineView and ListView for suggestion `F2`

### Show command Help `F1`
Placing the cursor at the end of a full command name will open the Full Help page in a different buffer.

### Cycle through all command history `Up/Down`
Navigate through your entire command history sequentially. Up arrow shows previous commands, down arrow shows more recent ones, regardless of what's currently typed in the prompt.

### Search history with filter `F8`
Search backward through your command history, but only show commands that begin with what you've already typed. For example, if you type `Get-` and press `F8`, only `Get-*` commands will be shown. `Shift+F8` to search forward.

### Fuzzy search command history `CTRL+R`
Start an interactive search mode where you can type letters to perform a fuzzy match against your command history. This finds commands containing your search term anywhere in the command, not just at the beginning. Press `CTRL+R` to go backward and `CTRL+S` to go foward.

### Search history with `# + keyword + Tab`
Type a hash followed by a keyword, then press `Tab` to cycle through command history that contains that keyword. This performs a fuzzy search across your history for commands matching that term. 

### Focused parameter help `ALT+H`
Placing the cursor at the end of a parameter, this command will show you help about this parameter. 

### Selecting arguments value `ALT+A`
Move the cursor to the next value of a parameter. 

### Full screen `ALT+ENTER`

### Command palete `CTRL+SHIFT+P`

### Duplicate pane `ALT+SHIFT+D`
Open a new pane with the current profile on the right.

### Close pane `CTRL+SHIT+W`

### Switch between pane `ALT+ARROW`
Use the right arrow to go the right pane for example. 

### Clear screen `CTRL+L`

### Clear line `CTRL+Home`