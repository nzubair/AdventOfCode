<#

Advent of Code - http://adventofcode.com
2020 - Day 2 - Puzzle 1

Similar to Day 2 Puzzle 1, but instead of counting characters, checking the 
presence and absence of the character at the positions specified at the start
of the input strings.

Author: Nasir Zubair

#>
#region input
$Day = "02"
$InputFile = Join-Path $PSScriptRoot "Day$($Day)-input.txt"

if(-Not (Test-Path $InputFile)) 
{
    Write-Warning "Input file $($InputFile) not found."
    exit 1
}
$input = Get-Content -Path $InputFile
#endregion input

$valid = $invalid = 0

$input | ForEach-Object { 

    $position1,$position2,$char,$pwd = ($_ -replace ": ",":") -split "[- :]"

    if(($pwd[$position1-1] -eq $char -and $pwd[$position2-1] -ne $char) -or ($pwd[$position1-1] -ne $char -and $pwd[$position2-1] -eq $char))
    {
        $valid++
        "{0} `t valid" -f $_
    }
    else
    {
        $invalid++
    }
} 

"Total   : $($input.Length)"
"Valid   : $($valid)"
"Invalid : $($invalid)" 