----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2026 11:55:19
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
constant N: natural:= 6;
constant A: integer:= 3;
constant T: time := 5 ns;
constant Tdiv2: time := T/2;
constant width: integer := 3;
type input_array is array (0 to width-1) of std_logic_vector(1 downto 0);
signal in_signal_control: input_array := 
(
    "11", -- запись
    "00", -- чтение
    "00"
);
type data_type is array (0 to width-1) of std_logic_vector(N-1 downto 0);
type address_type is array (0 to width-1) of std_logic_vector(A-1 downto 0);
signal W_ADDR: address_type := 
(
    "101",
    "000",
    "000"
);
signal W_DATA: std_logic_vector(N-1 downto 0):= "101111"; 
signal R_ADDR_0: address_type := 
(
    "000",
    "101",
    "000"
);

signal R_ADDR_1: address_type := 
(
    "000",
    "100",
    "000"
);
signal W_EN, CLR: std_logic;
signal CLK: std_logic := '0';
signal R_DATA_0, R_DATA_1: data_type;
signal R_ADDR_1_signal, R_ADDR_0_signal, W_ADDR_signal: std_logic_vector(A-1 downto 0);
signal R_DATA_0_signal, R_DATA_1_signal: std_logic_vector(N-1 downto 0);
begin
   CLK <= not CLK after Tdiv2;
   
   
   Reg_file2R1W_FDCE_reg_unit_elem: Reg_file2R1W_FDCE_reg_unit generic map (ADDR_WIDTH => A, DATA_WIDTH => N) port map(
        CLR => CLR,
        W_ADDR => W_ADDR_signal,
        W_EN => W_EN,
        R_ADDR_0 => R_ADDR_0_signal,
        R_ADDR_1 => R_ADDR_1_signal,
        R_DATA_0 => R_DATA_0_signal,
        R_DATA_1 => R_DATA_1_signal,
        W_DATA => W_DATA,
        CLK => CLK
   );
 
   Test: process
     begin
       for i in 0 to width-1 loop
         CLR <= in_signal_control(i)(0);
         W_EN <= in_signal_control(i)(1);
         R_ADDR_0_signal <= R_ADDR_0(i);
         R_ADDR_1_signal <= R_ADDR_1(i);
         W_ADDR_signal <= W_ADDR(i);
         wait until falling_edge(clk); 
         R_DATA_0(i) <= R_DATA_0_signal;
         R_DATA_1(i) <= R_DATA_1_signal;
       end loop;
       wait for T;
       report "End of simulation" severity failure;
   end process;

end Behavioral;
