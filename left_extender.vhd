library ieee;
use ieee.std_logic_1164.all;

entity left_extender is
	port(IR0_7: in std_logic_vector(7 downto 0); ls_out : out std_logic_vector(15 downto 0));
end entity left_extender;

architecture Struct of left_extender is

begin

	a1: for i in 0 to 7 generate
		ls_out(i)<=IR0_7(i);
	end generate;
	
	a2: for i in 8 to 15 generate
		ls_out(i)<='0';
	end generate;
	
end Struct;
