----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 04:43:47 PM
-- Design Name: 
-- Module Name: sub - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sub is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           tin : in STD_LOGIC;
           s : out STD_LOGIC;
           tout : out STD_LOGIC);
end sub;

architecture Behavioral of sub is
begin
    s <= x xor y xor tin;
    tout <= (not x and y) or ((x xnor y) and tin);
end Behavioral;