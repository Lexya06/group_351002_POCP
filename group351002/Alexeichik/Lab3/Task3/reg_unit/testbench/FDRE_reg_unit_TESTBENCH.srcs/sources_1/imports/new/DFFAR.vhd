----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2026 22:22:52
-- Design Name: 
-- Module Name: DFF - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFFAR is
--  Port ( );
    Port (
      CLK, CLR_N, D: in std_logic;
      Q: out std_logic
    );
end DFFAR;

architecture Behavioral of DFFAR is
signal store: std_logic;
begin
  process(CLK, CLR_N, D)
  begin
    if (CLR_N = '0') then
      store <= '0';
    elsif(rising_edge(CLK)) then 
      store <= D;
  end if;
  end process;
  Q <= store;
end Behavioral;
