-- 4-input XOR
library IEEE;
use IEEE.std_logic_1164.all;

entity xor_4 is
	port (a: in STD_LOGIC_VECTOR(3 downto 0);
    	  y: out STD_LOGIC);
end;

architecture synth of xor_4 is
begin
	y <= a(3) xor a(2) xor a(1) xor a(0);
end;