----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 20:12:40
-- Design Name: 
-- Module Name: pwm - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
--  Port ( );
    Generic (CNT_WIDTH : natural := 8);
    Port (
        CLK: in std_logic;
        CLR: in std_logic;
        EN: in std_logic;
        FILL: in std_logic_vector(CNT_WIDTH-1 downto 0);
        Q: out std_logic
    );
end pwm;

architecture Behavioral of pwm is
constant module: integer := 2 ** CNT_WIDTH;
signal counter: unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');
signal output: std_logic := '0';
begin
  process (CLK, CLR, FILL)
  begin
     if (CLR = '1') then
          counter <= (others => '0');
          output <= '0';
     elsif (unsigned(FILL) = 0) then
          output <= '0';
     elsif (rising_edge(CLK)) then
       if (EN = '1') then
         if (counter = module - 1) then
           counter <= (others => '0');
         else
           counter <= counter + 1;
         end if;
         if (counter < unsigned(FILL)) then
           output <= '1';
         else
           output <= '0';
         end if;  
       end if;
     end if;
  end process;  
  Q <= output;
end Behavioral;
