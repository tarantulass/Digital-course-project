library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity IMP_BIT is
port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
end entity IMP_BIT;

architecture  struct of IMP_BIT is
begin
a0: OR_2 port map(A=>not A(0),B=>B(0),Y=>M(0));
a1: OR_2 port map(A=>not A(1),B=>B(1),Y=>M(1));
a2: OR_2 port map(A=>not A(2),B=>B(2),Y=>M(2));
a3: OR_2 port map(A=>not A(3),B=>B(3),Y=>M(3));
a4: OR_2 port map(A=>not A(4),B=>B(4),Y=>M(4));
a5: OR_2 port map(A=>not A(5),B=>B(5),Y=>M(5));
a6: OR_2 port map(A=>not A(6),B=>B(6),Y=>M(6));
a7: OR_2 port map(A=>not A(7),B=>B(7),Y=>M(7));
a8: OR_2 port map(A=>not A(8),B=>B(8),Y=>M(8));
a9: OR_2 port map(A=>not A(9),B=>B(9),Y=>M(9));
a10: OR_2 port map(A=>not A(10),B=>B(10),Y=>M(10));
a11: OR_2 port map(A=>not A(11),B=>B(11),Y=>M(11));
a12: OR_2 port map(A=>not A(12),B=>B(12),Y=>M(12));
a13: OR_2 port map(A=>not A(13),B=>B(13),Y=>M(13));
a14: OR_2 port map(A=>not A(14),B=>B(14),Y=>M(14));
a15: OR_2 port map(A=>not A(15),B=>B(15),Y=>M(15));

end architecture struct;
