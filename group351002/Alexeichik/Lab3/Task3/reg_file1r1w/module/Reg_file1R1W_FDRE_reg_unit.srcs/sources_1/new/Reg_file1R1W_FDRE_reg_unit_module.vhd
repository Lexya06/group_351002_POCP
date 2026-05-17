----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 10:49:10
-- Design Name: 
-- Module Name: Reg_file1R1W_FDRE_reg_unit_module - Behavioral
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

entity Reg_file1R1W_FDRE_reg_unit_module is
--  Port ( );
    Port (
      INIT, WE, nO, CLK: in std_logic;
      WDP: in std_logic_vector(5 downto 0);
      RDP:out std_logic_vector(5 downto 0);
      RA, WA: in std_logic_vector(2 downto 0)
    );
end Reg_file1R1W_FDRE_reg_unit_module;

architecture Behavioral of Reg_file1R1W_FDRE_reg_unit_module is

begin
  Reg_file1R1W_FDRE_reg_unit_elem: Reg_file1R1W_FDRE_reg_unit generic map (N => 6, M => 8) port map (
    INIT => INIT, WE => WE, nO => nO, CLK => CLK, 
    WDP => WDP, RDP => RDP, RA => RA, WA => WA);

end Behavioral;
