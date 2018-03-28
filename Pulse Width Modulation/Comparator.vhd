library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparator is 
	port (A: in std_logic_vector (6 downto 0);
			B: in std_logic_vector (6 downto 0);
			AB: out std_logic_vector(7 downto 0);
			BA: out std_logic_vector(7 downto 0));
end entity;

architecture comparator_a of comparator is 

begin
	P: process (A, B)
	begin 
		if (A>B) then 
		AB <= "11111111"; BA<="00000000";
		elsif (B>A) then
		BA <= "11111111"; AB<="00000000";
		end if;
		
	end process;
end architecture;
				