library ieee;
use ieee.std_logic_1164.all;

entity left_extend is
	port(IR0_7: in std_logic_vector(7 downto 0); ls_out : out std_logic_vector(15 downto 0));
end entity least_significant;

architecture Struct of least_significant is

begin

	a1: for i in 0 to 7 generate
		ls_out(i)<='0';
	end generate;
	
	a2: for i in 8 to 15 generate
		ls_out(i)<=IR0_7(i-8);
	end generate;

end Struct;
