library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MUX2_1 is 
	port (sel: in std_logic;
			I: out std_logic;
			A: in std_logic;
			B: in std_logic);
	end entity; 

architecture MUX2_1_a of MUX2_1 is
begin 
	P: process (sel, A,B)
	begin 
		case sel is 
			when '0' => I<=A;
			when '1' => I<=B;
			when others => I<='0';
	end case;
	end process;
end architecture;