----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2021 14:47:57
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
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

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is
    constant o_CLK_100MHz_PERIOD : time := 10ns;
        
        signal s_clk   : std_logic;
        signal s_j     : std_logic;
        signal s_k     : std_logic;
        signal s_rst  : std_logic;
        signal s_q     : std_logic;
        signal s_q_bar : std_logic;
begin
    uut_jk_ff_rst : entity work.jk_ff_rst
        port map(
            clk    => s_clk,
            j     => s_j,
            k     => s_k,
            rst  => s_rst,
            q     => s_q,
            q_bar => s_q_bar
        );

    p_clk_gen : process
        begin
        while now < 750 ns loop
            s_clk <= '0';
            wait for o_CLK_100MHz_PERIOD / 2;
            s_clk <= '1';
            wait for o_CLK_100MHz_PERIOD / 2;
        end loop;
        wait;
        end process p_clk_gen;
        
        p_reset_gen : process
        begin
            s_rst <= '0';
            wait for 20 ns;
            
            s_rst <= '1';
            wait for 155 ns;
            
            s_rst <= '0';
            wait;
        end process p_reset_gen;
        p_stimulus : process
        begin
            -- Report a note at the beginning of stimulus process
            report "Stimulus process started" severity note;

            s_j  <= '0'; --1
            s_k  <= '0';
            wait for 26 ns;
            s_j  <= '1';
            s_k  <= '0';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 24 ns;
            s_j  <= '0';
            s_k  <= '1';
            wait for 22 ns;
            s_j  <= '1';
            s_k  <= '1';
            wait for 14 ns;
            s_j  <= '0'; --1
            s_k  <= '0';
            wait for 26 ns;
            
            s_j  <= '0'; --2
            s_k  <= '0';
            wait for 26 ns;
            s_j  <= '1';
            s_k  <= '0';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 24 ns;
            s_j  <= '0';
            s_k  <= '1';
            wait for 22 ns;
            s_j  <= '1';
            s_k  <= '1';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 26 ns;
            
            s_j  <= '0'; --3
            s_k  <= '0';
            wait for 26 ns;
            s_j  <= '1';
            s_k  <= '0';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 24 ns;
            s_j  <= '0';
            s_k  <= '1';
            wait for 22 ns;
            s_j  <= '1';
            s_k  <= '1';
            wait for 14 ns;
            s_j  <= '0'; 
            s_k  <= '0';
            wait for 26 ns;
            
            s_j  <= '0'; --4
            s_k  <= '0';
            wait for 26 ns;
            s_j  <= '1';
            s_k  <= '0';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 24 ns;
            s_j  <= '0';
            s_k  <= '1';
            wait for 22 ns;
            s_j  <= '1';
            s_k  <= '1';
            wait for 14 ns;
            s_j  <= '0';
            s_k  <= '0';
            wait for 26 ns;
;
            report "Stimulus process finished" severity note;
            wait;
        end process p_stimulus;    
end Behavioral;
