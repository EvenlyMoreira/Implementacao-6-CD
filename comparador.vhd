library ieee;
use ieee.std_logic_1164.all;

entity comparador is
    port (x,y: in  std_logic_vector(3 downto 0);
          igual: out std_logic
);
end comparador;

architecture log of comparador is

begin
    igual <= (x(0) xnor y(0)) and (x(1) xnor y(1)) and (x(2) xnor y(2)) and (x(3) xnor y(3));
end log;

