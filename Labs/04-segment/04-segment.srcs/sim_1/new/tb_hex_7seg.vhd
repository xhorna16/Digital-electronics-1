----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 20:19:02
-- Design Name: 
-- Module Name: tb_hex_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_hex_7seg is
--  Port ( );
end entity tb_hex_7seg;

architecture testbench of tb_hex_7seg is
        signal s_hex : std_logic_vector(3 downto 0);
        signal s_seg : std_logic_vector(6 downto 0);
    begin
    uut_hex_7seg : entity work.hex_7seg
        port map(
            hex_i           => s_hex,
            seg_o           => s_seg,
            seg_o (7) 
                );
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

end architecture testbench;
