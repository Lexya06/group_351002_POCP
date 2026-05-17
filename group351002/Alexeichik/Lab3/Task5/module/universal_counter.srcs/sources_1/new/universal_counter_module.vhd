----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 15:59:40
-- Design Name: 
-- Module Name: universal_counter_module - Behavioral
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

entity universal_counter_module is
--  Port ( );
    Port(
      CLK, CLR, EN, LOAD: in std_logic;
      MODE: in std_logic_vector(1 downto 0);
      Din: in std_logic_vector(10 downto 0);
      Dout: out std_logic_vector(10 downto 0)
    );    
end universal_counter_module;

architecture Behavioral of universal_counter_module is
signal visible_clk: std_logic;
begin
  freq_div_behav_elem: freq_div_behav generic map (K => 50000000) port map (
  CLK => CLK, EN => '1', RST => '0', Q => visible_clk);
  universal_counter_elem: universal_counter generic map (N => 11) port map 
    (CLK => visible_clk, CLR => CLR, EN => EN, LOAD => LOAD, MODE => MODE, Din => Din, Dout => Dout);

end Behavioral;
