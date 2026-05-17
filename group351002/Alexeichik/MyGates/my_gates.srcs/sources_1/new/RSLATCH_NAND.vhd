----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2026 00:39:27
-- Design Name: 
-- Module Name: RSLATCH - Structural
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

entity RSLATCH_NAND is
--  Port ( );
    Port (
        R, S: in std_logic;
        Q, Qn: out std_logic
    );
end RSLATCH_NAND;

architecture Structural of RSLATCH_NAND is
signal nq_r_and2_sig, q_s_and2_sig, q_sig, nq_sig: std_logic;
attribute DONT_TOUCH: string;
attribute DONT_TOUCH of q_sig, nq_sig: signal is "true";
begin
    nq_r_and2_elem: ANDN port map (x(0) => nq_sig, x(1) => r, o => nq_r_and2_sig);
    q_sig_elem: INV_LUT1 port map (i => nq_r_and2_sig, o => q_sig);
    q_s_and2_elem: ANDN port map (x(0) => q_sig, x(1) => s, o => q_s_and2_sig);
    nq_sig_elem: INV_LUT1 port map (i => q_s_and2_sig, o => nq_sig);
    q <= q_sig;
    qn <= nq_sig;
end Structural;
