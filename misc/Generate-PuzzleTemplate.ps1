[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [int]$Year,
    [Parameter(Mandatory=$true)]
    [int]$Day,
    [Parameter(Mandatory=$true)]
    [int]$Puzzle
)

    
$Root = Resolve-Path $PSScriptRoot\.. | Select-Object -ExpandProperty Path

$FilePath = Join-Path $Root ("{0}\Day{1:00}-Puzzle-{2}.ps1" -f $Year,$Day,$Puzzle)

$templateContent = @"
<#

Advent of Code - http://adventofcode.com
$($Year) - Day $($Day) - Puzzle $($Puzzle)

<DESCRIPTION>

Author: Nasir Zubair

#>

#region input
`$input = `"`";

`$input = @`"

`"@ -split `"\n|\r\n`"
#endregion input

"@

$templateContent | Set-Content -Path $FilePath -Encoding UTF8