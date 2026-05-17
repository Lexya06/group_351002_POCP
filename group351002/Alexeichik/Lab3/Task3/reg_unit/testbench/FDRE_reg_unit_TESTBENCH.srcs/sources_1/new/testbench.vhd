----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2026 19:16:06
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
constant N: natural:= 34;
signal CLK, RST, EN:  std_logic;
signal Dout: std_logic_vector(N-1 downto 0);
constant T: time := 5 ns;
constant width: integer := 4;
type input_array is array (0 to width-1) of std_logic_vector(2 downto 0);
signal in_signal_control: input_array := 
(
    "001", 
    "111", 
    "010", 
    "101"  
);
signal Din:std_logic_vector(N-1 downto 0) := "1001001100111010010011001110100000";
begin
  FDRE_reg_unit_elem: FDRE_reg_unit generic map(N => N) port map(
      CLK => CLK, 
      RST => RST, 
      EN => EN,
      Din => Din,
      Dout => Dout
      );
   Test: process
     begin
       for i in 0 to width-1 loop
         CLK <= in_signal_control(i)(2);
         RST <= in_signal_control(i)(1);
         EN <= in_signal_control(i)(0);
         wait for T;      
       end loop;
       report "End of simulation" severity failure;
   end process;   
  

end Behavioral;
