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

entity BISTABLE_CELL is
--  Port ( );
    Port(
        LED: out std_logic_vector(15 downto 0)
    );
   
end BISTABLE_CELL;

architecture Behavioral of BISTABLE_CELL is
attribute DONT_TOUCH: string;
begin
    BISTABLE_CELLS: for i in 0 to 15 generate
    attribute DONT_TOUCH of BISTABLE_CELL_INST: label is "true";
    begin 
        BISTABLE_CELL_INST: entity my_gateslib.bistable_invs port map (Q => LED(i));
    end generate;

end Behavioral;
