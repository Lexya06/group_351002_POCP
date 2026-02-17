----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2026 14:50:22
-- Design Name: 
-- Module Name: to_berger_transfom_structural - Behavioral
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
use IEEE.math_real.all;

library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity to_berger_transfom_structural is
--  Port ( );
    Port (
        SW: in std_logic_vector(15 downto 0);
        LED: out std_logic_vector(15 downto 0);
        clk: in std_logic
    );
end to_berger_transfom_structural;

architecture Behavioral of to_berger_transfom_structural is
signal cmp_bit, reset: std_logic;
signal bit_index: integer range 0 to 15;
signal reg_start,reg_next: std_logic_vector(4 downto 0):= (others => '0');
signal sw_prev: std_logic_vector(15 downto 0):=(others => '0');

begin
    counter: entity my_gateslib.COUNTER5 port map (
        i => reg_start,
        cmp_bit => cmp_bit,
        o => reg_next
    ); 
    
    process (clk) is
    begin
        if rising_edge(clk) then
            if (SW /= sw_prev) then
                sw_prev <= SW;
                reg_start <= (others => '0');
                reset <= '0';
                cmp_bit <= '0';
                bit_index <= 0;
            elsif (reset = '0') then
                
                if (bit_index + 1 <= SW'length) then
                    reg_start <= reg_next;
                    cmp_bit <= SW(bit_index);
                    bit_index <= bit_index + 1;
                else
                    reset <= '1';
                    cmp_bit <= '0';
                    sw_prev <= (others => '0');
                    bit_index <= 0;
                    reg_start <= (others => '0');
                    LED(4 downto 0) <= reg_next;
                    LED(15 downto 5) <= (others => '0');   
                end if;  
            end if;
          
        end if;
                  
    end process; 
    
    

end Behavioral;
