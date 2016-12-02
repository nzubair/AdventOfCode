<#

Advent of Code - http://adventofcode.com
2016 - Day 1 - Puzzle 1

This was a bit more involved. Since we needed to find which block we had visited, we need to 
keep track of every block we have passed through, not just the jumps from one step to the next.

Therefore, several variables are introduced to see where we were, where we're going, and where 
we've been in the past.


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

# in order to keep track of blocks we've visited.
$blocks = @{}

# starting position
"START : {0},{1} {2}" -f $x,$y,$directions[$direction]

$steps | ForEach-Object { 

    # Right or Left turn (R or L)
    $turn = $_[0]

    # number of blocks to move after turning.
    [int]$moves = $_.Substring(1)

    # these two will hold the next position.
    $nextX = $x
    $nextY = $y

    # these are used later when we record and examine visited blocks.
    $sx = 0
    $sy = 0

    # determine the new direction based on the $turn 
    switch($turn)
    {
        'R' { $direction = ($direction+1)%4; }
        'L' { $direction = ($direction-1); if($direction -lt 0) { $direction = 3; } }
    }
    
    switch($direction)
    {
        # for each direction, calculate appropriate axis. 
        # if we move along Y-axis, set $sy to 1.
        # if we move along X-axis, set $sx to 1.

        0 { $nextY = $y + $moves; $sy = 1;}
        1 { $nextX = $x + $moves; $sx = 1;}
        2 { $nextY = $y - $moves; $sy = 1;}
        3 { $nextX = $x - $moves; $sx = 1;}
    }
    
    # output the current step, next block we're going to visit.
    # and the new direction.
    "{0,-5} : {1},{2}  {3}" -f $_,$nextX,$nextY,$directions[$direction]

    <#
      - generate a list of all blocks between  $x,$y  and $nextX,$nextY coordinates
      - skip the first one (using $sx/$sy) because it's the same block where we stopped 
        for the last step.
      - if it's a new block, add to $blocks
      - if it's a block we've already visited, calculate and print the block distance between 0,0 and 
        that block.

        ** probably could've just used an array and -contains (instead of a hashtable)
    #>

    $x..$nextX | Select -Skip $sx | ForEach-Object { 
        $currX = $_
        $y..$nextY | Select -Skip $sy | ForEach-Object {  
            $currentBlock = "{0},{1}" -f $currX,$_
            "`tvisting: {0}" -f $currentBlock
            if($blocks.ContainsKey($currentBlock))
            {
                "VISITED ALREADY: {0}" -f $currentBlock
                "`nBlock Distance: {0}" -f ([Math]::Abs($currX)+[Math]::Abs($_))
                exit
            }
            else
            {
                $blocks.Add( $currentBlock, "");
            }
        }
    }
    
    # update current position x,y to be nextX,nextY
    $x = $nextX
    $y = $nextY
}