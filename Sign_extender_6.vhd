library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity sign_extend_6 is
	port (inp: in std_logic_vector(5 downto 0); extended: out std_logic_vector(15 downto 0));
end entity sign_extend_6;

architecture main of sign_extend_6 is
	
	begin

	extended <= "1111111111" & inp when (inp(5) = '1') else
				"0000000000" & inp;

end main;
