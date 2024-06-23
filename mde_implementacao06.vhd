library ieee;
use ieee.std_logic_1164.all;

entity mde_implementacao06 is
   port (            ck, rst : in  std_logic;
         wr, rd, vazia, cheia: in  std_logic;
                    r, w, clr: out std_logic;
			   s : out std_logic_vector(1 downto 0)
	);
end mde_implementacao06;

architecture log of mde_implementacao06 is

  type st is (Inicio, Escrever, Verificar, Ler);  
  signal estado : st; 
                         
begin
	process (ck, rst)
	begin 
	  if rst = '1' then                 
            estado <= Inicio;
            clr <= '1';
            r <= '0';
            w <= '0';
          elsif (ck'event and ck ='1') then
            case estado is

              when Inicio =>
		if wr = '1' then estado <= Escrever;
		  w <= '1';
		  r <= '0';
		  clr <= '0';
		else             estado <= Inicio;
		end if;

              when Escrever =>
		estado <= Verificar;
		w <= '0';
		r <= '0';
		clr <= '0';

              when Verificar =>
		if    (vazia = '1')                                           then estado <= Inicio;
		  w <= '0';
		  r <= '0';
		  clr <= '1';
		elsif (vazia = '0' and wr = '0' and rd = '1')                 then estado <= Ler;
		  w <= '0';
		  r <= '1';
		  clr <= '0';
		elsif (vazia = '0' and cheia = '0' and wr = '1' and rd = '0') then estado <= Escrever;
		  w <= '1';
		  r <= '0';
		  clr <= '0';
		else                                                               estado <= Verificar;
		  w <= '0';
		  r <= '0';
		  clr <= '0';
		end if;

              when Ler =>
		estado <= Verificar;
		w <= '0';
		r <= '0';
		clr <= '0';

            end case;
          end if;
	end process;

	with estado select  
          s <= "00" when Inicio,
               "01" when Escrever, 
               "10" when Verificar, 
               "11" when Ler;

end log;