library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DMUX1_2 is 
	port (sel: in std_logic;
			I: in std_logic;
			A: out std_logic;
			B: out std_logic);
	end entity; 

architecture DMUX1_2_a of DMUX1_2 is
begin 
	P: process (I, sel)
	begin 
		case sel is 
			when '0' => A<=I;B<='0';
			when '1' => B<=I;A<='0';
			when others => A<='0'; B<='0';
	end case;
	end process;
end architecture;