library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter7 is		   
	port(CLK:in std_logic;
	RST:in std_logic;
	q:out std_logic_vector(6 downto 0);
	TC: out std_logic);
end counter7;

architecture counter7_a of counter7 is	
begin
	process(CLK,RST)
	variable c:std_logic_vector(6 downto 0);
	begin	
		if(RST='1') then 
			c:="0000000";					   
		else if(CLK'EVENT and CLK='1') then
			if (c="1111111") then c:="0000000"; TC <='1';	 
			else 
				c:=c+1; TC<='0';
			end if;
			end if;
		end if;
		q<=c;
		end process;
end counter7_a;
