----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2026 17:12:26
-- Design Name: 
-- Module Name: MUX2 - Behavioral
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

entity MUX2 is
--  Port ( );
    Generic(
        delay: time := 10 ns
    );
    Port (
        i1, i2: in std_logic;
        s: in std_logic;
        o: out std_logic
    );
end MUX2;

architecture Behavioral of MUX2 is

begin
    o <= i1 after delay when s = '0' else i2 after delay;
end Behavioral;
