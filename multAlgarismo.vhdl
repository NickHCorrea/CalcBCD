library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
	
entity multAlgarismo is
    
    port(
    entrada_A: in STD_LOGIC_VECTOR (3 downto 0);
    entrada_B: in STD_LOGIC_VECTOR (3 downto 0);
    carry_in:  in STD_LOGIC_VECTOR (3 downto 0);
    saida:     out STD_LOGIC_VECTOR (3 downto 0);
    carry_out: out STD_LOGIC_VECTOR (3 downto 0));

end entity multAlgarismo;

architecture bev of multAlgarismo is

signal mult_temp: unsigned(7 downto 0);
signal saida_tmp: unsigned(7 downto 0);
signal carry_tmp: unsigned(7 downto 0);
signal carry_tmp_vector, saida_tmp_vector: std_logic_vector(7 downto 0);
begin
mult_temp <= (unsigned(entrada_A) * unsigned(entrada_B)) + unsigned(carry_in);

carry_tmp <= mult_temp / 10;
carry_tmp_vector <= STD_LOGIC_VECTOR(carry_tmp);
carry_out <= carry_tmp_vector(3 downto 0);

saida_tmp <= mult_temp mod 10;
saida_tmp_vector <= STD_LOGIC_VECTOR(saida_tmp);
saida <= saida_tmp_vector(3 downto 0);

end bev;