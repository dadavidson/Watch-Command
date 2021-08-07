# install.ps1

$modulename = 'Watch-Command'
mkdir $HOME\Documents\WindowsPowerShell\Modules\$modulename -Force
Copy-Item -Recurse -Path .\Watch-Command\Watch-Command.psm1 -Destination $HOME\Documents\WindowsPowerShell\Modules\$modulename -Force | Out-Null
Import-Module Watch-Command