<#

Advent of Code - http://adventofcode.com
2020 - Day 3 - Puzzle 1

The puzzle says that pattern repeats to the right, we don't actually need to extend 
the input by duplicating it. Instead, we can wrap around by calculating modulo (remainder)
of the current position and width. 

Author: Nasir Zubair

#>
#region input 
$Day = "03"
$InputFile = Join-Path $PSScriptRoot "Day$($Day)-input.txt"

if(-Not (Test-Path $InputFile)) 
{
    Write-Warning "Input file $($InputFile) not found."
    exit 1
}
$input = Get-Content -Path $InputFile
#endregion input

$width = ($input[0].Length)
$end = $input.Length - 1

$slope = [pscustomobject]@{"right" = 3; "down" = 1 }

$trees = 0;

# starting point
$x = $y = 0

do
{
    # take a step
    $x += $slope.right
    $y += $slope.down

    # check for tree
    $right = $x % $width
    $down = $y

    if(($input[$down][$right]) -eq "#") 
    {
         $trees++ 
    }

    $input[$down] = $news.ToString();

    "right: $right  down: $down  ($x,$y)  :: $($input[$down][$right])"
} while($y -lt $end)

"Trees: $trees"