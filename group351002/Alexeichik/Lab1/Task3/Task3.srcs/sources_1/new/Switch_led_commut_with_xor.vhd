----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2026 17:48:51
-- Design Name: 
-- Module Name: Switch_led_commut_with_xor - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity Switch_led_commut_with_xor is
--  Port ( );
    Port (
        SW: in std_logic_vector(15 downto 0);
        LED: out std_logic_vector(15 downto 0)
    );
end Switch_led_commut_with_xor;

architecture Behavioral of Switch_led_commut_with_xor is
begin
-- sw_i >= x"CE"
-- I >= x"B1"
-- J >= x"80"
    LED <= SW and x"00B1";

end Behavioral;
