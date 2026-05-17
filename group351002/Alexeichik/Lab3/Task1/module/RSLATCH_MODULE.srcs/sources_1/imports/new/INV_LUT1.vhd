----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 23:53:59
-- Design Name: 
-- Module Name: INV_LUT1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity INV_LUT1 is
--  Port ( );
    Port (
        i: in std_logic;
        o: out std_logic
    );
end INV_LUT1;

architecture Behavioral of INV_LUT1 is

begin
    inv_lut1_elem: LUT1 generic map(init => "01") port map(I0 => i, o => o);
end Behavioral;
