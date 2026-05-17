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

library my_delay_gateslib;
use my_delay_gateslib.MY_COMPONENTS.ALL;

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
signal OUT_X: std_logic_vector(3 downto 0);
signal OUT_NX: std_logic_vector(3 downto 0);
signal Y: std_logic_vector(3 downto 0);
signal Y31_out, Y31_in, Y32_out, Y32_in, Y21_in, Y21_out, Y3_out, Y3_in, Y11_in, Y11_out, 
Y12_in, Y12_out, Y13_in, Y13_out, Y01_in, Y01_out, Y02_in, Y02_out, AND_Y31_NX1,
AND_Y31_NX2, AND_Y32_NX0, AND_Y32_NX2, AND_Y21_NX3, AND_Y31_X3, AND_Y31_X0, AND_Y32_X3, 
AND_Y32_X1, AND_Y21_X2, AND_Y11_NX3, AND_Y11_NX1, AND_Y11_X2, AND_Y12_NX3, AND_Y12_NX2, 
AND_Y12_X1, AND_Y13_NX2, AND_Y13_NX0, AND_Y13_X1, AND_Y01_NX3, AND_Y01_NX0, AND_Y01_X1,
AND_Y02_NX1, AND_Y02_NX3, AND_Y02_X0: std_logic;

begin
   OUT_X <= sw;
   INV: for i in 0 to 3 generate
       INV_XI: entity my_delay_gateslib.INV generic map(delay => 5 ns) port map (i => OUT_X(i), o => OUT_NX(i));
   end generate;
   
   INV_X1_AND_Y31: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(1),
       out_signal => AND_Y31_NX1
   );
   
   INV_X2_AND_Y31: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(2),
       out_signal => AND_Y31_NX2
   );
   
   X3_AND_Y31: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(3),
       out_signal => AND_Y31_X3
   );
   
   X0_AND_Y31: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(0),
       out_signal => AND_Y31_X0
   );
   
  
   AND_Y31: entity my_delay_gateslib.ANDN generic map(N => 4, delay_and2 => 10 ns) port map(
       x(0) => AND_Y31_X3, 
       x(1) => AND_Y31_X0, 
       x(2) => AND_Y31_NX1, 
       x(3) => AND_Y31_NX2, 
       o => Y31_out
   );
   
   INV_X0_AND_Y32: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(0),
       out_signal => AND_Y32_NX0
   );
   
   
   INV_X2_AND_Y32: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(2),
       out_signal => AND_Y32_NX2
   );
   
   X3_AND_Y32: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(3),
       out_signal => AND_Y32_X3
   );
   
   X1_AND_Y32: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(1),
       out_signal => AND_Y32_X1
   );
   
   AND_Y32: entity my_delay_gateslib.ANDN generic map(N => 4, delay_and2 => 10 ns) port map(
       x(0) => AND_Y32_NX0,
       x(1) => AND_Y32_X3, 
       x(2) => AND_Y32_NX2, 
       x(3) => AND_Y32_X1, 
       o => Y32_out
   );
   
   AND_Y31_OR_Y3: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y31_out,
       out_signal => Y31_in
   );
   
   AND_Y32_OR_Y3: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y32_out,
       out_signal => Y32_in
   );
   
   OR_Y3: entity my_delay_gateslib.ORN port map(
       x(0) => Y31_in, 
       x(1) => Y32_in, 
       o => Y3_out
   );
   
   
    INV_X3_AND_Y21: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(3),
       out_signal => AND_Y21_NX3
   );
   
    X2_AND_Y21: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(2),
       out_signal => AND_Y21_X2
   );
   
    AND_Y21: entity my_delay_gateslib.ANDN port map(
        x(0) => AND_Y21_X2, 
        x(1) => AND_Y21_NX3, 
        o => Y21_out
    );
    
    OR_Y3_OR_Y2: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y3_out,
       out_signal => Y3_in
   );
    
    AND_Y21_OR_Y2: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y21_out,
       out_signal => Y21_in
   );
   
    OR_Y2: entity my_delay_gateslib.ORN port map(
        x(0) => Y3_in,
        x(1) => Y21_in,
        o => Y(2)
    );
    
    INV_X3_AND_Y11: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(3),
       out_signal => AND_Y11_NX3
   );
   
   INV_X1_AND_Y11: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(1),
       out_signal => AND_Y11_NX1
   );
   
   X2_AND_Y11: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(2),
       out_signal => AND_Y11_X2
   );
   
    AND_Y11: entity my_delay_gateslib.ANDN generic map(N => 3, delay_and2 => 10 ns) port map(
        x(0) => AND_Y11_NX3,
        x(1) => AND_Y11_NX1,
        x(2) => AND_Y11_X2,
        o => Y11_out
    );
    
    INV_X3_AND_Y12: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(3),
       out_signal => AND_Y12_NX3
   );
   
   INV_X2_AND_Y12: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(2),
       out_signal => AND_Y12_NX2
   );
   
    X1_AND_Y12: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(1),
       out_signal => AND_Y12_X1
   );
     
    AND_Y12: entity my_delay_gateslib.ANDN generic map(N => 3, delay_and2 => 10 ns) port map(
        x(0) => AND_Y12_X1,
        x(1) => AND_Y12_NX3,
        x(2) => AND_Y12_NX2,
        o => Y12_out
    );
    
    INV_X2_AND_Y13: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(2),
       out_signal => AND_Y13_NX2
   );
   
   INV_X0_AND_Y13: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(0),
       out_signal => AND_Y13_NX0
   );
   
    X1_AND_Y13: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(1),
       out_signal => AND_Y13_X1
   );
    
    AND_Y13: entity my_delay_gateslib.ANDN generic map(N => 3, delay_and2 => 10 ns) port map(
        x(0) => AND_Y13_X1,
        x(1) => AND_Y13_NX2,
        x(2) => AND_Y13_NX0,
        o => Y13_out
    );
    

    AND_Y11_OR_Y1: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y11_out,
       out_signal => Y11_in
   );
   
   AND_Y12_OR_Y1: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y12_out,
       out_signal => Y12_in
   );
   
   AND_Y13_OR_Y1: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y13_out,
       out_signal => Y13_in
   );
    
    OR_Y1: entity my_delay_gateslib.ORN generic map(N => 3, delay_or2 => 10 ns) port map(
        x(0) => Y13_in,
        x(1) => Y12_in,
        x(2) => Y11_in,
        o => Y(1)
    );
    
    INV_X3_AND_Y01: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(3),
       out_signal => AND_Y01_NX3
   );
   
   INV_X0_AND_Y01: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(0),
       out_signal => AND_Y01_NX0
   );
   
   X1_AND_Y01: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(1),
       out_signal => AND_Y01_X1
   );
    
    AND_Y01: entity my_delay_gateslib.ANDN generic map(N => 3, delay_and2 => 10 ns) port map(
        x(0) => AND_Y01_NX3,
        x(1) => AND_Y01_X1,
        x(2) => AND_Y01_NX0,
        o => Y01_out
    );
    
    INV_X1_AND_Y02: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(1),
       out_signal => AND_Y02_NX1
   );
   
   INV_X3_AND_Y02: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_NX(3),
       out_signal => AND_Y02_NX3
   );
    
    X0_AND_Y02: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => OUT_X(0),
       out_signal => AND_Y02_X0
   );
    
    AND_Y02: entity my_delay_gateslib.ANDN generic map(N => 3, delay_and2 => 10 ns) port map(
        x(0) => AND_Y02_NX1,
        x(1) => AND_Y02_NX3,
        x(2) => AND_Y02_X0,
        o => Y02_out
    );
    
    
    AND_Y01_OR_Y0: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y01_out,
       out_signal => Y01_in
   );
   
   AND_Y02_OR_Y0: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y02_out,
       out_signal => Y02_in
   );
   
    OR_Y3_OR_Y0: entity my_delay_gateslib.delay_interconnection port map(
       in_signal => Y3_out,
       out_signal => Y(3)
   );
   
   OR_Y0: entity my_delay_gateslib.ORN generic map(N => 3, delay_or2 => 10 ns) port map(
       x(0) => Y(3),
       x(1) => Y02_in,
       x(2) => Y01_in,
       o => Y(0)
    );
   
   led <= y;
   
end Behavioral;
