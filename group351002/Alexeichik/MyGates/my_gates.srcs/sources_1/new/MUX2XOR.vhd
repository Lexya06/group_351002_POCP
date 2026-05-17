----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 22:45:43
-- Design Name: 
-- Module Name: MUX2XOR - Behavioral
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

entity MUX2XOR is
--  Port ( );
    Generic (
        delay_inv: time := 5 ns;
        delay_mux: time := 10 ns
    );
    Port (
        i1, i2: in std_logic;
        o: out std_logic
    );
end MUX2XOR;

architecture Behavioral of MUX2XOR is
signal inv_i2: std_logic;
begin
    inv: entity my_gateslib.INV port map (
        i => i2,
        o => inv_i2
    );
    mux: entity my_gateslib.MUX2 port map (
        i1 => i2,
        i2 => inv_i2,
        s => i1,
        o => o    
    );
end Behavioral;
