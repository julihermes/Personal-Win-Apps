Clear-Host
Write-Output "MY PERSONAL WINDOWS APPS"

$apps = @(
    @{name = "Microsoft.PowerShell" },
    @{name = "Starship.Starship" },
    @{name = "junegunn.fzf" },
    @{name = "ajeetdsouza.zoxide" },
    @{name = "lsd-rs.lsd" },
    @{name = "Microsoft.PowerToys" }
    @{name = "RARLab.WinRAR" },
    @{name = "9NJ3KMH29VGJ" }, #Enpass
    @{name = "Google.Chrome" },
    @{name = "Arc.Arc" },
    @{name = "Readdle.Spark" },
    @{name = "9NKSQGP7F2NH" }, # Whatsapp
    @{name = "Telegram.TelegramDesktop" },
    @{name = "Ytmdesktop.Ytmdesktop" },
    @{name = "SumatraPDF.SumatraPDF" },
    @{name = "Logitech.GHUB" },
    @{name = "ShareX.ShareX" },
    @{name = "9PM860492SZD" }, # PC Manager
    @{name = "SamHocevar.WinCompose" }
);

$CONTINUE = Read-Host -Prompt 'Would you like to continue with the install? (y,n)'
if ($CONTINUE -eq 'y' || $CONTINUE -eq 'Y') {
  Write-Output "Starting..."
} else {
  Write-Output "This script will now exit, no changes were made to your system."
  exit
}

Write-Output "Installing apps, this may take a while..."
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}

Write-Output "Coping starship file..."
mkdir $HOME\.config
cp config\starship.toml $HOME\.config\starship.toml

Write-Output "Coping profile file..."
cp config\profile.ps1 $PROFILE.CurrentUserAllHosts

Write-Output "Script had completed!"
