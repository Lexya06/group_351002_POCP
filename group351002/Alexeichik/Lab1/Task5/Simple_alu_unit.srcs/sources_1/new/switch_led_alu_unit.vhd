----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2026 09:39:32
-- Design Name: 
-- Module Name: switch_led_alu_unit - Behavioral
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

package alu_unit is
    type alu_op is (OR_OP, AND_OP, PLUS_OP, NAND_OP);
    function do_alu_op(one: std_logic_vector; two: std_logic_vector; op: alu_op) return std_logic_vector;
end alu_unit;

package body alu_unit is
    function do_alu_op(one: std_logic_vector; two: std_logic_vector; op: alu_op) return std_logic_vector is
    begin
        case op is
            when OR_OP =>
                return one or two;
            when AND_OP =>
                return one and two;
            when PLUS_OP =>
                return std_logic_vector(unsigned(one) + unsigned(two));
            when NAND_OP =>
                return not(one and two);
        end case;
    end function;
    
   
end package body;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

