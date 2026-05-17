----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 08:23:54
-- Design Name: 
-- Module Name: Reg_file1R1W_FDRE_reg_unit - Behavioral
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

use IEEE.math_real.ALL;
library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.math_real.ALL;
library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.math_real.ALL;
library my_gateslib;
use my_gateslib.MY_COMPONENTS.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_file1R1W_FDRE_reg_unit is
--  Port ( );
    Generic(
      M: natural := 4;
      N: natural := 2
    );
    Port (
      INIT, WE, nO, CLK: in std_logic;
      WDP: in std_logic_vector(N-1 downto 0);
      RDP:out std_logic_vector(N-1 downto 0);
      RA, WA: in std_logic_vector(integer(ceil(log2(real(M)))) - 1 downto 0)
    );
end Reg_file1R1W_FDRE_reg_unit;

architecture Behavioral of Reg_file1R1W_FDRE_reg_unit is
subtype reg_unit_type is std_logic_vector(N-1 downto 0);
type reg_file_type is array (0 to M-1) of reg_unit_type;
signal write_enable: std_logic_vector (0 to M-1) := (others => '0');
constant allz: std_logic_vector(0 to N-1) := (others => 'Z');
signal read_address, write_address: integer range 0 to M-1;
signal reg_file_out: reg_file_type;
begin
  read_address <= to_integer(unsigned(RA));
  write_address <= to_integer(unsigned(WA));
  process (WE, write_address)
  begin
    write_enable <= (others => '0'); 
    if (WE = '1') then
      write_enable(write_address) <= '1';
    end if;   
  end process;
  REG_FILE1R1W_FDRE_reg_unit_elem: for i in 0 to M-1 generate
    FDRE_reg_unit_elem: FDRE_reg_unit generic map (N => N) port map (
        CLK => CLK,
        RST => INIT,
        Din => WDP,
        EN => write_enable(i),
        Dout => reg_file_out(i)
    );
        
  end generate;
  
  RDP <= reg_file_out(read_address) when nO = '0' else allz;

end Behavioral;
