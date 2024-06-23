library ieee;
use ieee.std_logic_1164.all;

entity seg7 is
    port (w,x,y,z: in  std_logic;
            led: out std_logic_vector(6 downto 0));
end seg7;

architecture log of seg7 is
begin
    led(6) <= not(w or y or (x xnor Z));
    led(5) <= not(not(x) or (y xnor z));
    led(4) <= not(x or not(y) or z);
    led(3) <= not(w or (not(x) and y) or (not(x) and not(z)) or (y and not(z)) or (x and not(y) and z));
    led(2) <= not((not(x) and not(z)) or (y and not(z)));
    led(1) <= not(w or (x and not(y)) or (x and not(z)) or (not(y) and not(z)));
    led(0) <= not(w or (y and not(z)) or (x xor y));
end log;
