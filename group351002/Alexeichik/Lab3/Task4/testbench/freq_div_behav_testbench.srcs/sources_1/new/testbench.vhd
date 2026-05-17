----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 22:36:05
-- Design Name: 
-- Module Name: testbench - Behavioral
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

library my_gateslib;
use my_gateslib.MY_COMPONENTS.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
signal clk: std_logic := '0';
constant freq:real:=100.0e6;
constant t:time:= 1.0 sec / freq;
constant tdiv2:time:=t/2;
constant k_width: integer := 3;
constant control_width: integer := 3;
type input_k_array is array (0 to k_width-1) of natural;
constant in_k: input_k_array := 
(
   4,
   10,
   100
);
type input_control_array is array (0 to control_width-1) of std_logic_vector(1 downto 0);
signal in_control: input_control_array := 
(
   "10",
   "00",
   "10"
);
type data_array is array (0 to k_width-1) of std_logic;
signal EN, RST: std_logic;
signal Q: data_array;
begin
  
  freq_div_behav_elems: for i in 0 to k_width-1 generate
  freq_div_behav_elem: freq_div_behav generic map (K => in_k(i)) port map
    (CLK => CLK, EN => EN, Q => Q(i), RST => RST);
  end generate;
  clk <= not clk after tdiv2;
  Test: process
  begin
    for i in 0 to control_width-1 loop 
      EN <= in_control(i)(1);
      RST <= in_control(i)(0);
      wait for 0.75 * t;
    end loop;
    
  end process;
  
end Behavioral;
