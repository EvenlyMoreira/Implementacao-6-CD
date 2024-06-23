library ieee;
use ieee.std_logic_1164.all;

entity mux_16entradas_13b is
    port (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15 : in  std_logic_vector(12 downto 0);
	  key: in std_logic_vector(3 downto 0);
          S: out std_logic_vector(12 downto 0)
);
end mux_16entradas_13b;

architecture log of mux_16entradas_13b is

signal key0,key1,key2,key3,en: std_logic_vector(12 downto 0);

begin
    key0 <= (key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0));
    key1 <= (key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1));
    key2 <= (key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2));
    key3 <= (key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3),key(3));

    S <= (E0 and not(key3) and not(key2) and not(key1) and not(key0)) or 
    (E1 and not(key3) and not(key2) and not(key1) and (key0)) or 
    (E2 and not(key3) and not(key2) and (key1) and not(key0)) or 
    (E3 and not(key3) and not(key2) and (key1) and (key0)) or 
    (E4 and not(key3) and (key2) and not(key1) and not(key0)) or
    (E5 and not(key3) and (key2) and not(key1) and (key0)) or 
    (E6 and not(key3) and (key2) and (key1) and not(key0)) or
    (E7 and not(key3) and (key2) and (key1) and (key0)) or
    (E8 and (key3) and not(key2) and not(key1) and not(key0)) or 
    (E9 and (key3) and not(key2) and not(key1) and (key0)) or 
    (E10 and (key3) and not(key2) and (key1) and not(key0)) or 
    (E11 and (key3) and not(key2) and (key1) and (key0)) or 
    (E12 and (key3) and (key2) and not(key1) and not(key0)) or
    (E13 and (key3) and (key2) and not(key1) and (key0)) or
    (E14 and (key3) and (key2) and (key1) and not(key0)) or 
    (E15 and (key3) and (key2) and (key1) and (key0));

end log;
