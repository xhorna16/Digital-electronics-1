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
https://github.com/xhorna16/Digital-electronics-1/blob/main/and-or.jpg
# 3)
```text
x=a, y=b, z=c
Image:
```
https://github.com/xhorna16/Digital-electronics-1/blob/main/distr.jpg
