----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2026 00:28:58
-- Design Name: 
-- Module Name: BISTABLE_CELL - Behavioral
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

entity SYNTHES_DLATCH is
--  Port ( );
    Port(
        LED: out std_logic_vector(0 downto 0);
        SW: in std_logic_vector(1 downto 0)
    );
end SYNTHES_DLATCH;

architecture Structural of SYNTHES_DLATCH is
begin
    DLATCH: entity my_gateslib.DLATCH port map (G => SW(1), D => SW(0), Q => LED(0));   
end Structural;
