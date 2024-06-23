library ieee;
use ieee.std_logic_1164.all;

entity demux is
	port(   E : in std_logic;
		sel: in std_logic_vector(3 downto 0);
		S : out std_logic_vector(15 downto 0));
end demux;

architecture logic of demux is

begin

	S(0) <= E and not(sel(3)) and not(sel(2)) and not(sel(1)) and not(sel(0));
	S(1) <= E and not(sel(3)) and not(sel(2)) and not(sel(1)) and (sel(0)) ;
	S(2) <= E and not(sel(3)) and not(sel(2)) and (sel(1)) and not(sel(0));
	S(3) <= E and not(sel(3)) and not(sel(2)) and (sel(1)) and (sel(0));
	S(4) <= E and not(sel(3)) and (sel(2)) and not(sel(1)) and not(sel(0));
	S(5) <= E and not(sel(3)) and (sel(2)) and not(sel(1)) and (sel(0));
	S(6) <= E and not(sel(3)) and (sel(2)) and (sel(1)) and not(sel(0));
	S(7) <= E and not(sel(3)) and (sel(2)) and (sel(1)) and (sel(0));
	S(8) <= E and (sel(3)) and not(sel(2)) and not(sel(1)) and not(sel(0));
	S(9) <= E and (sel(3)) and not(sel(2)) and not(sel(1)) and (sel(0));
	S(10) <= E and (sel(3)) and not(sel(2)) and (sel(1)) and not(sel(0));
	S(11) <= E and (sel(3)) and not(sel(2)) and (sel(1)) and (sel(0));
	S(12) <= E and (sel(3)) and (sel(2)) and not(sel(1)) and not(sel(0));
	S(13) <= E and (sel(3)) and (sel(2)) and not(sel(1)) and (sel(0));
	S(14) <= E and (sel(3)) and (sel(2)) and (sel(1)) and not(sel(0));
	S(15) <= E and (sel(3)) and (sel(2)) and (sel(1)) and (sel(0));

end logic;
