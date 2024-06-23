library ieee;
use ieee.std_logic_1164.all;

entity verificar_cont is 
	port( Cont: in std_logic_vector (3 downto 0);
        Wr, Rd, clock, clear: in std_logic;
        Banco_vazio, Banco_cheio: out std_logic);
end verificar_cont;

architecture log of verificar_cont is

component ffjk is
    port (ck, clr, set, j, k, en: in  std_logic;
            q,notq : out std_logic);
end component;

signal cont_0,q_jk,notq_jk,enable: std_logic;
begin
    cont_0 <= (not Cont(0)) and (not Cont(1)) and (not Cont(2)) and (not Cont(3));
    enable <= wr or rd;

    JK: ffjk port map(clock, clear, '1', Wr, Rd ,enable,q_jk,notq_jk);

    Banco_cheio<= q_jk and cont_0;
    Banco_vazio<= notq_jk and cont_0;
end log;