library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity somaAlgarismo is
		Port ( A   : in STD_LOGIC_VECTOR(3 downto 0); -- Entrada A
		       B   : in STD_LOGIC_VECTOR(3 downto 0); -- Entrada B
		       Cin : in STD_LOGIC; -- Carry In
		       S   : out STD_LOGIC_VECTOR(3 downto 0); -- Resultado
		       Cout: out STD_LOGIC); -- Carry Out
end somaAlgarismo;

architecture Behavioral of somaAlgarismo is 

signal soma, somacor: STD_LOGIC_VECTOR(4 downto 0);

begin
-- Os valores são somados utilizando a biblioteca Unsigned, aqui utilizam 
-- 5 bits para correção durante a operação
soma <= ('0' & A) + ('0' & B) + Cin; 
-- Essa soma é subtraída por 10, visto que o limite é 9 e não há soma 
-- entre dois números decimais que ultrapasse 20
somacor <= soma - "01010";
	process (soma)
	begin
	if (soma > "01001") then
		 Cout <= '1';
		 -- Se a soma for maior que 9, terá carry_out de 1 e o
		 -- resultado será o valor da soma - 10
		 S <= somacor(3 downto 0);
	else
		Cout <= '0';
		-- Caso contrário, o carry_out será 0 e o resultado será
		-- a soma normal
		S <= soma(3 downto 0);
	end if;
	end process;
end Behavioral;
