library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity soma4Algarismos is 
      Port ( A4: in STD_LOGIC_VECTOR(15 downto 0);
				 B4: in STD_LOGIC_VECTOR(15 downto 0);
				 S4: out STD_LOGIC_VECTOR(15 downto 0);
				 Cout4: out STD_LOGIC);
end soma4Algarismos;

architecture Behavioral of soma4Algarismos is 

component somaAlgarismo is
		Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
				 B: in STD_LOGIC_VECTOR(3 downto 0);
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC_VECTOR(3 downto 0);
				 Cout: out STD_LOGIC);
end component;

signal c1,c2,c3,c4: STD_LOGIC;
signal alg1A, alg2A, alg3A, alg4A, alg1B, alg2B, alg3B, alg4B, alg1S, alg2S, alg3S, alg4S: STD_LOGIC_VECTOR(3 downto 0);
begin

alg1A <= A4(15 downto 12);  -- Mais significativo	
alg2A <= A4(11 downto 8);
alg3A <= A4(7 downto 4);
alg4A <= A4(3 downto 0);  -- Menos significativo

alg1B <= B4(15 downto 12);  -- Mais significativo	
alg2B <= B4(11 downto 8);
alg3B <= B4(7 downto 4);
alg4B <= B4(3 downto 0); -- Menos significativo

Soma4: component somaAlgarismo port map(alg4A, alg4B, '0', alg4S, c4);
Soma3: component somaAlgarismo port map(alg3A, alg3B, c4, alg3S, c3);
Soma2: component somaAlgarismo port map(alg2A, alg2B, c3, alg2S, c2);
Soma1: component somaAlgarismo port map(alg1A, alg1B, c2, alg1S, c1);

S4 <= alg1S & alg2S & alg3S & alg4S;
Cout4 <= c1;

	
end Behavioral;
