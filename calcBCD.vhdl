library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calcBCD is
	Port(
			A,B	: in STD_LOGIC_VECTOR( 15 downto 0);
			op		: in STD_LOGIC_VECTOR(0 downto 0);
			Saida : out STD_LOGIC_VECTOR( 31 downto 0));
end calcBCD;

architecture Behavioral of calcBCD is

signal resSoma: STD_LOGIC_VECTOR(15 downto 0);
signal resSoma32, resMult: STD_LOGIC_VECTOR( 31 downto 0);
signal carrySoma: STD_LOGIC;

component soma4Algarismos is 
      Port ( A4: in STD_LOGIC_VECTOR(15 downto 0);
				 B4: in STD_LOGIC_VECTOR(15 downto 0);
				 S4: out STD_LOGIC_VECTOR(15 downto 0);
				 Cout4: out STD_LOGIC);
end component;

component mult4x4Algarismos is
    Port(entrada_A: in STD_LOGIC_VECTOR(15 downto 0);
         entrada_b: in STD_LOGIC_VECTOR(15 downto 0);
         saida:     out STD_LOGIC_VECTOR(31 downto 0));
end component;

begin
	soma: soma4Algarismos port map(A, B, resSoma, carrySoma);
	mult: mult4x4Algarismos port map(A, B, resMult);
	
	process(carrySoma)
	begin
	if (carrySoma = '1') then
	resSoma32 <= x"0001" & resSoma;
	else
	resSoma32 <= x"0000" & resSoma;
	end if; 
	end process;
	process(op)
	begin
	if (op = "0") then
	Saida <= resSoma32;
	else
	Saida <= resMult;
	end if;
	end process;
end Behavioral;