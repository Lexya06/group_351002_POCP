----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2026 01:03:59
-- Design Name: 
-- Module Name: DLATCH - Structural
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

entity DLATCH is
--  Port ( );
    Port (
        D, G: in std_logic;
        Q: out std_logic
    );
end DLATCH;

architecture Structural of DLATCH is
signal d_sig, g_sig, nd_sig, s_sig, r_sig: std_logic; 
begin
    d_sig <= d;
    g_sig <= g;
    nd_elem: entity my_gateslib.INV_LUT1 port map(i => d_sig, o => nd_sig);
    s_elem: entity my_gateslib.ANDN port map(x(0) => d_sig, x(1) => g_sig, o => s_sig);
    r_elem: entity my_gateslib.ANDN port map(x(0) => nd_sig, x(1) => g_sig, o => r_sig);
    RSLATCH: entity my_gateslib.RSLATCH port map(S => s_sig, R => r_sig, Q => Q);
end Structural;