library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity manual is 
 port (INPUT: in std_logic_vector (6 downto 0);
		CLK: in std_logic;
		LED: out std_logic_vector(7 downto 0);
		R: in std_logic);
end entity;

architecture manual_a of manual is 
	
component registru is
 port (LOAD : in std_logic;
		D: in std_logic_vector(6 downto 0);
		Q: out std_logic_vector (6 downto 0);
		CLK: in std_logic);
end component;

component counter7 is		   
	port(CLK:in std_logic;
	RST:in std_logic;
	q:out std_logic_vector(6 downto 0);
	TC: out std_logic);
end component;

component Div_Special is
	port(CLK:in std_logic; 
	RST:in std_logic;
	New_CLK:out std_logic);
end component;

component comparator is 
	port (A: in std_logic_vector (6 downto 0);
			B: in std_logic_vector (6 downto 0);
			AB: out std_logic_vector(7 downto 0);
			BA: out std_logic_vector(7 downto 0));
end component;


signal CLK_BUN: std_logic;
signal iesire_counter: std_logic_vector(6 downto 0);
signal Terminal: std_logic;
signal iesire_registru: std_logic_vector(6 downto 0);
signal BAA: std_logic_vector(7 downto 0);

begin 
		INS1: Div_Special port map (CLK, R, CLK_BUN);
		INS2: counter7 port map (CLK_BUN, R, iesire_counter, terminal);
		INS3: registru port map (terminal, INPUT, iesire_registru, CLK_BUN);
		INS4: comparator port map (iesire_registru, iesire_counter, led, BAA);
end architecture;


