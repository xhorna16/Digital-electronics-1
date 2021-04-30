# Digital-electronics-1
https://github.com/xhorna16/Digital-electronics-1
# Labs-02
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
https://github.com/xhorna16/Digital-electronics-1/blob/main/karnaugh.jpg
## Binary comparator VHDL
https://www.edaplayground.com/x/8Ud5

## 4-bit comparator VHDL
### architecture
```vhdl
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------------------
entity comparator_2bit is
    port(
        a_i           : in  std_logic_vector(4 - 1 downto 0);
		b_i           : in  std_logic_vector(4 - 1 downto 0);
		B_greater_A_o : out std_logic;      -- B > A
        B_equals_A_o  : out std_logic;      -- B = A
        B_less_A_o    : out std_logic       -- B < A
    );
end entity comparator_2bit;

------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of comparator_2bit is
begin
    B_less_A_o    <= '1' when (b_i < a_i) else '0';
	B_equals_A_o  <= '1' when (b_i = a_i) else '0';
    B_greater_A_o <= '1' when (b_i > a_i) else '0';
end architecture Behavioral;
```
### testbench - stimulus
```vhdl
 p_stimulus : process
    begin
    	report "Stimulus process started" severity note;


        -- First test values
        s_b <= "0000"; s_a <= "0100"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0100" severity error;
        
        
        s_b <= "1010"; s_a <= "1101"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 1010, 1101" severity error;

		s_b <= "0101"; s_a <= "1011"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0101, 1011" severity error;

		s_b <= "0010"; s_a <= "1001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0010, 1001" severity error;

		s_b <= "1111"; s_a <= "1111"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1111, 1111" severity error;

		s_b <= "1101"; s_a <= "1010"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1101, 1010" severity error;

		s_b <= "0111"; s_a <= "1000"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test failed for input combination: 0111, 1000" severity error;

		s_b <= "0110"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 0110, 0001" severity error;

		s_b <= "1001"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1001, 0001" severity error;
        
        s_b <= "1101"; s_a <= "1001"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test failed for input combination: 1101, 1001" severity error;

		--s_b <= "1110"; s_a <= "1110"; wait for 100 ns; --intentional error
        --assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        --report "Test failed for input combination: 1110, 1110" severity error;




        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### console output, without error and with an error
```
[2021-02-23 17:05:18 EST] ghdl -i design.vhd testbench.vhd  && ghdl -m  tb_comparator_2bit && ghdl -r  tb_comparator_2bit   --vcd=dump.vcd && sed -i 's/^U/X/g; s/^-/X/g; s/^H/1/g; s/^L/0/g' dump.vcd 
analyze design.vhd
analyze testbench.vhd
elaborate tb_comparator_2bit
testbench.vhd:50:8:@0ms:(report note): Stimulus process started
testbench.vhd:105:9:@1us:(report note): Stimulus process finished
Finding VCD file...
./dump.vcd
[2021-02-23 17:05:19 EST] Opening EPWave...
Done
--------------
[2021-02-23 17:04:28 EST] ghdl -i design.vhd testbench.vhd  && ghdl -m  tb_comparator_2bit && ghdl -r  tb_comparator_2bit   --vcd=dump.vcd && sed -i 's/^U/X/g; s/^-/X/g; s/^H/1/g; s/^L/0/g' dump.vcd 
analyze design.vhd
analyze testbench.vhd
elaborate tb_comparator_2bit
testbench.vhd:50:8:@0ms:(report note): Stimulus process started
testbench.vhd:98:9:@1100ns:(assertion error): Test failed for input combination: 1110, 1110
testbench.vhd:105:9:@1100ns:(report note): Stimulus process finished
Finding VCD file...
./dump.vcd
[2021-02-23 17:04:29 EST] Opening EPWave...
Done
```
### Link
https://www.edaplayground.com/x/r9Ud
| Vzdálenost [cm] | Počet LED |
|:-:|:-:|
| nad 400 | 0 | 
| 150 až 400 |  1 |
| 100 až 150 |  2 |
|  80 až 100 |  3 |
|  70 až  80 |  4 |
|  60 až  70 |  5 |
|  50 až  60 |  6 |
|  40 až  50 |  7 |
|  35 až  40 |  8 |
|  30 až  35 |  9 |
|    pod  30 | 10 |
