----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 20:43:20
-- Design Name: 
-- Module Name: code_transformer - Behavioral
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

library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity code_transformer is
--  Port ( );
    Port(
        SW: in std_logic_vector(3 downto 0);
        LED: out std_logic_vector(3 downto 0)
    );
end code_transformer;

architecture Behavioral of code_transformer is
signal X: std_logic_vector(3 downto 0);
signal NX: std_logic_vector(3 downto 0);
signal Y: std_logic_vector(3 downto 0);
signal Y31, Y32, Y21, Y11, Y12, Y13, Y01, Y02: std_logic;
begin
   X <= sw;
   INV: for i in 0 to 3 generate
       INV_XI: entity my_gateslib.INV port map (i => X(i), o => NX(i));
   end generate;
  
   AND_Y31: entity my_gateslib.ANDN generic map(4) port map(
       x(0) => x(3), 
       x(1) => x(0), 
       x(2) => nx(1), 
       x(3) => nx(2), 
       o => Y31
   );
   
   AND_Y32: entity my_gateslib.ANDN generic map(4) port map(
       x(0) => nx(0),
       x(1) => x(3), 
       x(2) => nx(2), 
       x(3) => x(1), 
       o => Y32
   );
   
   OR_Y3: entity my_gateslib.ORN port map(
       x(0) => Y31, 
       x(1) => Y32, 
       o => Y(3)
   );
   
   AND_Y21: entity my_gateslib.ANDN port map(
       x(0) => x(2), 
       x(1) => nx(3), 
       o => Y21
   );
   
   OR_Y2: entity my_gateslib.ORN port map(
        x(0) => Y(3),
        x(1) => Y21,
        o => Y(2)
    );
   
    AND_Y11: entity my_gateslib.ANDN generic map(3) port map(
        x(0) => nx(3),
        x(1) => nx(1),
        x(2) => x(2),
        o => Y11
    );
     
    AND_Y12: entity my_gateslib.ANDN generic map(3) port map(
        x(0) => x(1),
        x(1) => nx(3),
        x(2) => nx(2),
        o => Y12
    );
    
    AND_Y13: entity my_gateslib.ANDN generic map(3) port map(
        x(0) => x(1),
        x(1) => nx(2),
        x(2) => nx(0),
        o => Y13
    );
    
    
    OR_Y1: entity my_gateslib.ORN generic map(3) port map(
        x(0) => Y13,
        x(1) => Y12,
        x(2) => Y11,
        o => Y(1)
    );
    
    AND_Y01: entity my_gateslib.ANDN generic map(3) port map(
        x(0) => nx(3),
        x(1) => x(1),
        x(2) => nx(0),
        o => Y01
    );
    
    AND_Y02: entity my_gateslib.ANDN generic map(3) port map(
        x(0) => nx(1),
        x(1) => nx(3),
        x(2) => x(0),
        o => Y02
    );
    
    OR_Y0: entity my_gateslib.ORN generic map(3) port map(
        x(0) => Y(3),
        x(1) => Y02,
        x(2) => Y01,
        o => Y(0)
    );
   
   led <= y;
   
end Behavioral;
