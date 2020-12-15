<#

Advent of Code - http://adventofcode.com
2020 - Day 1 - Puzzle 2

Similar to Day 1 Puzzle 1, but need a nested loop. The approach to check the array
for remainder in the array still works. 

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

$input = $input | Sort-Object -Descending

for($i = 0; $i -lt ($input.Length)-1; $i++)
{
    for($j = 1; $j -lt $input.Length; $j++)
    {
        $remainder = 2020 - ([int]$input[$i] + [int]$input[$j])
        
        if($input -contains $remainder)
        {
            "{0} + {1} + {2} = {3}" -f $input[$i],$input[$j],$remainder,([int]$input[$i] + [int]$input[$j] + [int]$remainder)
            "{0} * {1} * {2} = {3}" -f $input[$i],$input[$j],$remainder,([int]$input[$i] * [int]$input[$j] * [int]$remainder)       
        }
    }
}