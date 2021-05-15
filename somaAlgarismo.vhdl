library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity somaAlgarismo is
		Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
				 B: in STD_LOGIC_VECTOR(3 downto 0);
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC_VECTOR(3 downto 0);
				 Cout: out STD_LOGIC);
end somaAlgarismo;

architecture Behavioral of somaAlgarismo is 
signal soma, somacor: STD_LOGIC_VECTOR(4 downto 0);


begin

soma <= ('0' & A) + ('0' & B) + Cin;
somacor <= soma - "01010";
	process (soma)
	begin
	if (soma > "01001") then
		 Cout <= '1';
		 S <= somacor(3 downto 0);
	else
		Cout <= '0';
		S <= soma(3 downto 0);
		
	end if;
	end process;
end Behavioral;
