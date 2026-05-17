----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2026 23:04:49
-- Design Name: 
-- Module Name: CMP2 - Behavioral
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

entity CMP2 is
--  Port ( );
    Port (
        x1, x2: in std_logic;
        old_res: in std_logic_vector(2 downto 0);
        curr_res: out std_logic_vector(2 downto 0)
    );
end CMP2;

architecture Behavioral of CMP2 is
signal 
        x1_out, x2_out, nx1_out, nx2_out,
        more, less, equal, equal1, equal2,
        AND_X1_NX2_X1, AND_X1_NX2_NX2,
        AND_NX1_X2_NX1, AND_NX1_X2_X2,
        AND_NX1_NX2_NX1, AND_NX1_NX2_NX2,
        AND_X1_X2_X1, AND_X1_X2_X2,
        OR_EQUAL1_EQUAL2_EQUAL1, OR_EQUAL1_EQUAL2_EQUAL2,
        curr_more, curr_less,
        OLD_LESS, OLD_MORE,
        OLD_LESS_INV, OLD_MORE_INV,
        AND_INV_OLD_LESS_CURR_MORE_INV_OLD_LESS, 
        AND_INV_OLD_MORE_CURR_LESS_INV_OLD_MORE,
        AND_INV_OLD_LESS_CURR_MORE_CURR_MORE, 
        AND_INV_OLD_MORE_CURR_LESS_CURR_LESS: std_logic;
signal temp_res: std_logic_vector(curr_res'range);
begin
    X1_X1_OUT: entity my_delay_gateslib.delay_interconnection port map(in_signal => x1, out_signal => x1_out);
    X2_X2_OUT: entity my_delay_gateslib.delay_interconnection port map(in_signal => x2, out_signal => x2_out);
  
    INV_X1: entity my_delay_gateslib.INV port map(i => x1_out, o => nx1_out);
    INV_X2: entity my_delay_gateslib.INV port map(i => x2_out, o => nx2_out);
    
    X1_AND_X1_NX2: entity my_delay_gateslib.delay_interconnection port map(in_signal => x1_out, out_signal => AND_X1_NX2_X1);
    NX2_AND_X1_NX2: entity my_delay_gateslib.delay_interconnection port map(in_signal => nx2_out, out_signal => AND_X1_NX2_NX2); 
    AND_X1_NX2: entity my_delay_gateslib.ANDN port map(x(0) => AND_X1_NX2_X1, x(1) => AND_X1_NX2_NX2, o => more);
    
    NX1_AND_NX1_X2: entity my_delay_gateslib.delay_interconnection port map(in_signal => nx1_out, out_signal => AND_NX1_X2_NX1);
    X2_AND_NX1_X2: entity my_delay_gateslib.delay_interconnection port map(in_signal => x2_out, out_signal => AND_NX1_X2_X2); 
    
    AND_NX1_X2: entity my_delay_gateslib.ANDN port map(x(0) => AND_NX1_X2_NX1, x(1) => AND_NX1_X2_X2, o => less);
    
    NX1_AND_NX1_NX2: entity my_delay_gateslib.delay_interconnection port map(in_signal => nx1_out, out_signal => AND_NX1_NX2_NX1);
    NX2_AND_NX1_NX2: entity my_delay_gateslib.delay_interconnection port map(in_signal => nx2_out, out_signal => AND_NX1_NX2_NX2); 
    
    AND_NX1_NX2: entity my_delay_gateslib.ANDN port map(x(0) => AND_NX1_NX2_NX1, x(1) => AND_NX1_NX2_NX2, o => equal1);
    
    X1_AND_X1_X2: entity my_delay_gateslib.delay_interconnection port map(in_signal => x1_out, out_signal => AND_X1_X2_X1);
    X2_AND_X1_X2: entity my_delay_gateslib.delay_interconnection port map(in_signal => x2_out, out_signal => AND_X1_X2_X2); 
    
    AND_X1_X2: entity my_delay_gateslib.ANDN port map(x(0) => AND_X1_X2_X1, x(1) =>  AND_X1_X2_X2, o => equal2);
    
    EQUAL1_OR_EQUAL1_EQUAL2: entity my_delay_gateslib.delay_interconnection port map(in_signal => equal1, out_signal => OR_EQUAL1_EQUAL2_EQUAL1);
    EQUAL2_OR_EQUAL1_EQUAL2: entity my_delay_gateslib.delay_interconnection port map(in_signal => equal2, out_signal => OR_EQUAL1_EQUAL2_EQUAL2);
    
    OR_EQUAL1_EQUAL2: entity my_delay_gateslib.ORN port map(x(0) => OR_EQUAL1_EQUAL2_EQUAL1, x(1) => OR_EQUAL1_EQUAL2_EQUAL2, o => equal);
    
    MORE_OR_MORE_CURR_OLD: entity my_delay_gateslib.delay_interconnection port map(in_signal => more, out_signal => temp_res(2));
    EQUAL_AND_EQUAL_CURR_OLD: entity my_delay_gateslib.delay_interconnection port map(in_signal => equal, out_signal => temp_res(1));
    LESS_OR_LESS_CURR_OLD: entity my_delay_gateslib.delay_interconnection port map(in_signal => less, out_signal => temp_res(0));
    
    OR_MORE_CURR_OLD: entity my_delay_gateslib.ORN port map(x(0) => temp_res(2), x(1) => old_res(2), o => curr_more);
    AND_EQUAL_CURR_OLD: entity my_delay_gateslib.ANDN port map(x(0) => temp_res(1), x(1) => old_res(1), o => curr_res(1));
    OR_LESS_CURR_OLD: entity my_delay_gateslib.ORN port map(x(0) => temp_res(0), x(1) => old_res(0), o => curr_less);
    
    
    OLD_LESS_INV_OLD_LESS: entity my_delay_gateslib.delay_interconnection port map(in_signal => old_res(0), out_signal => OLD_LESS);
    OLD_MORE_INV_OLD_MORE: entity my_delay_gateslib.delay_interconnection port map(in_signal => old_res(2), out_signal => OLD_MORE);
    
    INV_OLD_LESS: entity my_delay_gateslib.INV port map(i => OLD_LESS, o => OLD_LESS_INV);
    INV_OLD_MORE: entity my_delay_gateslib.INV port map(i => OLD_MORE, o => OLD_MORE_INV);
    
    INV_OLD_LESS_AND_INV_OLD_LESS_CURR_MORE: entity my_delay_gateslib.delay_interconnection port map(in_signal => OLD_LESS_INV, out_signal => AND_INV_OLD_LESS_CURR_MORE_INV_OLD_LESS);
    INV_OLD_MORE_AND_INV_OLD_MORE_CURR_LESS: entity my_delay_gateslib.delay_interconnection port map(in_signal => OLD_MORE_INV, out_signal => AND_INV_OLD_MORE_CURR_LESS_INV_OLD_MORE);
    
    CURR_MORE_AND_INV_OLD_LESS_CURR_MORE: entity my_delay_gateslib.delay_interconnection port map(in_signal => curr_more, out_signal => AND_INV_OLD_LESS_CURR_MORE_CURR_MORE);
    CURR_LESS_AND_INV_OLD_MORE_CURR_LESS: entity my_delay_gateslib.delay_interconnection port map(in_signal => curr_less, out_signal => AND_INV_OLD_MORE_CURR_LESS_CURR_LESS);
    
    
    AND_INV_OLD_LESS_CURR_MORE: entity my_delay_gateslib.ANDN port map(x(0) => AND_INV_OLD_LESS_CURR_MORE_INV_OLD_LESS, x(1) => AND_INV_OLD_LESS_CURR_MORE_CURR_MORE, o => curr_res(2));
    AND_INV_OLD_MORE_CURR_LESS: entity my_delay_gateslib.ANDN port map(x(0) => AND_INV_OLD_MORE_CURR_LESS_INV_OLD_MORE, x(1) => AND_INV_OLD_MORE_CURR_LESS_CURR_LESS, o => curr_res(0));
end Behavioral;
