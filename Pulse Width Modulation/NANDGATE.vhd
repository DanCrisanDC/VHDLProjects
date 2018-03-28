library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity NANDGATE is 
	port(A: in std_logic;
		  B: in std_logic;
		  C: out std_logic);
end entity;

architecture NANDGATE_A of NANDGATE is
begin 
	C<= not (A and B);
end architecture;