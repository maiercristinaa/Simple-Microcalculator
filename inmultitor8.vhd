----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2023 08:59:44 PM
-- Design Name: 
-- Module Name: inmultitor8 - Behavioral
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

entity inmultitor8 is
	Port ( X : in std_logic_vector(7 downto 0);
		   Y : in std_logic_vector(7 downto 0);  
		   P : out std_logic_vector(15 downto 0));
end inmultitor8;

architecture Behavioral of inmultitor8 is

type mat8_8 is array(0 to 7) of std_logic_vector(0 to 7);
type mat7_9 is array(0 to 6) of std_logic_vector(0 to 8);
type mat8_9 is array(0 to 7) of std_logic_vector(0 to 8);
signal PP : mat8_8;
signal T : mat7_9;
signal S : mat8_9;

begin

gen1: for i in 0 to 6 generate
	T(i)(0) <= '0';
end generate;

gen2: for i in 0 to 7 generate
      gen3: for j in 0 to 7 generate
      			PP(i)(j) <= X(j) and Y(i); --calculam pp
      			S(0)(j) <= PP(0)(j); 
      end generate;
end generate;

gen4: for i in 0 to 6 generate
gen5: for j in 0 to 7 generate
	  			sum: entity WORK.sum port map(
	  						x => PP(i+1)(j),
	  						y => S(i)(j+1),
	  						tin => T(i)(j),
	  						s => S(i+1)(j),
	  						tout => T(i)(j+1));
	  end generate;
end generate;

gen6: for i in 1 to 7 generate
		S(i)(8) <= T(i-1)(8);
end generate;

S(0)(8) <= '0';
P(0) <= S(0)(0);
P(1) <= S(1)(0);
P(2) <= S(2)(0);
P(3) <= S(3)(0);
P(4) <= S(4)(0);
P(5) <= S(5)(0);
P(6) <= S(6)(0);
P(7) <= S(7)(0);
P(8) <= S(7)(1);
P(9) <= S(7)(2);
P(10) <= S(7)(3);
P(11) <= S(7)(4);
P(12) <= S(7)(5);
P(13) <= S(7)(6);
P(14) <= S(7)(7);
P(15) <= S(7)(8);

end Behavioral;


