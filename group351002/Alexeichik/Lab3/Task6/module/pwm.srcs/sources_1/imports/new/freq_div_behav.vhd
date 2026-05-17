----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 20:06:01
-- Design Name: 
-- Module Name: freq_div_behav - Behavioral
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
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_div_behav is
--  Port ( );
    Generic (K : natural := 10);
    Port (
        CLK: in std_logic;
        RST: in std_logic;
        EN: in std_logic;
        Q: out std_logic
    );
end freq_div_behav;

architecture Behavioral of freq_div_behav is
constant module: integer := K / 2;
constant counter_bits: integer := integer(ceil(log2(real(module))));
signal counter: unsigned(counter_bits - 1 downto 0) := (others => '0');
signal output: std_logic := '0';
begin
  process (CLK)
  begin
    if (rising_edge(CLK)) then
        if (RST = '1') then
          counter <= (others => '0');
          output <= '0';
        elsif (EN = '1') then  
          if (counter = module - 1) then
            counter <= (others => '0');
            output <= not output;
          else
            counter <= counter + 1;
          end if;
        end if;
       end if;
  end process;  
  Q <= output;
end Behavioral;