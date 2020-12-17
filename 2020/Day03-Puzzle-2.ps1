<#

Advent of Code - http://adventofcode.com
2020 - Day 3 - Puzzle 2

Same approach as the Puzzle 1. However, now we have to calculate tree 
for multiple slopes. so an outer loop is introduced to loops through
and array of sloped. 

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

$alltrees = @()

$slopes = @(
    [pscustomobject]@{"right" = 1; "down" = 1},
    [pscustomobject]@{"right" = 3; "down" = 1},
    [pscustomobject]@{"right" = 5; "down" = 1},
    [pscustomobject]@{"right" = 7; "down" = 1},
    [pscustomobject]@{"right" = 1; "down" = 2}
)


foreach($slope in $slopes)
{
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

        #"right: $right  down: $down  ($x,$y)  :: $($input[$down][$right])"
    } while($y -lt $end)

    $alltrees += $trees 
    "Slope =  R$($slope.right) D$($slope.down)    Trees =  $trees"
}

$product = $alltrees[0]
for($i =1; $i -lt $alltrees.Length; $i++)
{
    $product = $product * $alltrees[$i]
}

"Answer: $($product)"