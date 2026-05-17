----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2026 17:48:57
-- Design Name: 
-- Module Name: delay_interconnection - Behavioral
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

library my_delay_gateslib;
use my_delay_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity delay_interconnection is
--  Port ( );
    generic(
        delay_per_length: time := 0.05 ns;
        length: integer := 100
    );
    Port(
        in_signal: in std_logic;
        out_signal: out std_logic
    );
end delay_interconnection;

architecture Behavioral of delay_interconnection is

begin
    out_signal <= in_signal after delay_per_length * length;
end Behavioral;
