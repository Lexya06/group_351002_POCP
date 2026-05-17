----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2026 10:31:18
-- Design Name: 
-- Module Name: ADD - Behavioral
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

entity ADD is
--  Port ( );
    Port (
        i1, i2, cin: in std_logic;
        cout: out std_logic;
        o: out std_logic
    );
end ADD;

architecture Behavioral of ADD is
signal a_xor_b, inv_a_xor_b, a_and_b: std_logic;
begin
    
    mux_xorab: entity my_gateslib.MUX2XOR port map (
        i1 => i1,
        i2 => i2,
        o => a_xor_b
    );
    
    inv_xorab: entity my_gateslib.INV port map (
        i => a_xor_b,
        o => inv_a_xor_b
    );
    
  
    mux_addab:  entity my_gateslib.MUX2 port map (
        i1 => a_xor_b,
        i2 => inv_a_xor_b,
        s => cin,
        o => o
    );
    
    mux_andc: entity my_gateslib.MUX2AND port map (
        i1 => i1,
        i2 => i2,
        o => a_and_b
    );
    
    mux_xorc: entity my_gateslib.MUX2XOR port map (
        i1 => a_and_b,
        i2 => cin,
        o => cout
    );

end Behavioral;
