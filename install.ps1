# install.ps1

$modulename = 'Watch-Command'
mkdir $env:PSModulePath\$modulename
Copy-Item -Recurse -Path Watch-Command\Watch-Command -Destination $env:PSModulePath\$modulename -Confirm
Import-Module Watch-Command