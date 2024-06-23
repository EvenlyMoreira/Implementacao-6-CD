library ieee;
use ieee.std_logic_1164.all;

entity LIFO is
    port (rd,wr,clr_lifo: in  std_logic; --KEY1,KEY2,KEY3
	  clk: in std_logic; --clock_50
          w_data : in std_logic_vector(12 downto 0);
          r_data : out std_logic_vector(12 downto 0);
          em,fu: out std_logic --LEDR0,LEDR1
);
end LIFO;

architecture log of LIFO is

component bloco_operacional is
    port (clock,clear,w,r: in std_logic;
        w_data : in std_logic_vector(12 downto 0);
        r_data : out std_logic_vector(12 downto 0);
	cheia,vazia: out std_logic
    );
end component bloco_operacional;

component mde_implementacao06 is
   port (ck, rst : in  std_logic;
         wr, rd, vazia, cheia: in  std_logic;
         r, w, clr: out std_logic;
	 s : out std_logic_vector(1 downto 0)   
	);
end component mde_implementacao06;

signal w,r,clr,nclr,cheia,vazia: std_logic;
signal s : std_logic_vector(1 downto 0);

begin
	nclr <= not(clr);
	operacional: bloco_operacional port map(clk,nclr,w,r,w_data,r_data,cheia,vazia);
	controle: mde_implementacao06 port map(clk,clr_lifo,wr,rd,vazia,cheia,r,w,clr,s);
        em <= vazia;
	fu <= cheia;
end log;
