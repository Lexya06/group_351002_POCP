----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2026 23:10:30
-- Design Name: 
-- Module Name: DFFAR_MODULE - Behavioral
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

entity DFFAR_MODULE is
--  Port ( );
    Port (
      CLK: in std_logic;
      SW: in std_logic_vector(1 downto 0);
      LED: out std_logic
    );
end DFFAR_MODULE;

architecture Behavioral of DFFAR_MODULE is
begin
  DFFAR_elem: DFFAR port map (CLK => CLK, CLR_N => SW(1), D => SW(0), Q => LED);
end Behavioral;
