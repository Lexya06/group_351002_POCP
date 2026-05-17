----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 21:00:52
-- Design Name: 
-- Module Name: freq_div_behav_module - Behavioral
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

entity freq_div_behav_module is
--  Port ( );
    Port (
      CLK, RST, EN: in std_logic;
      Q: out std_logic
    );
end freq_div_behav_module;

architecture Behavioral of freq_div_behav_module is

begin
  freq_div_behav_elem: freq_div_behav generic map (K => 10) port map 
  (CLK => CLK, RST => RST, EN => EN, Q => Q);

end Behavioral;
