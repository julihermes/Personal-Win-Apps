Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# ALIAS
function runLS { lsd -A }
Set-Alias ls runLS -force -option 'Constant','AllScope'

function runLL { lsd -lA }
Set-Alias ll runLL

function runLT { lsd --tree }
Set-Alias lt runLT
