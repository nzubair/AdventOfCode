[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [int]$Year,
    [Parameter(Mandatory=$true)]
    [int]$Day
)

$paths = @()

$Root = Resolve-Path $PSScriptRoot\.. | Select-Object -ExpandProperty Path

$InputFilePath = Join-Path $Root ("{0}\Day{1:00}-input.txt" -f $Year,$Day)

$templateContent = @"
<#

Advent of Code - http://adventofcode.com
{YEAR} - Day {DAY} - Puzzle {PUZZLE}

<DESCRIPTION>

Author: Nasir Zubair

#>
#region input
`$Day = `"{DAY2}`"
`$InputFile = Join-Path `$PSScriptRoot `"Day`$(`$Day)-input.txt`"

if(-Not (Test-Path `$InputFile)) 
{
    Write-Warning `"Input file `$(`$InputFile) not found.`"
    exit 1
}
`$input = Get-Content -Path `$InputFile
#endregion input

"@

"" | Set-Content -Path $InputFilePath -Encoding UTF8
$paths += $InputFilePath

1..2 | ForEach-Object { 

    $PuzzlePath = Join-Path $Root ("{0}\Day{1:00}-Puzzle-{2}.ps1" -f $Year,$Day,$_)

    $content = $templateContent -replace "{YEAR}",$Year
    $content = $content -replace "{DAY}",$Day
    $content = $content -replace "{DAY2}",($Day).ToString("D2")
    $content = $content -replace "{PUZZLE}",$_

    $content | Set-Content -Path $PuzzlePath -Encoding UTF8
    $paths += $PuzzlePath
}


if($Host.Name -eq "Visual Studio Code Host")
{
    $paths | ForEach-Object { code -r $_}
}
 