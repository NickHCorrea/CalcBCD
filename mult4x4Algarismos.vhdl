library IEEE;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity mult4x4Algarismos is
    Port(entrada_A: in STD_LOGIC_VECTOR(15 downto 0);
         entrada_b: in STD_LOGIC_VECTOR(15 downto 0);
         saida:     out STD_LOGIC_VECTOR(31 downto 0));
end entity mult4x4Algarismos;

architecture bev of mult4x4Algarismos is
    
    component mult4Algarismos is
        Port(Linha: in std_logic_vector(15 downto 0);
         Algarismo: in std_logic_vector( 3 downto 0);
         saida: out std_logic_vector(19 downto 0));
    end component;
	 
	 component  Shiftde20Bits is
    Port ( A : in  STD_LOGIC_VECTOR(19 downto 0);
			  N : in STD_LOGIC_VECTOR(1 downto 0);
           S : out  STD_LOGIC_VECTOR(31 downto 0));
		end component;
	component soma8Algarismos is 
      Port ( A8: in STD_LOGIC_VECTOR(31 downto 0);
				 B8: in STD_LOGIC_VECTOR(31 downto 0);
				 S8: out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	 
signal result1, result2, result3, result4:std_logic_vector(19 downto 0);  
signal alg1B, alg2B, alg3B, alg4B: std_logic_vector( 3 downto 0);
signal res32_1, res32_2, res32_3, res32_4: std_logic_vector(31 downto 0);
signal parcsum1, parcsum2: std_logic_vector(31 downto 0);
begin

alg1B <= entrada_b(15 downto 12); --Mais significativo
alg2B <= entrada_b(11 downto 8);
alg3B <= entrada_b(7 downto 4);
alg4B <= entrada_b(3 downto 0);	--Menos signigicativo

mult1: mult4Algarismos port map(entrada_A, alg1B, result1); --Mais significativo -> mais shift
mult2: mult4Algarismos port map(entrada_A, alg2B, result2);
mult3: mult4Algarismos port map(entrada_A, alg3B, result3);
mult4: mult4Algarismos port map(entrada_A, alg4B, result4); --Menos significativo -> menos shift
    
shift1: Shiftde20Bits port map(result1, "11", res32_1);
shift2: Shiftde20Bits port map(result2, "10", res32_2);
shift3: Shiftde20Bits port map(result3, "01", res32_3);
shift4: Shiftde20Bits port map(result4, "00", res32_4);

soma0: soma8Algarismos port map(res32_4, res32_3, parcsum1);
soma1: soma8Algarismos port map(res32_2, res32_1, parcsum2);
soma2: soma8Algarismos port map(parcsum1, parcsum2, saida);

	 
end bev;