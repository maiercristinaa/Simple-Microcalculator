library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity radacina_patrata8 is
    generic(N : integer := 8);
    port (
        Clk : in std_logic;     
        input : in unsigned(N-1 downto 0);  
        done : out std_logic;   
        sq_root : out unsigned(N/2-1 downto 0)  
    );
end radacina_patrata8;

architecture Behav of radacina_patrata8 is

begin

    SQROOT_PROC : process(Clk)
        variable a : unsigned(N-1 downto 0); --nr pentru care se va calcula radacina patrata
        variable left,right,r : unsigned(N/2+1 downto 0):=(others => '0');  --variabile aux pentru calcul
        variable q : unsigned(N/2-1 downto 0) := (others => '0'); --rezultatul partial
        variable i : integer := 0;  --contor
    begin
        if(rising_edge(Clk)) then
            if(i = 0) then  
                a := input;
                done <= '0';   
                i := i+1;  
            elsif(i < N/2) then 
                i := i+1;  
            end if;
            right := q & r(N/2+1) & '1'; --concatenam rezultatul partial cu bitul cel mai semnificativ al acestuia si '1'
            left := r(N/2-1 downto 0) & a(N-1 downto N-2); --concatenam primii n/2 biti din r cu utlimii 2 din a 
            a := a(N-3 downto 0) & "00";  --concatenam primii n-3 biti cu '00'
            if ( r(N/2+1) = '1') then  --vf daca bitul cel mai semnificativ este 1
                r := left + right;
            else
                r := left - right;
            end if;
            q := q(N/2-2 downto 0) & (not r(N/2+1)); --bitul care se adaug? la q este complementul negativ al bitului cel mai semnificativ al rezultatului par?ial
            if(i = N/2) then    
                done <= '1';    
                i := 0; 
                sq_root <= q;   
                left := (others => '0');
                right := (others => '0');
                r := (others => '0');
                q := (others => '0');
            end if;
        end if;    
    end process;
end architecture;
