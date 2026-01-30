# Core vs Windows

There are 2 versions of PowerShell: **Windows PowerShell** (command `powershell`), which only runs on Windows, and **PowerShell Core** (command `pwsh`), the newer cross-platform version.

Here is how to check which one you have installed : 

```cmd
where pwsh
where powershell
```

Check which version is installed:

```cmd
pwsh -Command "$PSVersionTable"
powershell -Command "$PSVersionTable"
```

# Installation

Install or update to the latest version of PowerShell Core using winget. Stick to the official release (not the Preview versions, which don't support the `pwsh` command for script execution).

See installation instructions in my `pc-setup` repo.

# Configuring the Terminal

Most of the following instructions are already in the `pc-setup` repo but here is a recap anyway.

In the `Settings` page of Windows Terminal

1. Hide the `Windows PowerShell` profile. This is the old Windows built-in PowerShell (v5).

2. Use the `Open JSON file` button at the bottom to reorder the profile and put PowerShell as the first one. 

3. Download and install a Nerd Font. This is a font that include many built-in icon and ligature.

3. In the `Defaults` profile, go to `Appearance` and select your Nerd Font.

4. Install `Oh My Posh`

5. Set [Catppuccin](https://catppuccin.com/) as de default colors theme

	Color theme for the terminal available on [Github](https://github.com/catppuccin/windows-terminal).

    - **Latte** : Lightest
    - **Frappé** 
    - **Macchiato**
    - **Mocha** : Darkest (the one I use)

6. Install modules

	- `Microsoft.WinGet.Client`
	- `posh-git`
	- `Terminal-Icons` 