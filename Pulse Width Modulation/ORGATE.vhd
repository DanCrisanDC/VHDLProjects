library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ORGATE is 
	port(A: in std_logic;
		  B: in std_logic;
		  C: out std_logic);
end entity;

architecture ORGATE_A of ORGATE is
begin 
	C<= A or B;
end architecture;