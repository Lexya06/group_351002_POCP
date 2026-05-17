----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2026 08:59:14
-- Design Name: 
-- Module Name: LUT2AND - Behavioral
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

entity LUT2AND is
--  Port ( );
    Port (
      i1, i2: in std_logic;
      o: out std_logic
    );
end LUT2AND;

architecture Behavioral of LUT2AND is

begin
  LUT2AND_elem: LUT2 generic map(INIT => "1000") port map( I0 => i1, I1 => i2, o => o);  

end Behavioral;
