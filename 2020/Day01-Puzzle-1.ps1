<#

Advent of Code - http://adventofcode.com
2020 - Day 1 - Puzzle 1

Loops through the input array, subtracts each element from 2020 and checks to see if the
remainder is present in the input array.

Author: Nasir Zubair

#>
#region input
$Day = "01"
$InputFile = Join-Path $PSScriptRoot "Day$($Day)-input.txt"

if(-Not (Test-Path $InputFile)) 
{
    Write-Warning "Input file $($InputFile) not found."
    exit 1
}
$input = Get-Content -Path $InputFile
#endregion input

for($i = 0; $i -lt $input.Length; $i++)
{
    $remainder = 2020 - [int]$input[$i]
    
    if($input -contains $remainder)
    {
        "{0} + {1} = {2}" -f $input[$i],$remainder,([int]$input[$i] + [int]$remainder)
        "{0} * {1} = {2}" -f $input[$i],$remainder,([int]$input[$i] * [int]$remainder)       
    }    
}