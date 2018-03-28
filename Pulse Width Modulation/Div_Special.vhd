library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Div_Special is
	port(CLK:in std_logic; 
	RST:in std_logic;
	New_CLK:out std_logic);
end Div_Special;

architecture Div_Special_A of Div_Special is	   
begin
	process(CLK,RST)					   
	variable count:std_logic_vector(24 downto 0);
	variable k:std_logic;
	begin
			if (RST='1') then
				count:=(others=>'0');
				New_CLK<='0';
				k:='0';
			else			 
				if (CLK'EVENT and CLK='1') then 
					if count=200 then
						k:=not(k);
						New_CLK<=k;
						count:=(others=>'0');
					else
						count:=count+1;
				end if;
			end if;
		end if;
	end process;
end Div_Special_A; 						