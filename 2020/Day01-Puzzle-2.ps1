﻿<#

Advent of Code - http://adventofcode.com
2020 - Day 1 - Puzzle 2

Similar to Day 1 Puzzle 1, but need a nested loop. The approach to check the array
for remainder in the array still works. 


Author: Nasir Zubair

#>

#region input
$input = "";

$input = @"
1150
1579
1361
1319
1201
1253
1806
1783
1164
1772
1920
1428
1918
245
1504
1952
1057
1977
704
1119
1971
1200
1650
1795
1877
1932
1811
1981
1803
1366
1580
1986
1976
1063
1895
1143
1991
1061
1855
1947
1134
1800
1898
1778
1964
1949
1103
1770
1321
2005
1758
1181
1140
1873
1946
1540
1909
1710
1705
1313
1196
1084
1870
1610
1708
1810
1133
1375
1264
1921
1624
41
1899
1226
1757
1978
1485
1385
1526
1653
1130
1223
1577
1912
1894
276
954
1269
1769
1924
93
1165
1812
1092
1402
1284
1903
1884
1581
1887
1963
1983
1233
1445
1974
1956
1691
1954
2000
1469
1875
955
1334
1116
1700
1818
1790
1704
1901
1072
1848
1990
1724
1719
1638
1311
1474
1837
1801
1929
1791
1317
1643
1632
1813
1488
1129
1998
1771
1793
1074
1826
1935
1462
1230
1797
1878
1751
1993
1437
1967
1844
1438
1969
1175
1823
1124
1922
154
936
1117
1145
1308
1320
1767
1850
1809
1350
1820
1082
1597
1913
1766
1701
1294
1556
2006
1480
1953
1104
1861
1966
1248
1671
1955
1863
1202
1356
1842
2010
1288
1067
1576
1295
1760
1888
1639
1282
1633
1619
"@ -split "\n|\r\n"
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