<#

Advent of Code - http://adventofcode.com
2016 - Day 1 - Puzzle 1

This was straight forward. I originally started nested IFs inside the SWITCH/Case 
for $directions. Simplified the $direction calculation after a discussion with 
Rich Prescott (https://github.com/RichPrescott).

Author: Nasir Zubair

#>


$input = "R5, R4, R2, L3, R1, R1, L4, L5, R3, L1, L1, R4, L2, R1, R4, R4, L2, L2, R4, L4, R1, R3, L3, L1, L2, R1, R5, L5, L1, L1, R3, R5, L1, R4, L5, R5, R1, L185, R4, L1, R51, R3, L2, R78, R1, L4, R188, R1, L5, R5, R2, R3, L5, R3, R4, L1, R2, R2, L4, L4, L5, R5, R4, L4, R2, L5, R2, L1, L4, R4, L4, R2, L3, L4, R2, L3, R3, R2, L2, L3, R4, R3, R1, L4, L2, L5, R4, R4, L1, R1, L5, L1, R3, R1, L2, R1, R1, R3, L4, L1, L3, R2, R4, R2, L2, R1, L5, R3, L3, R3, L1, R4, L3, L3, R4, L2, L1, L3, R2, R3, L2, L1, R4, L3, L5, L2, L4, R1, L4, L4, R3, R5, L4, L1, L1, R4, L2, R5, R1, R1, R2, R1, R5, L1, L3, L5, R2";

$steps = $input -split ",\s+"

# starting position is 0,0 facing North.
$x = 0;
$y = 0;
$direction = 0

# for reference.
$directions = @{ 0 = "North"; 1 = "East"; 2 = "South"; 3 = "West" }


# starting position
"START : {0},{1} {2}" -f $x,$y,$directions[$direction]

$steps | ForEach-Object { 

    # Right or Left turn (R or L)
    $turn = $_[0]

    # number of blocks to move after turning.
    [int]$moves = $_.Substring(1)

    # determine the new direction based on the $turn 
    switch($turn)
    {
        'R' { $direction = ($direction+1)%4; }
        'L' { $direction = ($direction-1); if($direction -lt 0) { $direction = 3; } }
    }

    # move based on the new direction
    switch($direction)
    {
        0 { $y += $moves }
        1 { $x += $moves }
        2 { $y -= $moves }
        3 { $x -= $moves }
    }

    # output the current step, new block we're on 
    # and the new direction.
    "{0,-5} : {1},{2}  {3}" -f $_,$x,$y,$directions[$direction]
}

"`nBlock distance between start and end points: {0}" -f ([Math]::Abs($x)+[Math]::Abs($y))