# uninstall.ps1

$modulename = 'Watch-Command'
Remove-Module Watch-Command
rmdir $HOME\Documents\WindowsPowerShell\Modules\$modulename -Force