----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2026 00:07:09
-- Design Name: 
-- Module Name: BISTABLE_INVS - Behavioral
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

entity BISTABLE_INVS is
--  Port ( );
    Port(
        Q: out std_logic
    );
end BISTABLE_INVS;

architecture Behavioral of BISTABLE_INVS is
signal internal, internaln: std_logic;
attribute DONT_TOUCH : string;
attribute DONT_TOUCH of internal, internaln: signal is "true";

begin
    INV1_INV_LUT1: entity my_gateslib.INV_LUT1 port map(i => internal, o => internaln);
    INV2_INV_LUT1: entity my_gateslib.INV_LUT1 port map(i => internaln, o => internal);
    Q <= internal;
end Behavioral;
