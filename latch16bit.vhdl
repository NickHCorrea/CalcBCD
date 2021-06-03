library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity latch16bit is
	Port(
		entrada:	in STD_LOGIC_VECTOR(15 downto 0);
		resetar, enable:	in STD_LOGIC;
		saida:	out STD_LOGIC_VECTOR(15 downto 0));
end latch16bit;

architecture Behavioral of latch16bit is

	component latch1bit is
		Port (set	: in STD_LOGIC;
				reset	: in STD_LOGIC;
				enable: in STD_LOGIC;
				Q		: out STD_LOGIC);
	end component;

begin

	bit0:	latch1bit port map(entrada(0), resetar, enable, saida(0));
	bit1: latch1bit port map(entrada(1), resetar, enable, saida(1));
	bit2: latch1bit port map(entrada(2), resetar, enable, saida(2));
	bit3: latch1bit port map(entrada(3), resetar, enable, saida(3));
	bit4:	latch1bit port map(entrada(4), resetar, enable, saida(4));
	bit5: latch1bit port map(entrada(5), resetar, enable, saida(5));
	bit6: latch1bit port map(entrada(6), resetar, enable, saida(6));
	bit7: latch1bit port map(entrada(7), resetar, enable, saida(7));
	bit8:	latch1bit port map(entrada(8), resetar, enable, saida(8));
	bit9: latch1bit port map(entrada(9), resetar, enable, saida(9));
	bit10: latch1bit port map(entrada(10), resetar, enable, saida(10));
	bit11: latch1bit port map(entrada(11), resetar, enable, saida(11));
	bit12: latch1bit port map(entrada(12), resetar, enable, saida(12));
	bit13: latch1bit port map(entrada(13), resetar, enable, saida(13));
	bit14: latch1bit port map(entrada(14), resetar, enable, saida(14));
	bit15: latch1bit port map(entrada(15), resetar, enable, saida(15));
end Behavioral;