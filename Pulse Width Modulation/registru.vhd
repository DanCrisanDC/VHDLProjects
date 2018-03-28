	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;

	entity registru is
	 port (LOAD : in std_logic;
			D: in std_logic_vector(6 downto 0);
			Q: out std_logic_vector (6 downto 0);
			CLK: in std_logic);
		end entity;

	architecture registru_a of registru is
	begin 
		P: process (CLK, LOAD, D)
			begin 
			if (CLK'EVENT and CLK = '1' and LOAD = '1') then 
					Q <=D;
			end if ;
		end process;
	end architecture;