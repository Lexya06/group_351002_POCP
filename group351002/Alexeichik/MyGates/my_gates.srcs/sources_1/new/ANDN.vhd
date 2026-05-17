----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 19:43:07
-- Design Name: 
-- Module Name: ANDN - Behavioral
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

entity ANDN is
--  Port ( );
    generic(N:integer range 0 to 32 := 2);
    Port(
        x: in std_logic_vector(0 to N-1);
        o: out std_logic
    );
end ANDN;

architecture Behavioral of ANDN is
signal temp: std_logic_vector(0 to N-1);
begin
    temp(0) <= x(0);
    ANDN: for i in 0 to N-2 generate
        AND2: entity my_gateslib.MUX2AND port map (i1 => temp(i), i2 => x(i+1), o => temp(i+1));
    end generate;
    o <= temp(N-1);
end Behavioral;
