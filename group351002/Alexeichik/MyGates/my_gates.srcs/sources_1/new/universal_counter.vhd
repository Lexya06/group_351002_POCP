----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2026 11:34:47
-- Design Name: 
-- Module Name: universal_counter - Behavioral
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
use IEEE.math_real.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity universal_counter is
--  Port ( );
    Generic(
      N: natural:=8
    );
    Port(
      CLK, CLR, EN, LOAD: in std_logic;
      MODE: in std_logic_vector(1 downto 0);
      Din: in std_logic_vector(N-1 downto 0);
      Dout: out std_logic_vector(N-1 downto 0)
    );
end universal_counter;

architecture Behavioral of universal_counter is
signal curr_state: unsigned(N-1 downto 0) := (others => '0');
signal next_state: unsigned(N-1 downto 0);

begin
  
  def_mode: process (MODE, LOAD, CLR, EN, Din, curr_state)
  begin
    next_state <= curr_state;
    if (EN = '1' and CLR = '0') then
       case (MODE) is 
         when "00" => next_state <= curr_state+1;
         when "01" => 
           if (curr_state = N - 2) then
             next_state <= (others => '0');
           else
             next_state <= curr_state+1;
           end if;
         when "10" =>
           if (LOAD = '1') then
             next_state <= unsigned(Din);
           end if;
         when others =>
           next_state <= curr_state;
        end case;
    end if;
      
  end process def_mode;
  
  update_counter: process (CLK, CLR)
  begin
    if (CLR = '1') then
      curr_state <= (others => '0');
    elsif (rising_edge(CLK)) then 
      curr_state <= next_state;
    end if;
  end process;
  Dout <= std_logic_vector(curr_state);
end Behavioral;
