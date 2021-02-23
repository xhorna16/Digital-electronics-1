# Digital-electronics-1
# 1) Repository link
https://github.com/xhorna16/Digital-electronics-1
# 2)
c | b | a | f (c, b, a)
--|---|---|------------
0 | 0 | 0 | 1
0 | 0 | 1 | 1
0 | 1 | 0 | 0
0 | 1 | 1 | 0
1 | 0 | 0 | 0
1 | 0 | 1 | 1
1 | 1 | 0 | 0
1 | 1 | 1 | 0

## design.vhdl
```vhdl
library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a    : in  std_logic;         -- Data input
        b    : in  std_logic;         -- Data input
        c    : in  std_logic;         -- Data input
        for_o  : out std_logic;         -- OR output function
        fand_o : out std_logic;         -- AND output function
        fda1 : out std_logic;           -- distributive laws
        fda2 : out std_logic;
        fdb1 : out std_logic;
        fdb2 : out std_logic
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    fand_o <= not (((not (a) and (not b))) and (not((not c) and (not b))));
    for_o <= (not (not a) or b) or (not (b or c));
    fda1 <= (a and b) or (a and c);
    fda2 <= a and (b or c);
    fdb1 <= (a or b) and (a or c);
    fdb2 <= a or (b and c);

end architecture dataflow;
```
```text
EDA:
```
https://www.edaplayground.com/x/qQuT
```text
Image
```
https://github.com/xhorna16/Digital-electronics-1/blob/main/Labs/01-gates/and-or.jpg
# 3)
```text
x=a, y=b, z=c
Image:
```
https://github.com/xhorna16/Digital-electronics-1/blob/main/Labs/01-gates/distr.jpg

# 02 K-maps
## Table

Dec. eq. | B[1:0] | A [1:0] | B > A | B = A | B < A |
-------- | ------ | ------- | ----- | ----- | ----- |
0        | 00     | 00      | 0     | 1     | 0     |
1        | 00     | 01      | 0     | 0     | 1     |
2        | 00     | 10      | 0     | 0     | 1     |
3        | 00     | 11      | 0     | 0     | 1     |
4        | 01     | 00      | 1     | 0     | 0     |
5        | 01     | 01      | 1     | 1     | 0     |
6        | 01     | 10      | 0     | 0     | 1     |
7        | 01     | 11      | 0     | 0     | 1     |
8        | 10     | 00      | 1     | 0     | 0     |
9        | 10     | 01      | 1     | 0     | 0     |
10       | 10     | 10      | 0     | 1     | 0     |
11       | 10     | 11      | 0     | 0     | 1     |
12       | 11     | 00      | 1     | 0     | 0     |
13       | 11     | 01      | 1     | 0     | 0     |
14       | 11     | 10      | 1     | 0     | 0     |
15       | 11     | 11      | 0     | 1     | 0     |

## K-maps
### Equals
