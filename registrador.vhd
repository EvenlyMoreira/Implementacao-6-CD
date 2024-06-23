library ieee;
use ieee.std_logic_1164.all;

entity registrador is
    Port (
        clock,load: in std_logic;
        data : in std_logic_vector(12 downto 0);
        data_reg : out std_logic_vector(12 downto 0)
    );
end registrador;

architecture log of registrador is
	component ffd is
   	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic
	);
	end component ffd;

	component mux_2entradas_1b is
    	port (o0,o1: in  std_logic;
	  	key: in std_logic;
  	        S: out std_logic
	);
	end component mux_2entradas_1b;

signal data_temp,D: std_logic_vector(12 downto 0);

begin

    MUX_0: mux_2entradas_1b port map(data_temp(0),data(0),load,D(0));
    FF_0: ffd port map (Clock,'1','1', D(0), data_temp(0));

    MUX_1: mux_2entradas_1b port map(data_temp(1),data(1),load,D(1));
    FF_1: ffd port map (Clock,'1','1', D(1), data_temp(1));

    MUX_2: mux_2entradas_1b port map(data_temp(2),data(2),load,D(2));
    FF_2: ffd port map (Clock,'1','1', D(2), data_temp(2));

    MUX_3: mux_2entradas_1b port map(data_temp(3),data(3),load,D(3));
    FF_3: ffd port map (Clock,'1','1', D(3), data_temp(3));

    MUX_4: mux_2entradas_1b port map(data_temp(4),data(4),load,D(4));
    FF_4: ffd port map (Clock,'1','1', D(4), data_temp(4));

    MUX_5: mux_2entradas_1b port map(data_temp(5),data(5),load,D(5));
    FF_5: ffd port map (Clock,'1','1', D(5), data_temp(5));

    MUX_6: mux_2entradas_1b port map(data_temp(6),data(6),load,D(6));
    FF_6: ffd port map (Clock,'1','1', D(6), data_temp(6));

    MUX_7: mux_2entradas_1b port map(data_temp(7),data(7),load,D(7));
    FF_7: ffd port map (Clock,'1','1', D(7), data_temp(7));

    MUX_8: mux_2entradas_1b port map(data_temp(8),data(8),load,D(8));
    FF_8: ffd port map (Clock,'1','1', D(8), data_temp(8));

    MUX_9: mux_2entradas_1b port map(data_temp(9),data(9),load,D(9));
    FF_9: ffd port map (Clock,'1','1',D(9), data_temp(9));

    MUX_10: mux_2entradas_1b port map(data_temp(10),data(10),load,D(10));
    FF_10: ffd port map (Clock,'1','1',D(10), data_temp(10));

    MUX_11: mux_2entradas_1b port map(data_temp(11),data(11),load,D(11));
    FF_11: ffd port map (Clock,'1','1',D(11), data_temp(11));

    MUX_12: mux_2entradas_1b port map(data_temp(12),data(12),load,D(12));
    FF_12: ffd port map (Clock,'1','1',D(12), data_temp(12));

    data_reg <= data_temp;
end log;