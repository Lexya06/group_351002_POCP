----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2026 11:17:50
-- Design Name: 
-- Module Name: Reg_file2R1W_FDCE_reg_unit_module - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_file2R1W_FDCE_reg_unit_module is
--  Port ( );
    Port (
      CLR, W_EN, CLK: in std_logic;
      W_DATA: in std_logic_vector(3 downto 0);
      R_DATA_0, R_DATA_1:out std_logic_vector(3 downto 0);
      R_ADDR_0, R_ADDR_1, W_ADDR: in std_logic_vector(2 downto 0)
    );
end Reg_file2R1W_FDCE_reg_unit_module;

architecture Behavioral of Reg_file2R1W_FDCE_reg_unit_module is

begin
  Reg_file2R1W_FDCE_reg_unit_elem: Reg_file2R1W_FDCE_reg_unit generic map (DATA_WIDTH => 4, ADDR_WIDTH => 3) 
  port map (CLR => CLR, W_EN => W_EN, CLK => CLK, W_DATA => W_DATA, R_ADDR_0 => R_ADDR_0, R_ADDR_1 => R_ADDR_1,
            W_ADDR => W_ADDR, R_DATA_0 => R_DATA_0, R_DATA_1 => R_DATA_1);     

end Behavioral;
