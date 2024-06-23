library ieee;
use ieee.std_logic_1164.all;

entity bin_bcd is
    port (SW: in  std_logic_vector(12 downto 0);
           mil,cent, dez, uni : out std_logic_vector(3 downto 0));
end bin_bcd;

architecture log of bin_bcd is

component caixa IS
PORT(
	A3, A2, A1 ,A0 : IN STD_LOGIC;
	S3, S2, S1, S0: OUT STD_LOGIC
			
      );
END component caixa;

signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s11,s12,s13,s14,s15,s16,s18,s19,s20: std_logic_vector(3 downto 0);
signal bcd: std_logic_vector(16 downto 0);

begin
  bcd(0) <= SW(0);

  U1: caixa port map('0',SW(12),SW(11),SW(10),s1(3),s1(2),s1(1),s1(0));
  U2: caixa port map(s1(2),s1(1),s1(0),SW(9),s2(3),s2(2),s2(1),s2(0));
  U3: caixa port map(s2(2),s2(1),s2(0),SW(8),s3(3),s3(2),s3(1),s3(0));
  U4: caixa port map(s3(2),s3(1),s3(0),SW(7),s4(3),s4(2),s4(1),s4(0));
  U5: caixa port map(s4(2),s4(1),s4(0),SW(6),s5(3),s5(2),s5(1),s5(0));
  U6: caixa port map(s5(2),s5(1),s5(0),SW(5),s6(3),s6(2),s6(1),s6(0));
  U7: caixa port map(s6(2),s6(1),s6(0),SW(4),s7(3),s7(2),s7(1),s7(0));
  U8: caixa port map(s7(2),s7(1),s7(0),SW(3),s8(3),s8(2),s8(1),s8(0));
  U9: caixa port map(s8(2),s8(1),s8(0),SW(2),s9(3),s9(2),s9(1),s9(0));  
  U10: caixa port map(s9(2),s9(1),s9(0),SW(1),bcd(4),bcd(3),bcd(2),bcd(1));

  U11: caixa port map('0',s1(3),s2(3),s3(3),s11(3),s11(2),s11(1),s11(0));
  U12: caixa port map(s11(2),s11(1),s11(0),s4(3),s12(3),s12(2),s12(1),s12(0));
  U13: caixa port map(s12(2),s12(1),s12(0),s5(3),s13(3),s13(2),s13(1),s13(0));
  U14: caixa port map(s13(2),s13(1),s13(0),s6(3),s14(3),s14(2),s14(1),s14(0));
  U15: caixa port map(s14(2),s14(1),s14(0),s7(3),s15(3),s15(2),s15(1),s15(0));
  U16: caixa port map(s15(2),s15(1),s15(0),s8(3),s16(3),s16(2),s16(1),s16(0));
  U17: caixa port map(s16(2),s16(1),s16(0),s9(3),bcd(8),bcd(7),bcd(6),bcd(5));

  U18: caixa port map('0',s11(3),s12(3),s13(3),s18(3),s18(2),s18(1),s18(0));
  U19: caixa port map(s18(2),s18(1),s18(0),s14(3),s19(3),s19(2),s19(1),s19(0));
  U20: caixa port map(s19(2),s19(1),s19(0),s15(3),s20(3),s20(2),s20(1),s20(0));
  U21: caixa port map(s20(2),s20(1),s20(0),s16(3),bcd(12),bcd(11),bcd(10),bcd(9));

  U22: caixa port map('0',s18(3),s19(3),s20(3),bcd(16),bcd(15),bcd(14),bcd(13));

  mil <= bcd(15 downto 12);
  cent <= bcd(11 downto 8);
  dez <= bcd(7 downto 4);
  uni <= bcd(3 downto 0);

end log;
