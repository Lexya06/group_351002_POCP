----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2026 18:41:38
-- Design Name: 
-- Module Name: DFFAR_reg_unit_module - Behavioral
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

entity FDRE_reg_unit_module is
--  Port ( );
    Port (
      CLK, RST, EN: in std_logic;
      SW: in std_logic_vector(13 downto 0);
      LED: out std_logic_vector(13 downto 0)
    );
end FDRE_reg_unit_module;

architecture Behavioral of FDRE_reg_unit_module is
constant N: natural:= 14;
begin
  FDRE_reg_unit_elem: FDRE_reg_unit generic map (N => N)
    port map (CLK => CLK, RST => RST, EN => EN, Din => SW, Dout => LED);
end Behavioral;
