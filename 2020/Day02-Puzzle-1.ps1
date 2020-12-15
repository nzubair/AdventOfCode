<#

Advent of Code - http://adventofcode.com
2020 - Day 2 - Puzzle 1

Fairly straight forward. After splitting the input string into parts,
count the given character in the password string. Then compare to see
if the number of character are within the range specified.

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
   
    $chars = $pwd -split "" | Where-Object { $_ -eq $char }
    $char_count = $chars.Length
      
    if($char_count -ge $position1 -and $char_count -le $position2)
    {
        $valid++
        "{0} `t valid ({1})" -f $_,$char_count
    }
    else
    {
        $invalid++
    }
} 

"Total   : $($input.Length)"
"Valid   : $($valid)"
"Invalid : $($invalid)" 