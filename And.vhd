library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity AND_BIT is
port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
end entity AND_BIT;

architecture  struct of AND_BIT is
begin
a0: AND_2 port map(A=>A(0),B=>B(0),Y=>M(0));
a1: AND_2 port map(A=>A(1),B=>B(1),Y=>M(1));
a2: AND_2 port map(A=>A(2),B=>B(2),Y=>M(2));
a3: AND_2 port map(A=>A(3),B=>B(3),Y=>M(3));
a4: AND_2 port map(A=>A(4),B=>B(4),Y=>M(4));
a5: AND_2 port map(A=>A(5),B=>B(5),Y=>M(5));
a6: AND_2 port map(A=>A(6),B=>B(6),Y=>M(6));
a7: AND_2 port map(A=>A(7),B=>B(7),Y=>M(7));
a8: AND_2 port map(A=>A(8),B=>B(8),Y=>M(8));
a9: AND_2 port map(A=>A(9),B=>B(9),Y=>M(9));
a10: AND_2 port map(A=>A(10),B=>B(10),Y=>M(10));
a11: AND_2 port map(A=>A(11),B=>B(11),Y=>M(11));
a12: AND_2 port map(A=>A(12),B=>B(12),Y=>M(12));
a13: AND_2 port map(A=>A(13),B=>B(13),Y=>M(13));
a14: AND_2 port map(A=>A(14),B=>B(14),Y=>M(14));
a15: AND_2 port map(A=>A(15),B=>B(15),Y=>M(15));

end architecture struct;
