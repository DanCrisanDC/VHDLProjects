library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BistabilT is 
port (CLK: in std_logic;
		T: in std_logic;
		Q: out std_logic;
		R: in std_logic);
end BistabilT;

architecture BistabilT_a of BistabilT is 
signal Temp: std_logic;
begin
			P1: process (CLK, R)
			begin 
				if (R = '1') then 
				temp <= '0';
				elsif (CLK'EVENT and CLK = '1') then 
					Temp <= not T;
				end if;
			end process;
		Q<=Temp;
	end architecture;
				