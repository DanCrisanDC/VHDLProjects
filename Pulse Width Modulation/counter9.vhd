library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter9 is		   
	port(CLK:in std_logic;
	RST:in std_logic;
	q:out std_logic_vector(8 downto 0);
	TC: out std_logic);
end counter9;

architecture counter9_a of counter9 is	
begin
	process(CLK,RST)
	variable c:std_logic_vector(8 downto 0);
	begin	
		if(RST='1') then 
			c:="000000000";					   
		else if(CLK'EVENT and CLK='1') then
			if (c="111111111") then c:="000000000"; TC <='1';	 
			else 
				c:=c+1; TC<='0';
			end if;
			end if;
		end if;
		q<=c;
		end process;
end counter9_a;
