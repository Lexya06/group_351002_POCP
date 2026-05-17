----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 21:08:08
-- Design Name: 
-- Module Name: MUX2AND - Behavioral
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
use my_gateslib.MY_COMPONENTS.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX2AND is
--  Port ( );
    Port (
        i1, i2: in std_logic;
        o: out std_logic    
    );    
end MUX2AND;

architecture Behavioral of MUX2AND is
  
begin
    mux: entity my_gateslib.MUX2 port map
        (
            i1 => i1,
            i2 => i2,
            s => i1,
            o => o
        );

end Behavioral;
