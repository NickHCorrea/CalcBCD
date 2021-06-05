library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity softwareFinal is
	Port (inputVector : in STD_LOGIC_VECTOR(15 downto 0);
	      inputOp	  : in STD_LOGIC_VECTOR(0 downto 0);
	      inputButtons: in STD_LOGIC_VECTOR(2 downto 0);
	      inputClk	  : in STD_LOGIC;
	      outputHex	  : out STD_LOGIC_VECTOR(31 downto 0);
	      outputLed	  : out STD_LOGIC_VECTOR(1 downto 0));
end softwareFinal;

architecture Behavioral of softwareFinal is

signal varA, varB: STD_LOGIC_VECTOR(15 downto 0);
signal LdA, LdB: STD_LOGIC;
signal res: STD_LOGIC;
signal A_flag, B_flag: STD_LOGIC;
signal resSoma, resMult: STD_LOGIC_VECTOR(31 downto 0);

	component sequencia_numero is
	Port(entrada: in STD_LOGIC_VECTOR(15 downto 0);
	     ld_A, ld_B      : in STD_LOGIC;
	     reset	         : in STD_LOGIC;
	     clock           : in STD_LOGIC;
	     saida_A, saida_B: out STD_LOGIC_VECTOR(15 downto 0);
	     flagA, flagB    : out STD_LOGIC);
	end component;
	
	component calcBCD is
	Port(A,B  : in STD_LOGIC_VECTOR(15 downto 0);
	     op	  : in STD_LOGIC_VECTOR(0 downto 0);
             Saida: out STD_LOGIC_VECTOR(31 downto 0));
	end component;

begin
	LdA <= inputButtons(2);
	LdB <= inputButtons(1);
	res <= inputButtons(0);
	
	assign: sequencia_numero port map(inputVector, LdA, LdB, res, inputClk, varA, varB, A_flag, B_flag);
	soma: calcBCD port map(varA, varB, "0", resSoma);
	mult: calcBCD port map(varA, varB, "1", resMult);
	-- Concatenação dos valores já inseridos
	outputLed <= A_flag & B_flag;
	
	process(inputOp, inputClk)
	begin
		if (B_flag = '1') then
			if (inputOp = "0") then
				outputHex <= resSoma;
			elsif (inputOp = "1") then
				outputHex <= resMult;
			end if;
		else  
			outputHex <= x"0000" & inputVector;
		end if;
	end process;
end Behavioral;
