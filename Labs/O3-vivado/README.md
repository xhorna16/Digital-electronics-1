# 03-vivado
## Switches and LEDs
|Switch|Pin|
|------|---|
|a_i[0]|J15|
|a_i[1]|L16|
|b_i[0]|M13|
|b_i[1]|R15|
|c_i[0]|R17|
|c_i[1]|T18|
|d_i[0]|U18|
|d_i[1]|R13|
|sel_i[0]|U11|
|sel_i[1]|V10|
| LED  |Pin|
|f_o[0]|H17|
|f_o[1]|K15|
### Section of constraints file
```vhdl
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { a_i[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { a_i[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { b_i[0] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { b_i[1] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { c_i[0] }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { c_i[1] }]; #IO_L7N_T1_D10_14 Sch=sw[5]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { d_i[0] }]; #IO_L17N_T2_A13_D29_14 Sch=sw[6]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { d_i[1] }]; #IO_L5N_T0_D07_14 Sch=sw[7]
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { sel_i[0] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { sel_i[1] }]; #IO_L21P_T3_DQS_14 Sch=sw[15]
## LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { f_o[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { f_o[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
```
## Multiplexer
### architecture
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;
end architecture Behavioral;
```
### stimulus
```vhdl
p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_a <= "00"; s_b <= "10"; s_c <= "01"; s_d <= "00"; s_sel <= "00"; wait for 100 ns;
        assert (s_f = s_a)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "11"; s_c <= "01"; s_d <= "00"; s_sel <= "01"; wait for 100 ns;
        assert (s_f = s_b)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "10"; s_c <= "10"; s_d <= "00"; s_sel <= "10"; wait for 100 ns;
        assert (s_f = s_c)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "10"; s_c <= "01"; s_d <= "01"; s_sel <= "11"; wait for 100 ns;
        assert (s_f = s_d)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "10"; s_b <= "10"; s_c <= "01"; s_d <= "00"; s_sel <= "00"; wait for 100 ns;
        assert (s_f = s_a)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "11"; s_c <= "01"; s_d <= "00"; s_sel <= "01"; wait for 100 ns;
        assert (s_f = s_b)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "10"; s_c <= "01"; s_d <= "10"; s_sel <= "10"; wait for 100 ns;
        assert (s_f = s_c)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "11"; s_b <= "10"; s_c <= "01"; s_d <= "00"; s_sel <= "11"; wait for 100 ns;
        assert (s_f = s_d)
        report "Test failed for input combination: 00, 00" severity error;
        s_a <= "01"; s_b <= "10"; s_c <= "01"; s_d <= "00"; s_sel <= "00"; wait for 100 ns;
        assert (s_f = s_a)
        report "Test failed for input combination: 00, 00" severity error;
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### simulation results
![](pc3-graf)
## Tutorial
Vivado: File-Project-New, Create a new Vivado project, Next - Name and location - RTL Project, Next - Add Sources, Create File, type VHDL, File name, Target and Simulation language set to VHDL - Add constraints, Next - Default Part, Boards, Nexys A7-50T, Next - New Project Summary, Finish
