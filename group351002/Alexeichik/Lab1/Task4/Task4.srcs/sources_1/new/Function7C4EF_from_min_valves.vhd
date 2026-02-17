----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2026 22:20:42
-- Design Name: 
-- Module Name: Function7C4EF_from_min_valves - Behavioral
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

entity Function7C4E_from_min_gates is
--  Port ( );
    Port(
        LED: out std_logic;
        SW: in std_logic_vector(3 downto 0)
    );
end Function7C4E_from_min_gates;

--7C4E: 0111 1100 0100 1110

architecture Structural of Function7C4E_from_min_gates is
signal AN, BN, CN, DN, BNC, ANBNCND, ABCN, BCDN: std_logic;

-- entity work.INV - reference to component
begin
    INV1: entity my_gateslib.INV port map (i => SW(0), o => AN);
    INV2: entity my_gateslib.INV port map (i => SW(1), o => BN);
    INV3: entity my_gateslib.INV port map (i => SW(2), o => CN);
    INV4: entity my_gateslib.INV port map (i => SW(3), o => DN);
    
    AND21: entity my_gateslib.AND2 port map (i1 => BN, i2 => SW(2), o => BNC);
    AND31: entity my_gateslib.AND3 port map (i1 => SW(0), i2 => SW(1), i3 => CN, o => ABCN);
    AND32: entity my_gateslib.AND3 port map (i1 => SW(1), i2 => SW(2), i3 => DN, o => BCDN);
    AND41: entity my_gateslib.AND4 port map (i1 => AN, i2 => BN, i3 => CN, i4 => SW(3),o => ANBNCND);
    
    OR41: entity my_gateslib.OR4 port map (i1 => BNC, i2 => BCDN, i3 => ABCN, i4 => ANBNCND,o => LED);
    
end Structural;
