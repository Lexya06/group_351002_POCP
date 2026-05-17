----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 13:11:44
-- Design Name: 
-- Module Name: CMP3 - Behavioral
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

library my_delay_gateslib;
use my_delay_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CMP3 is
--  Port ( );
    Port(
        SW: in std_logic_vector(5 downto 0);
        LED: out std_logic_vector(2 downto 0)
    );
end CMP3;

architecture Behavioral of CMP3 is

begin
    CMP3: entity my_delay_gateslib.CMPN generic map(N => 3) port map(in_num1 => SW(2 downto 0), in_num2 => SW(5 downto 3), out_res => LED);
end Behavioral;
