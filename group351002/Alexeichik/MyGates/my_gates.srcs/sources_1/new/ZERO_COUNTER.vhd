----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2026 15:19:22
-- Design Name: 
-- Module Name: ZERO_COUNTER - Behavioral
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

entity ZERO_COUNTER is
--  Port ( );
    Port (
        x, cmp_bit, cin: in std_logic;
        o, cout: out std_logic
    );
end ZERO_COUNTER;

architecture Behavioral of ZERO_COUNTER is
signal new_res: std_logic;
begin
    counter: entity my_gateslib.ADD port map (
        i1 => x,
        i2 => '1',
        cin => cin,
        cout => cout,
        o => new_res
    );
    
    filter: entity my_gateslib.MUX2 port map (
        i1 => new_res,
        i2 => x,
        s => cmp_bit,
        o => o
    );   

end Behavioral;
