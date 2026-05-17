----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2026 17:09:44
-- Design Name: 
-- Module Name: My_delay_gates - Behavioral
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

package MY_COMPONENTS is
    component ANDN is
        generic(N:integer range 0 to 32 := 2);
        Port(
            x: in std_logic_vector(0 to N-1);
            o: out std_logic
        );
    end component;
    
    component ORN is
        generic(N:integer range 0 to 32 := 2);
        Port(
            x: in std_logic_vector(0 to N-1);
            o: out std_logic
        );
    end component;
    
    component INV is
        Generic (
            delay: time := 5 ns
        );
        Port (
            i: in std_logic;
            o: out std_logic
        );
    end component;
    
     
     component MUX is
         Generic(
            delay: time := 10 ns
         );
         Port (
            i1, i2, s: in std_logic;
            o: out std_logic
            );
     end component;
     
     component MUX2OR
         Port (
            i1, i2: in std_logic;
            o: out std_logic
            );
     end component; 
     
     
     component MUX2AND
         Generic (
            delay: time := 10 ns
         );
         Port (
            i1, i2: in std_logic;
            o: out std_logic
            );
     end component;
     
     component CMP2
         Port (
           x1, x2: in std_logic;
           old_res: in std_logic_vector(2 downto 0);
           curr_res: out std_logic_vector(2 downto 0)
        );
     end component;
     
     component CMPN
        Generic(
            N:integer range 1 to 32:=1
        );
        Port(
            in_num1: in std_logic_vector(N-1 downto 0);
            in_num2: in std_logic_vector(N-1 downto 0);
            out_res: out std_logic_vector(2 downto 0)
        );
     end component;
    
end package;
