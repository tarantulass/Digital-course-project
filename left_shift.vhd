library ieee;
use ieee.std_logic_1164.all;

entity left_shifter is
	port(A:in std_logic_vector(15 downto 0);Y:out std_logic_vector(15 downto 0));
end entity left_shifter;

architecture struct of left_shifter is
	
	component MUX_2 is
	port (A,B,S:IN STD_LOGIC;OUT1:OUT STD_LOGIC);
	end component MUX_2;

begin

l0: MUX_2 port map(A=>A(0),B=>A(15),S=>'1',OUT1=>Y(0));
l1: MUX_2 port map(A=>A(1),B=>A(0),S=>'1',OUT1=>Y(1));
l2: MUX_2 port map(A=>A(2),B=>A(1),S=>'1',OUT1=>Y(2));
l3: MUX_2 port map(A=>A(3),B=>A(2),S=>'1',OUT1=>Y(3));
l4: MUX_2 port map(A=>A(4),B=>A(3),S=>'1',OUT1=>Y(4));
l5: MUX_2 port map(A=>A(5),B=>A(4),S=>'1',OUT1=>Y(5));
l6: MUX_2 port map(A=>A(6),B=>A(5),S=>'1',OUT1=>Y(6));
l7: MUX_2 port map(A=>A(7),B=>A(6),S=>'1',OUT1=>Y(7));
l8: MUX_2 port map(A=>A(8),B=>A(7),S=>'1',OUT1=>Y(8));
l9: MUX_2 port map(A=>A(9),B=>A(8),S=>'1',OUT1=>Y(9));
l10: MUX_2 port map(A=>A(10),B=>A(9),S=>'1',OUT1=>Y(10));
l11: MUX_2 port map(A=>A(11),B=>A(10),S=>'1',OUT1=>Y(11));
l12: MUX_2 port map(A=>A(12),B=>A(11),S=>'1',OUT1=>Y(12));
l13: MUX_2 port map(A=>A(13),B=>A(12),S=>'1',OUT1=>Y(13));
l14: MUX_2 port map(A=>A(14),B=>A(13),S=>'1',OUT1=>Y(14));
l15: MUX_2 port map(A=>A(15),B=>A(14),S=>'1',OUT1=>Y(15));

end architecture struct;
