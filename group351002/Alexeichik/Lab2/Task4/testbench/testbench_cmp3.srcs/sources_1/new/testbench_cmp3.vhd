----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 15:16:29
-- Design Name: 
-- Module Name: testbench_cmp3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library my_delay_gateslib;
use my_delay_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_cmp3 is
--  Port ( );
end testbench_cmp3;

architecture Behavioral of testbench_cmp3 is
constant N:integer range 1 to 32:=3;
signal A,B: unsigned(N-1 downto 0);
signal curr_res: std_logic_vector(2 downto 0);
signal expected_res: std_logic_vector(2 downto 0) := "010";
constant T: time := 100 ns;
begin
    CMP3: entity my_delay_gateslib.CMPN generic map(N => N) port map (in_num1 => std_logic_vector(A), in_num2 => std_logic_vector(B), out_res => curr_res); 
    Test: process
    constant failed:string:="failed";
    constant passed:string:="passed";
    variable correct:string(1 to 6);
    variable comparing: string(1 to 1); 
    begin
        wait for 20 * T;
        A <= "100";
        B <= "100"; 
        wait for 10 * T;
        A <= "001";
        B <= "100"; 
        wait for 10 * T;
        A <= "100";
        B <= "001"; 
        wait for 10 * T;
        if curr_res = expected_res then
            correct:=passed;
            if (curr_res(2) = '1') then
                comparing:=">";
            elsif (curr_res(1) ='1') then
                comparing:="=";
            else
                comparing:="<";
            end if;
        else
            correct:=failed;
        end if; 
        report "Test " & correct & ". Comparing result: " & to_string(curr_res) & ". A="
         & to_string(A) & comparing & "B=" & to_string(B); 
        report "End of simulation" severity failure;
    end process;
end Behavioral;
