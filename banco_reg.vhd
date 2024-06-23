library ieee;
use ieee.std_logic_1164.all;

entity banco_reg is
    Port (
        clock,w,r: in std_logic;
	cont: in std_logic_vector(3 downto 0);
        w_data : in std_logic_vector(12 downto 0);
        r_data : out std_logic_vector(12 downto 0)
    );
end banco_reg;

architecture log of banco_reg is

component demux is
	port(   E : in std_logic;
		sel: in std_logic_vector(3 downto 0);
		S : out std_logic_vector(15 downto 0));
end component demux;

component mux_16entradas_13b is
    port (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15 : in  std_logic_vector(12 downto 0);
	  key: in std_logic_vector(3 downto 0);
          S: out std_logic_vector(12 downto 0)
);
end component mux_16entradas_13b;

component registrador is
    Port (
        clock,load: in std_logic;
        data : in std_logic_vector(12 downto 0);
        data_reg : out std_logic_vector(12 downto 0)
    );
end component registrador;

signal reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7: std_logic_vector(12 downto 0);
signal reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15:std_logic_vector(12 downto 0);
signal load: std_logic_vector(15 downto 0);
signal rdata: std_logic_vector(12 downto 0);

begin
    Dmux: demux port map(w,cont,load);
    Reg_0: registrador port map(clock,load(0),w_data,reg0);
    Reg_1: registrador port map(clock,load(1),w_data,reg1);
    Reg_2: registrador port map(clock,load(2),w_data,reg2);
    Reg_3: registrador port map(clock,load(3),w_data,reg3);
    Reg_4: registrador port map(clock,load(4),w_data,reg4);
    Reg_5: registrador port map(clock,load(5),w_data,reg5);
    Reg_6: registrador port map(clock,load(6),w_data,reg6);
    Reg_7: registrador port map(clock,load(7),w_data,reg7);
    Reg_8: registrador port map(clock,load(8),w_data,reg8);
    Reg_9: registrador port map(clock,load(9),w_data,reg9);
    Reg_10: registrador port map(clock,load(10),w_data,reg10);
    Reg_11: registrador port map(clock,load(11),w_data,reg11);
    Reg_12: registrador port map(clock,load(12),w_data,reg12);
    Reg_13: registrador port map(clock,load(13),w_data,reg13);
    Reg_14: registrador port map(clock,load(14),w_data,reg14);
    Reg_15: registrador port map(clock,load(15),w_data,reg15);
    mux: mux_16entradas_13b port map(reg15,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,cont,rdata);
    Reg_data: registrador port map(clock,r,rdata,r_data);
end log;
