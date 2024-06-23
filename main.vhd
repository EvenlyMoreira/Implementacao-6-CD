library ieee;
use ieee.std_logic_1164.all;

entity main is
    port (KEY1,KEY2,KEY3,CLOCK_50: in  std_logic;
          SW : in std_logic_vector(12 downto 0);
          HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0);
	  LEDR0,LEDR1: out std_logic);
end main;

architecture log of main is

component seg7 is
    port (w,x,y,z: in  std_logic;
            led: out std_logic_vector(6 downto 0));
end component seg7;

component LIFO is
    port (rd,wr,clr_lifo: in  std_logic; --KEY1,KEY2,KEY3
	  clk: in std_logic; --clock_50
          w_data : in std_logic_vector(12 downto 0);
          r_data : out std_logic_vector(12 downto 0);
          em,fu: out std_logic --LEDR0,LEDR1
);
end component LIFO;

component bin_bcd is
    port (SW: in  std_logic_vector(12 downto 0);
           mil,cent, dez, uni : out std_logic_vector(3 downto 0));
end component bin_bcd;

signal r_data: std_logic_vector(12 downto 0);
signal mil,cent, dez, uni : std_logic_vector(3 downto 0);

begin
	LI_FO: LIFO port map(KEY1,KEY2,KEY3,CLOCK_50,SW,r_data,LEDR0,LEDR1);
	binbcd: bin_bcd port map(r_data,mil,cent,dez,uni);
	display_uni: seg7 port map(uni(3),uni(2),uni(1),uni(0),HEX0);
	display_dez: seg7 port map(dez(3),dez(2),dez(1),dez(0),HEX1);
	display_cent: seg7 port map(cent(3),cent(2),cent(1),cent(0),HEX2);
	display_mil: seg7 port map(mil(3),mil(2),mil(1),mil(0),HEX3);
	
end log;
