----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2026 09:43:44
-- Design Name: 
-- Module Name: Reg_file2R1W_FDCE_reg_unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_file2R1W_FDCE_reg_unit is
--  Port ( );
    Generic(
          ADDR_WIDTH: natural := 2;
          DATA_WIDTH: natural := 2
       );
    Port (
      CLR, W_EN, CLK: in std_logic;
      W_DATA: in std_logic_vector(DATA_WIDTH-1 downto 0);
      R_DATA_0, R_DATA_1:out std_logic_vector(DATA_WIDTH-1 downto 0);
      R_ADDR_0, R_ADDR_1, W_ADDR: in std_logic_vector(ADDR_WIDTH-1 downto 0)
    );
end Reg_file2R1W_FDCE_reg_unit;

architecture Behavioral of Reg_file2R1W_FDCE_reg_unit is
constant reg_count: natural := 2**ADDR_WIDTH;
subtype reg_unit_type is std_logic_vector(DATA_WIDTH-1 downto 0);
type reg_file_type is array (0 to reg_count - 1) of reg_unit_type;
signal write_enable: std_logic_vector (0 to reg_count-1) := (others => '0');
signal read_address_0, read_address_1, write_address: integer range 0 to reg_count-1;
signal reg_file_out: reg_file_type;
begin
  read_address_0 <= to_integer(unsigned(R_ADDR_0));
  read_address_1 <= to_integer(unsigned(R_ADDR_1));
  write_address <= to_integer(unsigned(W_ADDR));
  process (W_EN, write_address)
  begin
    write_enable <= (others => '0');
    if (W_EN = '1') then
      write_enable(write_address) <= '1';
    end if;
  end process;
  REG_FILE2R1W_FDCE_reg_unit_elem: for i in 0 to reg_count-1 generate
    FDCE_reg_unit_elem: FDCE_reg_unit generic map (N => DATA_WIDTH) port map (
        CLK => CLK,
        RST => CLR,
        Din => W_DATA,
        EN => write_enable(i),
        Dout => reg_file_out(i)
    );     
  end generate;
  
  R_DATA_0 <= reg_file_out(read_address_0);
  R_DATA_1 <= reg_file_out(read_address_1);
  
 
end Behavioral;
