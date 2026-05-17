----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2026 23:51:04
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
signal CLK: std_logic;
signal CLR, D: std_logic;
signal Q: std_logic;
constant T: time := 5 ns;
constant width: integer := 8;
type input_array is array (0 to width-1) of std_logic_vector(2 downto 0);
signal in_signal: input_array := 
(
    "010",
    "011",
    "000",
    "001",
    "010",
    "011",
    "110",
    "111"
);


begin
    DFFAR_ELEM: DFFAR port map (CLR_N => CLR, D => D, CLK => CLK, Q => Q);
    Test: process
     begin
         wait for T;
         for i in 0 to width-1 loop
             CLR <= in_signal(i)(0); 
             D <= in_signal(i)(1);
             CLK <= in_signal(i)(2);
             wait for T;      
         end loop;
         report "End of simulation" severity failure;
     end process;   
end Behavioral;
