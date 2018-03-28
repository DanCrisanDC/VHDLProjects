library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MUX7 is 
	port (sel: in std_logic;
			I: out std_logic_vector(6 downto 0);
			A: in std_logic_vector(6 downto 0);
			B: in std_logic_vector(6 downto 0));
	end entity; 

architecture MUX7_a of MUX7 is
begin 
	P: process (sel,A,B)
	begin 
		case sel is 
			when '0' => I<=A;
			when '1' => I<=B;
			when others => I<="0000000";
	end case;
	end process;
end architecture;