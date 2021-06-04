library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequencia_numero is
	Port( entrada         : in STD_LOGIC_VECTOR(15 downto 0);
			ld_A, ld_B      : in STD_LOGIC;
			clr_A, clr_B    : in STD_LOGIC;
			clock           : in STD_LOGIC;
			saida_A, saida_B: out STD_LOGIC_VECTOR(15 downto 0);
			saida_mostrando : out STD_LOGIC_VECTOR(31 downto 0));
end sequencia_numero;

architecture Behavioral of sequencia_numero is

	signal A, B: STD_LOGIC_VECTOR(15 downto 0);
	signal ativo_latch_A, ativo_latch_B: std_logic := '0';

	component register16 is
		PORT(
			d   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			ld  : IN STD_LOGIC; -- load/enable.
			clr : IN STD_LOGIC; -- async. clear.
			clk : IN STD_LOGIC; -- clock.
			q   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- output
			);
	end component;
begin

latch_Ahgfkjfdsbgjdsf: register16 port map(entrada, ld_a, '0', clock, saida_A);
latch_Bgdskjhgdslkjfh: register16 port map(entrada, ld_B, '0', clock, saida_B);

end Behavioral;