library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY register16 IS PORT(
    d      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- Entrada
    ld     : IN STD_LOGIC; -- Load
    clr    : IN STD_LOGIC; -- Clear assíncrono
    clk    : IN STD_LOGIC; -- Clock
    q      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- Saída
    flag_ld: OUT STD_LOGIC := '0' -- Flag de Load
);
END register16;

ARCHITECTURE description OF register16 IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= x"0000"; -- Insire um vetor de 16 bits com valores em 0
	    flag_ld <= '0'; 
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
		flag_ld <= '1'; 
            end if;
        end if;
    end process;
END description; 
