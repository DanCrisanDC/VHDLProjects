library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Automat is 
	port (CLK: in std_logic; 
			LED: out std_logic_vector(7 downto 0);
			R: in std_logic);
end entity;

architecture Automat_a of automat is 

component counter8 is		   
	port(CLK:in std_logic;
	RST:in std_logic;
	q:out std_logic_vector(7 downto 0);
	TC: out std_logic);
end component;

component counter9 is		   
	port(CLK:in std_logic;
	RST:in std_logic;
	q:out std_logic_vector(8 downto 0);
	TC: out std_logic);
end component;

component Div_1hz is
	port(CLK:in std_logic; 
	RST:in std_logic;
	New_CLK:out std_logic;
	enable: in std_logic);
end component;

component Div0_4 is
	port(CLK:in std_logic; 
	RST:in std_logic;
	New_CLK:out std_logic;
	enable: in std_logic);
end component;


component MUX2_1 is 
	port (sel: in std_logic;
			I: out std_logic;
			A: in std_logic;
			B: in std_logic);
end component;

component registru is
 port (LOAD : in std_logic;
		D: in std_logic_vector(6 downto 0);
		Q: out std_logic_vector (6 downto 0);
		CLK: in std_logic);
end component;

component dmux1_2 is 
	port (sel: in std_logic;
			I: in std_logic;
			A: out std_logic;
			B: out std_logic);
end component; 


component MUX7 is 
	port (sel: in std_logic;
			I: out std_logic_vector(6 downto 0);
			A: in std_logic_vector(6 downto 0);
			B: in std_logic_vector(6 downto 0));
end component; 

component comparator is 
	port (A: in std_logic_vector (6 downto 0);
			B: in std_logic_vector (6 downto 0);
			AB: out std_logic_vector(7 downto 0);
			BA: out std_logic_vector(7 downto 0));
end component;

component Div_Special is
	port(CLK:in std_logic; 
	RST:in std_logic;
	New_CLK:out std_logic);
end component;

component MUX8 is 
	port (sel: in std_logic;
			I: out std_logic_vector(7 downto 0);
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0));
	end component;

signal CE: std_logic := '1'; 
signal CE1hz: std_logic;
signal CE04hz: std_logic;
signal Clock1hz: std_logic;
signal Clock04hz: std_logic;
signal CLKNUM: std_logic;
signal NUMOUT: std_logic_vector(8 downto 0);
signal terminal :std_logic;
signal terminalTC: std_logic;
signal sel :std_logic;
signal MUXOUT: std_logic_vector(6 downto 0);
signal CLKSPEC: std_logic;
signal REGOUT: std_logic_vector (6 downto 0);
signal NUMOUT1: std_logic_vector(7 downto 0);
signal NUMNEG1: std_logic_vector(6 downto 0);
signal TCNUM: std_logic; 
signal MUX7OUT: std_logic_vector(6 downto 0);
signal REGMUX: std_logic_vector(7 downto 0);
signal MUXREG: std_logic_vector(7 downto 0);
signal NUMOUT6:std_logic_vector(6 downto 0);
signal NOTNUMOUT6:std_logic_vector(6 downto 0);
signal NUMOUT16:std_logic_vector(6 downto 0);

begin

	process (CLKNUM)
	begin
	for i in 0 to 6 loop
	NUMOUT6(i)<=NUMOUT(i);
	NOTNUMOUT6(i)<=not NUMOUT6(i);
	end loop;
	end process;
	
	process (CLKSPEC)
	begin
	for i in 0 to 6 loop
	NUMOUT16(i)<=NUMOUT1(i);
	end loop;
	end process;


 G1: dmux1_2 port map (NUMOUT(8), CE, CE1hz, CE04hz);
 G2: Div_1hz port map (CLK, R, Clock1hz, CE1hz);
 G3: Div0_4 port map (CLK, R, Clock04hz, CE04hz);
 G4: MUX2_1 port map (NUMOUT(8) , CLKNUM, Clock1hz, Clock04hz);
 G5: counter9 port map (CLKNUM, R, NUMOUT, terminal);
 G6: MUX7 port map(NUMOUT(7),MUXOUT,NUMOUT6,NOTNUMOUT6);
 G7: Div_Special port map (CLK, R, CLKSPEC);
 G8: registru port map (TCNUM, NUMOUT6, REGOUT, CLKSPEC);
 G9: counter8 port map (CLKSPEC, R, NUMOUT1, TCNUM);
 NUMNEG1 <= not NUMOUT16; 
 G10:MUX7 port map(NUMOUT(7),MUX7OUT,NUMOUT16, NUMNEG1);
 G11: Comparator port map(REGOUT, MUX7OUT, REGMUX, MUXREG);
 G12: MUX8 port map (NUMOUT(7),LED,REGMUX, MUXREG);
		
end architecture;
