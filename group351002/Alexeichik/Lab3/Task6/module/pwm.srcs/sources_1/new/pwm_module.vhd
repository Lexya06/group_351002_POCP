----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 21:37:27
-- Design Name: 
-- Module Name: pwm_module - Behavioral
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

entity pwm_module is
--  Port ( );
    Port (
        CLK: in std_logic;
        CLR: in std_logic;
        EN: in std_logic;
        FILL: in std_logic_vector(13 downto 0);
        Q: out std_logic
    );
end pwm_module;

architecture Behavioral of pwm_module is
signal visible_clk: std_logic;
begin
  freq_div_behav_elem: freq_div_behav generic map (K => 200) port map
    (CLK => CLK, RST => CLR, EN => EN, Q => visible_clk);
  pwm_elem: pwm generic map (CNT_WIDTH => 14) port map
    (CLK => visible_clk, CLR => CLR, EN => EN, FILL => FILL, Q => Q);

end Behavioral;
