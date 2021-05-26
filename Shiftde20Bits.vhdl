library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Shiftde20Bits is
    Port ( A : in  STD_LOGIC_VECTOR(19 downto 0);
			  N : in STD_LOGIC_VECTOR(1 downto 0);
           S : out  STD_LOGIC_VECTOR(31 downto 0));
end Shiftde20Bits;

architecture Behavioral of Shiftde20Bits is
begin
process(N,A) 
begin 
	if (N = "00") then
	S <= "000000000000" & A; 
	elsif (N = "01") then 
	S <= "00000000" & A & "0000";
	elsif (N = "10") then 
	S <= "0000" & A & "00000000";
	elsif (N = "11") then 
	S <= A & "000000000000";
	end if;
end process;

end Behavioral;

