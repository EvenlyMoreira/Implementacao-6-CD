library ieee;
use ieee.std_logic_1164.all;

entity contador is
    Port (
        clock,clear,r,w: in std_logic;
	cont : out std_logic_vector(3 downto 0)
    );
end contador;

architecture log of contador is
	component ffjk is
	port (
        ck, clr, set, j, k, en : in  std_logic;
        q,notq: out std_logic
        );
	end component ffjk;

signal Q,notQ: std_logic_vector(3 downto 0);
signal en,and0,and1,and2,and3,and4,and5,jk1,jk2,jk3: std_logic;

begin
    en <= w or r;
    and0 <= Q(0) and w;
    and1 <= notQ(0) and r;
    jk1 <= and0 or and1;
    and2 <= Q(1) and and0;
    and3 <= notQ(1) and and1;
    jk2 <= and2 or and3;
    and4 <= Q(2) and and2;
    and5 <= notQ(2) and and3;
    jk3 <= and4 or and5;

    FF_0: ffjk port map (Clock,clear,'1','1','1',en,Q(0),notQ(0));
    FF_1: ffjk port map (Clock,clear,'1',jk1,jk1,en,Q(1),notQ(1));
    FF_2: ffjk port map (Clock,clear,'1',jk2,jk2,en,Q(2),notQ(2));
    FF_3: ffjk port map (Clock,clear,'1',jk3,jk3,en,Q(3),notQ(3));

    cont <= Q;
end log;