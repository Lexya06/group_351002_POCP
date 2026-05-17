----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 16:17:24
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
signal CLK: std_logic :='0';
signal CLR, EN, LOAD: std_logic;
constant freq:real:=100.0e6;
constant t:time:= 1.0 sec / freq;
constant tdiv2:time:=t/2;
constant mode_width: integer := 4;
constant N: natural := 11;
constant control_width: integer := N;
type input_mode_array is array (0 to mode_width-1) of std_logic_vector(1 downto 0);
signal in_mode: input_mode_array := 
(
   "00", --прямой счет
   "01", --счет до n-2
   "10", --параллельная загрузка
   "11" --хранение
);
type input_control_array is array (0 to control_width-1) of std_logic_vector(2 downto 0);
signal in_control: input_control_array := 
(
   "010", 
   "010",
   "010",
   "010",
   "010",
   "010",
   "010",
   "010",
   "010",
   "010",
   "010"
);
type output_control_array is array (0 to control_width-1) of std_logic;
type output_data_array is array (0 to mode_width-1) of std_logic_vector(N-1 downto 0);
signal Din: output_data_array :=
(
  "00000000111",
  "00000000111",
  "00000000111",
  "00000000111"
);
signal Dout: output_data_array;
begin
  CLK <= not CLK after tdiv2;
  counters: for j in 0 to mode_width-1 generate
    universal_counter_elem: universal_counter generic map(N => N) port map
       (CLK => CLK, CLR => CLR, EN =>EN, LOAD => LOAD,  MODE => in_mode(j),
        Din => Din(j), Dout => Dout(j));
  end generate;
  Test: process
  begin
    for i in 0 to control_width-1 loop
      CLR <= in_control(i)(2);
      EN <= in_control(i)(1);
      LOAD <= in_control(i)(0);
      wait for 0.75 * t;
    end loop;
  end process;
end Behavioral;
