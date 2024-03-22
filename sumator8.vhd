library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumator8 is
    Port ( X : in  std_logic_vector(7 downto 0);
           Y : in  std_logic_vector (7 downto 0);
           Cin : in  std_logic;
           S : out  std_logic_vector(7 downto 0);
           Cout : out  std_logic);
end sumator8;

 architecture Behavioral of sumator8 is


component sum is
Port ( x : in STD_LOGIC;
       y : in STD_LOGIC;
       tin : in STD_LOGIC;
       s : out STD_LOGIC;
       tout : out STD_LOGIC);
end component;


signal C: std_logic_vector(8 downto 0); --stocam transportul la fiecare pas

begin

C(0) <= Cin;

conditie:for i in 0 to 7 

generate
generare:sum port map (x =>X(i), y =>Y(i), tin =>C(i), s=>S(i), tout =>C(i+1)); --instantiem componenta sum
end generate;

Cout <= C(8);
end Behavioral;


