library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity soma8Algarismos is 
      Port ( A8: in STD_LOGIC_VECTOR(31 downto 0);
				 B8: in STD_LOGIC_VECTOR(31 downto 0);
				 S8: out STD_LOGIC_VECTOR(31 downto 0));
end soma8Algarismos;

architecture Behavioral of soma8Algarismos is 

component somaAlgarismo is
		Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
				 B: in STD_LOGIC_VECTOR(3 downto 0);
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC_VECTOR(3 downto 0);
				 Cout: out STD_LOGIC);
end component;

signal c1,c2,c3,c4,c5,c6,c7,c8: STD_LOGIC;
signal alg1A, alg2A, alg3A, alg4A, alg5A, alg6A, alg7A, alg8A: STD_LOGIC_VECTOR(3 downto 0);
signal alg1B, alg2B, alg3B, alg4B, alg5B, alg6B, alg7B, alg8B: STD_LOGIC_VECTOR(3 downto 0);
signal alg1S, alg2S, alg3S, alg4S, alg5S, alg6S, alg7S, alg8S: STD_LOGIC_VECTOR(3 downto 0);
begin

alg1A <= A8(31 downto 28);	--Mais significativo
alg2A <= A8(27 downto 24);
alg3A <= A8(23 downto 20);
alg4A <= A8(19 downto 16);
alg5A <= A8(15 downto 12);	
alg6A <= A8(11 downto 8);
alg7A <= A8(7 downto 4);
alg8A <= A8(3 downto 0);   --Menos signigicativo

alg1B <= B8(31 downto 28);	--Mais significativo
alg2B <= B8(27 downto 24);
alg3B <= B8(23 downto 20);
alg4B <= B8(19 downto 16);
alg5B <= B8(15 downto 12);	
alg6B <= B8(11 downto 8);
alg7B <= B8(7 downto 4);
alg8B <= B8(3 downto 0);	--Menos signigicativo

Soma8: component somaAlgarismo port map(alg8A, alg8B, '0', alg8S, c8); -- Primeiro a soma do menos significativo, com carry in = 0
Soma7: component somaAlgarismo port map(alg7A, alg7B, c8, alg7S, c7);
Soma6: component somaAlgarismo port map(alg6A, alg6B, c7, alg6S, c6);
Soma5: component somaAlgarismo port map(alg5A, alg5B, c6, alg5S, c5);
Soma4: component somaAlgarismo port map(alg4A, alg4B, c5, alg4S, c4);
Soma3: component somaAlgarismo port map(alg3A, alg3B, c4, alg3S, c3);
Soma2: component somaAlgarismo port map(alg2A, alg2B, c3, alg2S, c2);
Soma1: component somaAlgarismo port map(alg1A, alg1B, c2, alg1S, c1);  -- Por último a soma do mais significativo, o carry out será ignorado

S8 <= alg1S & alg2S & alg3S & alg4S & alg5S & alg6S & alg7S & alg8S;	
end Behavioral;
