library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity BistabilTC is 
port (CLK: in std_logic;
		Q: out std_logic;
		R: in std_logic);
end BistabilTC;

architecture BistabilTC_a of BistabilTC is 
signal Temp: std_logic;
signal TC: std_logic;
begin
			P1: process (CLK, R,temp)
			begin 
				if (R = '1') then 
				temp <= '0';
				elsif (CLK'EVENT and CLK = '1') then 
					Temp <= not Temp;
				end if;
				if (temp='1') then 
					TC <= '1';
				end if;
			end process;
		Q<=TC;
	end architecture;
				