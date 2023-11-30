library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity multiplier is
port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
end entity multiplier;

architecture struct of multiplier is
signal S:std_logic_vector(32 downto 1);
begin
m1:and_2 port map(A=>A(3),B=>B(0),Y=>S(3)); --A(3)*B(0)
m2:and_2 port map(A=>A(2),B=>B(0),Y=>S(2)); --A(2)*B(0)
m3:and_2 port map(A=>A(1),B=>B(0),Y=>S(1)); --A(1)*B(0)
m4:and_2 port map(A=>A(0),B=>B(0),Y=>M(0)); --A(0)*B(0)

m5:and_2 port map(A=>A(3),B=>B(1),Y=>S(7)); --A(3)*B(1)
m6:and_2 port map(A=>A(2),B=>B(1),Y=>S(6)); --A(2)*B(1)
m7:and_2 port map(A=>A(1),B=>B(1),Y=>S(5)); --A(1)*B(1)
m8:and_2 port map(A=>A(0),B=>B(1),Y=>S(4)); --A(0)*B(1)

m9:and_2 port map(A=>A(3),B=>B(2),Y=>S(11)); --A(3)*B(2)
m10:and_2 port map(A=>A(2),B=>B(2),Y=>S(10)); --A(2)*B(2)
m11:and_2 port map(A=>A(1),B=>B(2),Y=>S(9)); --A(1)*B(2)
m12:and_2 port map(A=>A(0),B=>B(2),Y=>S(8)); --A(0)*B(2)

m13:and_2 port map(A=>A(3),B=>B(3),Y=>S(15)); --A(3)*B(3)
m14:and_2 port map(A=>A(2),B=>B(3),Y=>S(14)); --A(2)*B(3)
m15:and_2 port map(A=>A(1),B=>B(3),Y=>S(13)); --A(1)*B(3)
m16:and_2 port map(A=>A(0),B=>B(3),Y=>S(12)); --A(0)*B(3)

m17:half_adder port map(A=>S(1),B=>S(4),S=>M(1),C=>S(16)); --A(1)*B(0)+A(0)*B(1) ASSIGNED TO M(1)
--CARRY IS GIVEN TO OTHER FULL ADDER.

m18:full_adder port map(A=>S(2),B=>S(5),Ci=>S(16),sum=>S(17),CO=>S(18));
m19:half_adder port map(A=>S(17),B=>S(8),s=>M(2),C=>S(19));

m20:full_adder port map(A=>S(3),B=>S(6),Ci=>S(18),sum=>S(20),CO=>S(21));
m21:full_adder port map(A=>S(20),B=>S(9),Ci=>S(19),sum=>S(22),Co=>S(23));
m22:half_adder port map(A=>S(12),B=>S(22),s=>M(3),C=>S(24));


m23:full_adder port map(A=>S(7),B=>S(10),Ci=>S(21),sum=>S(25),CO=>S(26));
m24:full_adder port map(A=>S(13),B=>S(25),Ci=>S(23),sum=>S(27),CO=>S(28));
m25:half_adder port map(A=>S(27),B=>S(24),s=>M(4),C=>S(29));

m26:full_adder port map(A=>S(11),B=>S(14),Ci=>S(26),sum=>S(30),CO=>S(31));
m27:full_adder port map(A=>S(30),B=>S(28),Ci=>S(29), sum=>M(5),Co=>S(32));

m28:full_adder port map(A=>S(15),B=>S(31),ci=>S(32),sum=>M(6),Co=>M(7));

M(8) <= '0';
M(9) <= '0';
M(10) <= '0';
M(11) <= '0';
M(12) <= '0';
M(13) <= '0';
M(14) <= '0';
M(15) <= '0';

end architecture struct;
