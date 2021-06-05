library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequencia_numero is
	Port( entrada         : in STD_LOGIC_VECTOR(15 downto 0);
			ld_A, ld_B      : in STD_LOGIC;
			reset			    : in STD_LOGIC;
			clock           : in STD_LOGIC;
			saida_A, saida_B: out STD_LOGIC_VECTOR(15 downto 0);
			flagA, flagB		 : out STD_LOGIC);
end sequencia_numero;

architecture Behavioral of sequencia_numero is

	signal A, B: STD_LOGIC_VECTOR(15 downto 0);

	component register16 is
		PORT(
			d   	 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			ld  	 : IN STD_LOGIC; -- load/enable.
			clr 	 : IN STD_LOGIC; -- async. clear.
			clk	 : IN STD_LOGIC; -- clock.
			q   	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- output
			flag_ld: OUT STD_LOGIC);
	end component;
begin

latch_A: register16 port map(entrada, ld_a, reset, clock, saida_A, flagA);
latch_B: register16 port map(entrada, ld_B, reset, clock, saida_B, flagB);

end Behavioral;