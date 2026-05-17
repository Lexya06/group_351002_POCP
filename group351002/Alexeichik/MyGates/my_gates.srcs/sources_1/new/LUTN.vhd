----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 23:33:12
-- Design Name: 
-- Module Name: LUTN - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUTN is
--  Port ( );
    Generic(
        N:integer range 1 to 32 := 1
    );
    Port (
        x: in std_logic_vector(N-1 downto 0);
        table: in std_logic_vector(0 to 2**N-1);
        o: out std_logic
    );
end LUTN;

architecture Behavioral of LUTN is
signal pos: integer range table'range;
begin
    pos <= TO_INTEGER(UNSIGNED(x));
    o <= table(pos);   
end Behavioral;
