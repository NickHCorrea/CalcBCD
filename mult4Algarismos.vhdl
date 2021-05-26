library IEEE;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity mult4Algarismos is 
    Port(Linha: in std_logic_vector(15 downto 0);
         Algarismo: in std_logic_vector( 3 downto 0);
         saida: out std_logic_vector(19 downto 0));
end entity mult4Algarismos;

architecture bev of mult4Algarismos is
    component multAlgarismo is 
        Port(entrada_A: in STD_LOGIC_VECTOR (3 downto 0);
                entrada_B: in STD_LOGIC_VECTOR (3 downto 0);
                carry_in:  in STD_LOGIC_VECTOR (3 downto 0);
                saida:     out STD_LOGIC_VECTOR (3 downto 0);
                carry_out: out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal digito0, digito1, digito2, digito3: STD_LOGIC_VECTOR(3 downto 0);
    signal carry_mult0, carry_mult1, carry_mult2, carry_mult3: STD_LOGIC_VECTOR(3 downto 0);
    signal saida_mult0, saida_mult1, saida_mult2, saida_mult3: STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
digito0 <= Linha(3 downto 0);
digito1 <= Linha(7 downto 4);
digito2 <= Linha(11 downto 8);
digito3 <= Linha(15 downto 12);
    
mult0: multAlgarismo port map(digito0, Algarismo, "0000", saida_mult0, carry_mult0);
mult1: multAlgarismo port map(digito1, Algarismo, carry_mult0, saida_mult1, carry_mult1);
mult2: multAlgarismo port map(digito2, Algarismo, carry_mult1, saida_mult2, carry_mult2);
mult3: multAlgarismo port map(digito3, Algarismo, carry_mult2, saida_mult3, carry_mult3);

saida <= carry_mult3 & saida_mult3 & saida_mult2 & saida_mult1 & saida_mult0;
end bev;