library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TOP_LEVEL is 
	port(CLK: in std_logic; 
		  SEL: in std_logic;
		  R: in Std_logic;
		  LED: out std_logic_vector(7 downto 0); 
		  INPUT: in std_logic_vector(6 downto 0));
end entity;

architecture A1 of TOP_LEVEL is 

component Automat is 
	port (CLK: in std_logic; 
			LED: out std_logic_vector(7 downto 0);
			R: in std_logic);
end component;

component manual is 
 port (INPUT: in std_logic_vector (6 downto 0);
		CLK: in std_logic;
		LED: out std_logic_vector(7 downto 0);
		R: in std_logic);
end component;

component MUX8 is 
	port (sel: in std_logic;
			I: out std_logic_vector(7 downto 0);
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0));
end component;


component DMUX1_2 is 
	port (sel: in std_logic;
			I: in std_logic;
			A: out std_logic;
			B: out std_logic);
	end component; 

component MUX2_1 is 
	port (sel: in std_logic;
			I: out std_logic;
			A: in std_logic;
			B: in std_logic);
	end component; 
	
	
	
	signal Ledauto, Ledman: std_logic_vector(7 downto 0);
	signal auto, man: std_logic;
	
	begin 
	G1: DMUX1_2 port map(SEL, CLK, auto, man);
	G2: automat port map(auto, Ledauto, R);
	G3: manual port map (INPUT,man,Ledman, R);
   G4: MUX8 port map (sel, LED, Ledauto, Ledman);
end architecture;
	
	
