----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2026 12:12:12
-- Design Name: 
-- Module Name: transform_to_berger_from_7421bcd - Behavioral
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
use work.CODE_TRANSFORM.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transform_to_berger_from_7421bcd is
--  Port ( );
    Port (
        SW: in std_logic_vector(15 downto 0);
        LED: out std_logic_vector(15 downto 0)
    );
end transform_to_berger_from_7421bcd;

architecture Behavioral of transform_to_berger_from_7421bcd is

begin
    LED <= transform_7421bcd_to_berger(SW);
end Behavioral;
