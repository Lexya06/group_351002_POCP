----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2026 12:45:50
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
use IEEE.math_real.ALL;

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
constant M: natural:=8;
constant A: integer:= integer(ceil(log2(real(M))));
constant T: time := 5 ns;
constant width: integer := 10;
type input_array is array (0 to width-1) of std_logic_vector(3 downto 0);
signal in_signal_control: input_array := 
(
    "1110", -- чтение z
    "0111", -- чтение и запись регистра
    "0010", -- просмотр состояния
    "0111", -- сброс всех регистров
    "0010",  -- хранение
    "1000", -- чтение z
    "0010", -- хранение, подготовка к записи
    "0011", -- запись
    "0010", -- чтение
    "0010" -- чтение
);
signal WA: std_logic_vector(A-1 downto 0):= "010";
signal WDP: std_logic_vector(N-1 downto 0):= "101111"; 
signal RA: std_logic_vector(A-1 downto 0):= "010";
signal INIT, nO, WE, CLK: std_logic;
signal RDP: std_logic_vector(N-1 downto 0);
begin
   Reg_file1R1W_FDRE_reg_unit_elem: Reg_file1R1W_FDRE_reg_unit generic map (M => M, N => N) port map(
        INIT => INIT,
        WA => WA,
        WE => WE,
        RA => RA,
        RDP => RDP,
        WDP => WDP,
        nO => nO,
        CLK => CLK
   );
   Test: process
     begin
       for i in 0 to width-1 loop
         nO <= in_signal_control(i)(3);
         INIT <= in_signal_control(i)(2);
         WE <= in_signal_control(i)(1);
         CLK <= in_signal_control(i)(0);
         wait for T;      
       end loop;
       report "End of simulation" severity failure;
   end process;   

end Behavioral;
