library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Shiftde20Bits is
    Port ( A: in  STD_LOGIC_VECTOR(19 downto 0);
	   N: in STD_LOGIC_VECTOR(1 downto 0);
           S: out  STD_LOGIC_VECTOR(31 downto 0));
end Shiftde20Bits;

architecture Behavioral of Shiftde20Bits is
begin
process(N,A) 
begin 
	if (N = "00") then
	S <= x"000" & A; 
	
	elsif (N = "01") then 
	S <= x"00" & A & x"0";
	
	elsif (N = "10") then 
	S <= x"0" & A & x"00";
	
	elsif (N = "11") then 
	S <= A & x"000";
	end if;
end process;

end Behavioral;

