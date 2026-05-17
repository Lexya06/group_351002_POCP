----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 22:03:49
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
use my_gateslib.MY_COMPONENTS.ALL;
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
constant N: natural := 8;
constant fill_width: natural := 5;
type input_fill_array is array (0 to fill_width-1) of std_logic_vector(N-1 downto 0);
constant in_fill: input_fill_array := 
(
   "00000000",
   "01000000",
   "10000000",
   "11000000",
   "11111111"
);
constant control_width: natural := 3;
type input_control_array is array (0 to control_width-1) of std_logic_vector(1 downto 0);
signal in_control: input_control_array := 
(
   "10",
   "10",
   "10"
);
signal EN, CLR: std_logic;
type output_control_array is array (0 to fill_width-1) of std_logic;
signal Q: output_control_array;
begin
  CLK <= not CLK after tdiv2;
  pwms: for j in 0 to fill_width-1 generate
    pwm_elem: pwm generic map(CNT_WIDTH => N) port map
       (CLK => CLK, CLR => CLR, EN =>EN, FILL => in_fill(j), Q => Q(j));
  end generate;
  Test: process
  begin
    for i in 0 to control_width-1 loop
      CLR <= in_control(i)(0);
      EN <= in_control(i)(1);
      wait for 0.75 * t;
    end loop;
  end process;
end Behavioral;
