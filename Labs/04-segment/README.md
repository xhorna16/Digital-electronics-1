# 04-segment
https://github.com/xhorna16/Digital-electronics-1/tree/main/Labs/04-segment
## truthtable 1
Hex|Inputs|A|B|C|D|E|F|G
---|------|-|-|-|-|-|-|-
 0 | 0000 |0|0|0|0|0|0|1
 1 | 0001 |1|0|0|1|1|1|1
 2 | 0010 |0|0|1|0|0|1|0
 3 | 0011 |0|0|0|0|1|1|0
 4 | 0100 |1|0|0|1|1|0|0
 5 | 0101 |0|1|0|0|1|0|0
 6 | 0110 |0|1|0|0|0|0|0
 7 | 0111 |0|0|0|1|1|1|1
 8 | 1000 |0|0|0|0|0|0|0
 9 | 1001 |0|0|0|0|1|0|0
 A | 0111 |0|0|0|1|0|0|0
 B | 0111 |1|1|0|0|0|0|0
 C | 0111 |0|1|1|0|0|0|0
 D | 0111 |0|0|0|0|1|1|0
 E | 0111 |0|1|1|0|0|0|0
 F | 0111 |0|1|1|1|0|0|0|
 ![schem](n4r.png)
## architecture
```vhdl
architecture Behavioral of hex_7seg is
begin
    --------------------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common Anode)
    -- decoder. Any time "hex_i" is changed, the process is "executed".
    -- Output pin seg_o(6) controls segment A, seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        |  |  |   ...   segment G
    --        +-+|+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------------------
    p_7seg_decoder : process(hex_i) --zacne proces
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
            when "0001" =>
                seg_o <= "1001111";     -- 1
            when "0010" =>
                seg_o <= "0010010";     -- 2
            when "0011" =>
                seg_o <= "0000110";     -- 3
            when "0100" =>
                seg_o <= "1001100";     -- 4
            when "0101" =>
                seg_o <= "0100100";     -- 5
            when "0110" =>
                seg_o <= "0100000";     -- 6
            when "0111" =>
                seg_o <= "0001111";     -- 7
            when "1000" =>
                seg_o <= "0000000";     -- 8
            when "1001" =>
                seg_o <= "0000100";     -- 9
            when "1010" =>
                seg_o <= "0001000";     -- A 10
            when "1011" =>
                seg_o <= "1100000";     -- B 11
            when "1100" =>
                seg_o <= "0110000";     -- C 12
            when "1101" =>
                seg_o <= "0000110";     -- D 13    
            when "1110" =>
                seg_o <= "0110000";     -- E
            when others =>
                seg_o <= "0111000";     -- F
        end case;
    end process p_7seg_decoder; --az zde se prirazeni vykonaji, doposud byl "zastaven cas"
end architecture Behavioral;
```
## stimulus
```vhdl
p_stimulus : process
        begin
    report "Stimulus process started" severity note;
        s_hex <= "0000"; wait for 10 ns; --0
        assert (s_seg = "0000001")
        report "Test failed for input combination: 0" severity error;
     
        s_hex <= "0001"; wait for 10 ns; --1
        assert (s_seg = "1001111")
        report "Test failed for input combination: 1" severity error;
    
        s_hex <= "0010"; wait for 10 ns; --2
        assert (s_seg = "0010010")
        report "Test failed for input combination: 2" severity error;
    
        s_hex <= "0011"; wait for 10 ns; --3
        assert (s_seg = "0000110")
        report "Test failed for input combination: 3" severity error;
    
        s_hex <= "0100"; wait for 10 ns; --4
        assert (s_seg = "1001100")
        report "Test failed for input combination: 4" severity error;
    
        s_hex <= "0101"; wait for 10 ns; --5
        assert (s_seg = "0100100")
        report "Test failed for input combination: 5" severity error;
    
        s_hex <= "0110"; wait for 10 ns; --6
        assert (s_seg = "0100000")
        report "Test failed for input combination: 6" severity error;
    
        s_hex <= "0111"; wait for 10 ns; --7
        assert (s_seg = "0001111")
        report "Test failed for input combination: 7" severity error;
        
        s_hex <= "1000"; wait for 10 ns; --8
        assert (s_seg = "0000000")
        report "Test failed for input combination: 8" severity error;
    
        s_hex <= "1001"; wait for 10 ns; --9
        assert (s_seg = "0000100")
        report "Test failed for input combination: 9" severity error;
    
        s_hex <= "1010"; wait for 10 ns; --A
        assert (s_seg = "0001000")
        report "Test failed for input combination: A" severity error;
    
        s_hex <= "1011"; wait for 10 ns; --B
        assert (s_seg = "1100000")
        report "Test failed for input combination: B" severity error;
    
        s_hex <= "1100"; wait for 10 ns; --C
        assert (s_seg = "0110000")
        report "Test failed for input combination: C" severity error;
        
        s_hex <= "1101"; wait for 10 ns; --D
        assert (s_seg = "0000110")
        report "Test failed for input combination: D" severity error;
    
        s_hex <= "1110"; wait for 10 ns; --E
        assert (s_seg = "0110000")
        report "Test failed for input combination: E" severity error;
    
        s_hex <= "1111"; wait for 10 ns; --F
        assert (s_seg = "0111000")
        report "Test failed for input combination: F" severity error;
    
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
## waveforms

## top

## truthtable 2
