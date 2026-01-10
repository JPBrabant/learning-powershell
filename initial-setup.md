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

```cmd
winget (install|update) --exact --id Microsoft.PowerShell
```

# Configuring the Terminal

In the `Settings` page of Windows Terminal

1. Hide the `Windows PowerShell` profile. This is the old Windows built-in PowerShell (v5).

2. Use the `Open JSON file` button at the bottom to reorder the profile and put PowerShell as the first one. 

3. Downlaod and install a Nerd Font. This is a font that include many built-in icon and ligature. Download the CaskaydiaMono Nerd Font at 

	[CaskaydiaCove Nerd Font](<https://www.nerdfonts.com/font-downloads>)

	[Cascadia Code](<https://github.com/microsoft/cascadia-code>)

3. In the `Defaults` profile, go to `Appearance`

	- Color scheme : Campbell
	- Font face : CaskaydiaCove or Cascadia Code (default font face is Cascadia Mono)
	- Font size : 11 (default is 12)

4. Oh My Posh

	Oh My Posh allow you to customize the prompt of the terminal. 

		winget install --exact --id JanDeDobbeleer.OhMyPosh

	Then add it to your PowerShell personnal profile (equivalent to .bashrc).

	The path is `C:\Users\[username]\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

	If the file does not exist you can create it with 

	```PowerShell
	New-Item -Type File -Path $PROFILE 
	```

	Edit with

		notepad $PROFILE

	or

		edit $PROFILE

	And add the following line for the default theme

		oh-my-posh init pwsh | Invoke-Expression

		or

		oh-my-posh init pwsh --config 'catppuccin_mocha' | Invoke-Expression

5. [Catppuccin](https://catppuccin.com/)

	Color theme for the terminal available on [Github](https://github.com/catppuccin/windows-terminal).

    - **Latte** : Lightest
    - **Frappé** 
    - **Macchiato**
    - **Mocha** : Darkest (the one I use)

	Copy and paste both file from the Github inside the Terminal setting json file and select **Catppuccin Mocha** in both Profile/Defaults/Appearance and in the general Appearance setting page.

6. Installing usefull modules

	The first module we will install is a wrapper around `winget` that allow you to use PowerShell pattern and object with the winget cli. 

		Install-Module -Name Microsoft.WinGet.Client  -Repository PSGallery -Force
		Import-Module -Name Microsoft.WinGet.Client

	<https://powershellisfun.com/2024/11/28/using-the-powershell-winget-module/>


	The 2nd module we will install is `posh-git`. This module allow you to use auto-complete on git commands and, tags and branches. 

		Install-Module -Name posh-git -Repository PSGallery -Force
		Import-Module -Name posh-git

	<https://github.com/dahlbyk/posh-git>


	Finally, adding some icons for the files and folder.

		Install-Module -Name Terminal-Icons -Repository PSGallery -Force
		Import-Module -Name Terminal-Icons

	<https://github.com/devblackops/Terminal-Icons>

	Finaly edit with

		notepad $PROFILE

	or

		edit $PROFILE

	And add the following line

		Import-Module -Name posh-git
		Import-Module -Name Microsoft.WinGet.Client
		Import-Module -Name Terminal-Icons