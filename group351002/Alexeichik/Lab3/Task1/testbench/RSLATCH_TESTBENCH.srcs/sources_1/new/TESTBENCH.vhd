----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2026 19:04:53
-- Design Name: 
-- Module Name: TESTBENCH - Behavioral
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

entity TESTBENCH is
--  Port ( );
end TESTBENCH;

architecture Behavioral of TESTBENCH is
signal R,S: std_logic;
signal Q, Qn: std_logic;
constant T: time := 5 ns;
constant width: integer := 7;
type input_array is array (0 to width-1) of std_logic_vector(1 downto 0);
signal in_signal: input_array := 
(
    "10",
    "01",
    "11",
    "00",
    "11",
    "11",
    "10"
);


begin
    RSLATCH_NAND_ELEM: RSLATCH_NAND port map (R => R, S => S, Q => Q, Qn => Qn);
    Test: process
     begin
       wait for T;
       for i in 0 to width-1 loop
           R <= in_signal(i)(0); 
           S <= in_signal(i)(1);
           wait for T;      
       end loop;
       report "End of simulation" severity failure;
     end process;   
end Behavioral;
