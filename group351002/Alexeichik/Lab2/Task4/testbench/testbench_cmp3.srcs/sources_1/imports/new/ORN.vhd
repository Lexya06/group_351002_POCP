----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2026 17:44:12
-- Design Name: 
-- Module Name: ORN - Behavioral
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

entity ORN is
--  Port ( );
    Generic (
       N:integer range 0 to 32 := 2;
       delay_or2: time := 10 ns
    );
    Port (
       x: in std_logic_vector(0 to N-1);
       o: out std_logic
    );
end ORN;

architecture Behavioral of ORN is
signal temp: std_logic_vector(0 to N-1);
begin
    temp(0) <= x(0);
    ORN: for i in 0 to N-2 generate
        OR2: entity my_delay_gateslib.MUX2OR generic map(delay_or2) port map (i1 => temp(i), i2 => x(i+1), o => temp(i+1));
    end generate;
    o <= temp(N-1);
end Behavioral;
