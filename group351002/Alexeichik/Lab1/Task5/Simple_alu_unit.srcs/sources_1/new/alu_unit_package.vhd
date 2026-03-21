----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2026 09:55:25
-- Design Name: 
-- Module Name: alu_unit_package - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_unit_package is
--  Port ( );
    Port (
        SW: in std_logic_vector(15 downto 0);
        LED: out std_logic_vector(5 downto 0)
    );
end alu_unit_package;

architecture Behavioral of alu_unit_package is

begin
   with SW(3 downto 0) select LED <=
            SW(15 downto 10) OR SW(9 downto 4) when "0001",
            SW(15 downto 10) AND SW(9 downto 4) when "0010",
            std_logic_vector(unsigned(SW(15 downto 10)) + unsigned(SW(9 downto 4))) when "0100",
            SW(15 downto 10) NAND SW(9 downto 4) when "1000",
            (others => '0') when others;

end Behavioral;
