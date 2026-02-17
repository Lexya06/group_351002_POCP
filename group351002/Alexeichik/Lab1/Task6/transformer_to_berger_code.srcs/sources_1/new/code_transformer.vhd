----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 01:17:15
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package CODE_TRANSFORM is
    function transform_7421bcd_to_berger(x: std_logic_vector) return std_logic_vector;
end package;

package body CODE_TRANSFORM is
    constant bcd_number_bits_count:integer:=4;
    constant bcd7421_ones_count:integer:=2;
    
    function count_bits(x: std_logic_vector; start_index: integer; end_index: integer; bit_to_count: std_logic) return integer is
    subtype elems_range is integer range 0 to x'length;
    variable count_bits:elems_range:=0;
    variable temp:elems_range:=0;
    begin  
        if ((start_index < 0 or start_index > x'length-1) 
             or (end_index < 0 or end_index > x'length-1)) then
            return 0;
        end if;
        for one_vector_bit in start_index to end_index loop
          if (x(one_vector_bit) = bit_to_count) then
            count_bits := count_bits + 1; 
          end if;
         end loop;
         return count_bits;         
    end function;
    
    function check_7421bcd(x: std_logic_vector) return boolean is
    subtype elems_range is integer range 0 to x'length;
    variable general_bit: elems_range:=0;
    begin
        loop
            exit when general_bit >= x'length;            
            if ((x(general_bit) = '1' and x(general_bit + 1) = '1' and x(general_bit + 2) = '1')
                or (x(general_bit + 2) = '1' and x(general_bit + 3) = '1')) then
                return false;
            end if;
            general_bit := general_bit + bcd_number_bits_count;
        end loop;
        return true;
    end function;
    
    function  transform_7421bcd_to_berger(x: std_logic_vector) return std_logic_vector is
    variable res: std_logic_vector(x'range);
    subtype elems_range is integer range 0 to x'length;
    variable count_zeroes: elems_range;
    begin
        count_zeroes := count_bits(x, 0, x'length - 1, '0');
        res := std_logic_vector(to_unsigned(count_zeroes, res'length)); 
        return res;       
    end function;
end package body;