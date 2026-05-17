----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2026 18:47:16
-- Design Name: 
-- Module Name: RSLATCH_MODULE - Behavioral
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

entity RSLATCH_MODULE is
--  Port ( );
    Port (
        SW: in std_logic_vector(1 downto 0);
        Q: out std_logic_vector(1 downto 0)
    );
end RSLATCH_MODULE;

architecture Behavioral of RSLATCH_MODULE is
begin
    RSLATCH_NAND_elem: RSLATCH_NAND port map (S => SW(1), R => SW(0), Q => Q(1), Qn => Q(0));
end Behavioral;
