library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_microcalculator is
--  Port ( );
end tb_microcalculator;
architecture testbench of tb_microcalculator is
    signal Clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal X, Y : std_logic_vector(7 downto 0) := (others => '0');
    signal P : std_logic_vector(15 downto 0);
    signal Cin : std_logic := '0';
    signal Cout : std_logic;
    signal S,D : std_logic_vector(7 downto 0);
    signal Bin:std_logic:='0';
    signal bout:std_logic;
    signal I:std_logic_vector(7 downto 0);
    signal R:std_logic_vector(7 downto 0);
    signal done:std_logic:='0';
    signal sq_root: unsigned(3 downto 0);
    signal coeficient:std_logic_vector(7 downto 0);
    signal rest:std_logic_vector(7 downto 0);
    
    constant CLOCK_PERIOD : time := 10 ns;
begin
    UUT1: entity work.inmultitor8
        port map (X => X, Y => Y, P => P);

    UUT2: entity work.sumator8
        port map (X => X, Y => Y, Cin => Cin, S => S, Cout => Cout);
        
    UUT3: entity work.scazator8
                port map (X => X, Y => Y, Bin => Bin, S => D, Bout => Bout);
                
                
    UUT4: entity work.radacina_patrata8 generic map(N =>8)
                port map(clk => clk, input => unsigned(X), done => done, sq_root => sq_root);
                
    UUT5:entity work.impartitor8
                port map (Q => X, M => Y, D=> coeficient, clk => clk, R => rest);
                

        
    process
    begin
        while now < 1000 ns loop
            wait for CLOCK_PERIOD / 2;
            Clk <= not Clk;
        end loop;
        wait;
    end process;

    process
    begin
        wait until rising_edge(Clk);

        rst <= '1';  
        wait for CLOCK_PERIOD * 2;
        rst <= '0';  

        wait for CLOCK_PERIOD;

        X <= "00000101";
        Y <= "00000010";  

        wait for 100 ns;
        wait;
    end process;

    process
    begin
        while now < 1000 ns loop
            wait for CLOCK_PERIOD;
   
        end loop;
        wait;
    end process;

end testbench;

