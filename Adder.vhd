library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity sixteen_bit_adder is
	port(A, B: in std_logic_vector(15 downto 0);
		 S: out std_logic_vector(15 downto 0); 
		 C: out std_logic);
end entity sixteen_bit_adder;

architecture struct of sixteen_bit_adder is
	signal sig: std_logic_vector(14 downto 0);
	component full_adder is
		port (A, B, Cin: in std_logic; Sum, Co: out std_logic);
	end component full_adder;
begin
	f1: full_adder port map (A => A(0), B => B(0), Cin => '0', Sum => S(0), Co => sig(0));
	f2: full_adder	port map (A => A(1), B => B(1), Cin => sig(0), Sum => S(1), Co => sig(1));
	f3: full_adder	port map (A => A(2), B => B(2), Cin => sig(1), Sum => S(2), Co => sig(2));
	f4: full_adder	port map (A => A(3), B => B(3), Cin => sig(2), Sum => S(3), Co => sig(3));
	f5: full_adder	port map (A => A(4), B => B(4), Cin => sig(3), Sum => S(4), Co => sig(4));
	f6: full_adder	port map (A => A(5), B => B(5), Cin => sig(4), Sum => S(5), Co => sig(5));
	f7: full_adder	port map (A => A(6), B => B(6), Cin => sig(5), Sum => S(6), Co => sig(6));
	f8: full_adder port map (A => A(7), B => B(7), Cin => sig(6), Sum => S(7), Co => sig(7));
	f9: full_adder	port map (A => A(8), B => B(8), Cin => sig(7), Sum => S(8), Co => sig(8));
	f10: full_adder port map (A => A(9), B => B(9), Cin => sig(8), Sum => S(9), Co => sig(9));
	f11: full_adder port map (A => A(10), B => B(10), Cin => sig(9), Sum => S(10), Co => sig(10));
	f12: full_adder port map (A => A(11), B => B(11), Cin => sig(10), Sum => S(11), Co => sig(11));
	f13: full_adder port map (A => A(12), B => B(12), Cin => sig(11), Sum => S(12), Co => sig(12));
	f14: full_adder port map (A => A(13), B => B(13), Cin => sig(12), Sum => S(13), Co => sig(13));
	f15: full_adder port map (A => A(14), B => B(14), Cin => sig(13), Sum => S(14), Co => sig(14));
	f16: full_adder port map (A => A(15), B => B(15), Cin => sig(14), Sum => S(15), Co => C);
end architecture struct;
