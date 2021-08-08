<#
.SYNOPSIS
Watch-Command - execute a program periodically, showing output fullscreen

.DESCRIPTION
The `Watch-Command` cmdlet runs command repeatedly, displaying its output and errors. 

This allows you to watch the program output change over time. By default, command is ran every 2 seconds and watch will run until interrupted.

.PARAMETER command
The command that is to be executed repeatedly.

.PARAMETER interval
The update interval in second(s).

.EXAMPLE
Watch-Command 'Get-Content file.txt' 5

This example using positional parameters will run Get-Content every 5.0s.

.EXAMPLE
Watch-Command -Command 'Get-Content file.txt' -Interval 5

This example referencing the paramters will run Get-Content every 5.0s.

.LINK
https://github.com/danieldavidson/Watch-Command

.NOTES
Written by: Daniel Davidson

License:

The MIT License (MIT)

Copyright (c) 2021 Daniel Davidson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Change Log
V1.00, 2021-08-06, Initial build.
#>

$Interval = 2
function Watch-Command {
  [CmdletBinding()]
  param (
    # Parameter description: Execute a command. Command may need to be wrapped in quotes.
    [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string]$Command,

    # Parameter description: Command interval
    [Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [int]$Interval
  )

  process {
    $cmd = [scriptblock]::Create($Command);
    while ($true) {
      Clear-Host;
      Write-Host "Every $Interval.0s: $Command";
      $cmd.Invoke();
      Start-Sleep $Interval;
    }
  }
}