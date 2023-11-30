library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity sign_extend_9 is
	port (inp: in std_logic_vector(8 downto 0); extended: out std_logic_vector(15 downto 0));
end entity sign_extend_10;

architecture main of sign_extend_9 is
	
	begin

	extended <= "1111111" & inp when (inp(8) = '1') else
				"0000000" & inp;

end main;
