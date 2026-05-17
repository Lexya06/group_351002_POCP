----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 23:33:47
-- Design Name: 
-- Module Name: testbench_code_transformer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_code_transformer is
--  Port ( );
end testbench_code_transformer;

architecture Behavioral of testbench_code_transformer is
constant T:time:=5 ns;
constant width:integer:=10;
signal SW, LED: std_logic_vector(3 downto 0);
type data_array is array (0 to width - 1) of std_logic_vector(3 downto 0);
signal in_signal: data_array:= (
    "0000",
    "0001",
    "0010",
    "0011",
    "0100",
    "0101",
    "0110",
    "0111",
    "1001",
    "1010"
);

signal expected_out_signal: data_array:= (
    "0000",
    "0001",
    "0011",
    "0010",
    "0110",
    "0111",
    "0101",
    "0100",
    "1101",
    "1111"
);
component code_transformer is
 Port(
        SW: in std_logic_vector(3 downto 0);
        LED: out std_logic_vector(3 downto 0)
    );
end component;

begin
    code_component: code_transformer port map (sw => SW, led => LED);
    Test: process
        constant failed:string:="failed";
        constant passed:string:="passed";
        variable correct:string(1 to 6); 
        begin
            wait for T;
            for i in 0 to width-1 loop
                sw <= in_signal(i);
                wait for T;
                if led = expected_out_signal(i) then
                    correct:=passed;
                else
                    correct:=failed;
                end if;
                report "----------START TEST----------";    
                report "Test " & integer'image(i) & " " & correct & ".Input: " 
                & to_string(sw) & ",output: " & to_string(led) & ",expected: "
                & to_string(expected_out_signal(i));
                report "----------END TEST----------";
            end loop;
            report "End of simulation" severity failure;
        end process;
end Behavioral;
