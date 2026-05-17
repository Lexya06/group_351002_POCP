----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 11:33:50
-- Design Name: 
-- Module Name: CMPN - Behavioral
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

entity CMPN is
--  Port ( );
    Generic(
        N:integer range 1 to 32:=1
    );
    Port(
        in_num1: in std_logic_vector(N-1 downto 0);
        in_num2: in std_logic_vector(N-1 downto 0);
        out_res: out std_logic_vector(2 downto 0)
    );
end CMPN;

architecture Behavioral of CMPN is
type temp_res_type is array(0 to in_num1'high+1) of std_logic_vector(out_res'range); 
signal temp_res: temp_res_type;  
begin
    temp_res(0)<= "010";
    CMPN:for i in 0 to N-1 generate
        CMP1: entity my_delay_gateslib.CMP1 port map(x1 => in_num1(N-1-i), x2 => in_num2(N-1-i), old_res => temp_res(i), curr_res => temp_res(i+1)); 
    end generate;  
    out_res <= temp_res(N);
end Behavioral;
