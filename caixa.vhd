LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY caixa IS
PORT(
	A3, A2, A1 ,A0 : IN STD_LOGIC;
	S3, S2, S1, S0: OUT STD_LOGIC
			
      );
END caixa;

ARCHITECTURE logic OF caixa IS

BEGIN 

S3 <= (not(A3) and A2 and A1) or (A3 and not(A2) and not(A1)) or (not(A3) and A2 and A0);
S2 <= (not(A3) and A2 and not(A1) and not(A0))  or (A3 and not(A2) and not(A1) and A0);
S1 <= (not(A3) and not(A2) and A1) or (not(A3) and A1 and A0) or (A3 and not(A2) and not(A1) and not(A0));  
S0 <= (A0 and not(A3) and not(A2)) or (not(A3) and A2 and A1 and not(A0)) or (A3 and not(A2) and not(A1) and not(A0));  


END logic;
