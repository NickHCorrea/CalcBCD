library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interface is 
	Port(SW 	           : in STD_LOGIC_VECTOR(16 downto 0); -- 16 até 1 é o vetor e 0 é a op
	     KEY		   : in STD_LOGIC_VECTOR(2 downto 0);-- 2 - set A, 1 - set B, 0 - reset
	     CLOCK_50              : in STD_LOGIC;
	     HEX0, HEX1, HEX2, HEX3:	out STD_LOGIC_VECTOR(6 downto 0); 
	     HEX4, HEX5, HEX6, HEX7: out STD_LOGIC_VECTOR(6 downto 0);
	     LEDG		   : out STD_LOGIC_VECTOR(1 downto 0));
end interface;

architecture Behavioral of interface is 

signal alg1, alg2, alg3, alg4, alg5, alg6, alg7, alg8: STD_LOGIC_VECTOR(3 downto 0);
signal mostra: STD_LOGIC_VECTOR(31 downto 0);

component softwareFinal is
	Port (inputVector : in STD_LOGIC_VECTOR(15 downto 0);
	      inputOp     : in STD_LOGIC_VECTOR(0 downto 0);
	      inputButtons: in STD_LOGIC_VECTOR(2 downto 0);
	      inputClk	  : in STD_LOGIC;
              outputHex	  : out STD_LOGIC_VECTOR(31 downto 0);
	      outputLed	  : out STD_LOGIC_VECTOR(1 downto 0));

end component;

component hex7display is
    Port (A   : in  STD_LOGIC_VECTOR (3 downto 0);
          seg7: out  STD_LOGIC_VECTOR (6 downto 0)
             );
end component;

begin 
	soft: softwareFinal port map(SW(16 downto 1), SW(0 downto 0), not KEY, CLOCK_50, mostra, LEDG);
	
	alg1 <= mostra(31 downto 28);
	alg2 <= mostra(27 downto 24);
	alg3 <= mostra(23 downto 20);
	alg4 <= mostra(19 downto 16);
	alg5 <= mostra(15 downto 12);
	alg6 <= mostra(11 downto 8);
	alg7 <= mostra(7 downto 4);
	alg8 <= mostra(3 downto 0);
	
	hex_0: hex7display port map(alg8, HEX0);
	hex_1: hex7display port map(alg7, HEX1);
	hex_2: hex7display port map(alg6, HEX2);
	hex_3: hex7display port map(alg5, HEX3);
	hex_4: hex7display port map(alg4, HEX4);
	hex_5: hex7display port map(alg3, HEX5);
	hex_6: hex7display port map(alg2, HEX6);
	hex_7: hex7display port map(alg1, HEX7);
	
end Behavioral;
