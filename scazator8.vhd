----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 04:35:15 PM
-- Design Name: 
-- Module Name: scazator8 - Behavioral
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

entity scazator8 is
    Port ( X : in  std_logic_vector(7 downto 0);
           Y : in  std_logic_vector (7 downto 0);
           Bin : in  std_logic;
           S : out  std_logic_vector(7 downto 0);
           Bout : out  std_logic);
end scazator8;

architecture Behavioral of scazator8 is

component sub is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           tin : in STD_LOGIC;
           s : out STD_LOGIC;
           tout : out STD_LOGIC);
end component;

signal B: std_logic_vector(8 downto 0);

begin
    B(0) <= Bin;

    conditie: for i in 0 to 7 generate
        generare: sub port map (x => X(i), y => Y(i), tin => B(i), s => S(i), tout => B(i+1));
    end generate;

    Bout <= B(8);
end Behavioral;
