----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 23:18:21
-- Design Name: 
-- Module Name: My_gates - Behavioral
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
    component delay_interconnection is
        generic(
            delay_per_length: time := 0.05 ns;
            length: integer := 100
        );
        Port(
            in_signal: in std_logic;
            out_signal: out std_logic
        );
    end component;
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
        Port (
            i: in std_logic;
            o: out std_logic
        );
    end component;
    
    component AND2 is
     Port (
            i1, i2: in std_logic;
            o: out std_logic
        );
    end component;
    
     component AND3 is
     Port (
            i1, i2, i3: in std_logic;
            o: out std_logic
        );
     end component;
    
     component AND4 is
     Port (
            i1, i2, i3, i4: in std_logic;
            o: out std_logic
        );
     end component;
     
     component XOR2 is
     Port (
            i1, i2: in std_logic;
            o: out std_logic
        );
     end component;
     
     component OR4 is
     Port (
            i1, i2, i3, i4: in std_logic;
            o: out std_logic
        );
     end component;
     
     component MUX is
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
     
     component MUX2XOR
     Port (
        i1, i2: in std_logic;
        o: out std_logic
        );
     
     end component;
     
     component MUX2AND
     Port (
        i1, i2: in std_logic;
        o: out std_logic
        );
     end component;
     
     component ADD
     Port (
        i1, i2, cin: in std_logic;
        cout, o: out std_logic
     );
     end component;
     
     component COUNTER5
     Port(
         i: in std_logic_vector(4 downto 0);
         cmp_bit: in std_logic;
         o: out std_logic_vector(4 downto 0)
     );
     end component;

    component LUTN
        Generic(
            N:integer range 1 to 32 := 1
        );
        Port (
            x: in std_logic_vector(N-1 downto 0);
            table: in std_logic_vector(0 to 2**N-1);
            o: out std_logic
        );
     end component;
     
     component INV_LUT1
         Port (
             i: in std_logic;
             o: out std_logic
         );
     end component;
     
     component BISTABLE_INVS
         Port (
            Q, Qn: out std_logic
         );
     end component;
     
     component DLATCH
        Port (
            D, G: in std_logic;
            Q: out std_logic
        );
     end component;
     
     component RSLATCH
        Port (
            R, S: in std_logic;
            Q: out std_logic
        );
     end component;
end package;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


