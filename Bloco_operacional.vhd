library ieee;
use ieee.std_logic_1164.all;

entity bloco_operacional is
    port (clock,clear,w,r: in std_logic;
        w_data : in std_logic_vector(12 downto 0);
        r_data : out std_logic_vector(12 downto 0);
	cheia,vazia: out std_logic
    );
end bloco_operacional;

architecture log of bloco_operacional is

component contador is
    Port (
        clock,clear,r,w: in std_logic;
	cont : out std_logic_vector(3 downto 0)
    );
end component contador;

component banco_reg is
    Port (
        clock,w,r: in std_logic;
	cont: in std_logic_vector(3 downto 0);
        w_data : in std_logic_vector(12 downto 0);
        r_data : out std_logic_vector(12 downto 0)
    );
end component banco_reg;

component verificar_cont is 
	port( Cont: in std_logic_vector (3 downto 0);
        Wr, Rd, clock, clear: in std_logic;
        Banco_vazio, Banco_cheio: out std_logic);
end component verificar_cont;

component registrador is
    Port (
        clock,load,w: in std_logic;
        data : in std_logic_vector(12 downto 0);
        data_reg : out std_logic_vector(12 downto 0)
    );
end component registrador;

signal cont: std_logic_vector(3 downto 0);

begin
	ponteiro: contador port map(clock,clear,r,w,cont);
	regs: banco_reg port map(clock,w,r,cont,w_data,r_data);
	cheio_vazio: verificar_cont port map(cont,w,r,clock,clear,vazia,cheia);
end log;
