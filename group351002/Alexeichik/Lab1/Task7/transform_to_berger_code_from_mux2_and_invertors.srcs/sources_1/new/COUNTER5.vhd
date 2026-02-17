----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2026 13:51:38
-- Design Name: 
-- Module Name: COUNTER5 - Behavioral
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

entity COUNTER5 is
--  Port ( );
    Port(
        i: in std_logic_vector(4 downto 0);
        cmp_bit: in std_logic;
        o: out std_logic_vector(4 downto 0)
    );
end COUNTER5;

architecture Behavioral of COUNTER5 is
signal carry: std_logic_vector(5 downto 0):= (others => '0');
begin
    gen_zero_counter: for j in 0 to 4 generate
    begin
        counter: entity my_gateslib.ZERO_COUNTER port map (
            x => i(j),
            cmp_bit => cmp_bit,
            cin => carry(j),
            cout => carry(j+1),
            o => o(j)
        );    
    end generate;    

end Behavioral;
