----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2021 19:20:44
-- Design Name: 
-- Module Name: tb_t_ff_rst - Behavioral
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

entity tb_t_ff_rst is
--  Port ( );
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is
    constant o_CLK_100MHz_PERIOD : time := 10ns;
        
        signal s_clk   : std_logic;
        signal s_t     : std_logic;
        signal s_rst  : std_logic;
        signal s_q     : std_logic;
        signal s_q_bar : std_logic;
begin
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk    => s_clk,
            t     => s_t,
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
            wait for 10 ns;
            
            s_rst <= '1';
            wait for 10 ns;
            
            s_rst <= '0';
            wait;
        end process p_reset_gen;
        p_stimulus : process
        begin
            -- Report a note at the beginning of stimulus process
            report "Stimulus process started" severity note;
            s_t  <= '1';
            wait for 26 ns;
            s_t  <= '0';
            wait for 14 ns;
            s_t  <= '1';
            wait for 24 ns;
            s_t  <= '0';
            wait for 22 ns;
            s_t  <= '1';
            wait for 14 ns;
            s_t  <= '0';
            wait for 26 ns;         
            s_t  <= '1';
            wait;
            report "Stimulus process finished" severity note;
            wait;
        end process p_stimulus;    
end Behavioral;
