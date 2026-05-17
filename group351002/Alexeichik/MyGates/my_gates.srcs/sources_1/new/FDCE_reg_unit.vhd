----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2026 23:47:59
-- Design Name: 
-- Module Name: FDCE_reg_unit - Behavioral
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

entity FDCE_reg_unit is
--  Port ( );
    Generic (
      N: natural := 34
    );
    Port (
      CLK, RST, EN: in std_logic;
      Din: in std_logic_vector(N-1 downto 0);
      Dout: out std_logic_vector(N-1 downto 0) 
    );
end FDCE_reg_unit;

architecture Behavioral of FDCE_reg_unit is
signal store_out, D_internal: std_logic_vector(N-1 downto 0);
signal RST_N: std_logic;
begin
  RST_N <= not RST;
  D_internal <= Din when EN = '1' else store_out;
  dffar_reg_unit_elem: for i in 0 to N -1 generate
      DFFAR_elem: DFFAR port map (CLK => CLK, CLR_N => RST_N, D => D_internal(i), Q => store_out(i));   
  end generate;
  Dout <= store_out;
end Behavioral;
