library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity impartitor8 is
    Port (
        Q : in  std_logic_vector(7 downto 0);  --catul
        M : in  std_logic_vector(7 downto 0);  --divizorul
        D : out std_logic_vector(7 downto 0);  --registru cat
        clk : in std_logic;                    
        R : out std_logic_vector(7 downto 0)   --rest
    );
end impartitor8;

architecture Behavioral of impartitor8 is

    signal A : std_logic_vector(7 downto 0);
    signal B : std_logic_vector(7 downto 0);
    signal Q_reg : std_logic_vector(7 downto 0);
    signal M_reg : std_logic_vector(7 downto 0);
    signal R_reg : std_logic_vector(7 downto 0);
    signal Bout : std_logic;
    
begin

    process(clk)
        variable i : integer := 0;
    begin
        if rising_edge(clk) then
            if i = 0 then
                A <= (others => '0');
                B <= Q;
                M_reg <= M;
                Q_reg <= (others => '0');
                R_reg <= (others => '0');
                i := i + 1;
            elsif i < 8 then
                i := i + 1;
            end if;

            if A(7) = '0' then
                A <= A - M_reg;
                Q_reg <= Q_reg(6 downto 0) & '1';
            else
                A <= A + M_reg;
                Q_reg <= Q_reg(6 downto 0) & '0';
            end if;

            if i = 8 then
                D <= Q_reg;
                R <= A;
                A <= (others => '0');
                B <= (others => '0');
                Q_reg <= (others => '0');
                M_reg <= (others => '0');
                R_reg <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;