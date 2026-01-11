-- testbench for xor_4 function
library IEEE;
use IEEE.std_logic_1164.all;

entity test_xor_4 is 
end;

architecture sim of test_xor_4 is
	component xor_4
    	port (a: in STD_LOGIC_VECTOR(3 downto 0);
    	  	  y: out STD_LOGIC);
    end component;
	signal a: STD_LOGIC_VECTOR(3 downto 0);
    signal y: STD_LOGIC;
    
    begin
    	dut: xor_4 port map(a=>a, y=>y);
    process begin
    	-- correct test cases
    	a(3)<='0'; a(2)<='0'; a(1)<='0'; a(0)<='0';
        wait for 5ns;
        	assert y='0' report "0000 failed";
        a(3)<='0'; a(2)<='0'; a(1)<='0'; a(0)<='1';
        wait for 5ns;
        	assert y='1' report "0001 failed";
        a(3)<='0'; a(2)<='0'; a(1)<='1'; a(0)<='0';
        wait for 5ns;
        	assert y='1' report "0010 failed";
        a(3)<='0'; a(2)<='0'; a(1)<='1'; a(0)<='1';
        wait for 5ns;
        	assert y='0' report "0011 failed";
        a(3)<='0'; a(2)<='1'; a(1)<='0'; a(0)<='0';
        wait for 5ns;
        	assert y='1' report "0100 failed";
        a(3)<='0'; a(2)<='1'; a(1)<='0'; a(0)<='1';
        wait for 5ns;
        	assert y='0' report "0101 failed";
        a(3)<='0'; a(2)<='1'; a(1)<='1'; a(0)<='0';
        wait for 5ns;
        	assert y='0' report "0110 failed";
        a(3)<='0'; a(2)<='1'; a(1)<='1'; a(0)<='1';
        wait for 5ns;
        	assert y='1' report "0111 failed";
        a(3)<='1'; a(2)<='0'; a(1)<='0'; a(0)<='0';
        wait for 5ns;
        	assert y='1' report "1000 failed";
        a(3)<='1'; a(2)<='0'; a(1)<='0'; a(0)<='1';
        wait for 5ns;
        	assert y='0' report "1001 failed";
        a(3)<='1'; a(2)<='0'; a(1)<='1'; a(0)<='0';
        wait for 5ns;
        	assert y='0' report "1010 failed";
        a(3)<='1'; a(2)<='0'; a(1)<='1'; a(0)<='1';
        wait for 5ns;
        	assert y='1' report "1011 failed";
        a(3)<='1'; a(2)<='1'; a(1)<='0'; a(0)<='0';
        wait for 5ns;
        	assert y='0' report "1100 failed";
        a(3)<='1'; a(2)<='1'; a(1)<='0'; a(0)<='1';
        wait for 5ns;
        	assert y='1' report "1101 failed";
        a(3)<='1'; a(2)<='1'; a(1)<='1'; a(0)<='0';
        wait for 5ns;
        	assert y='1' report "1110 failed";
        a(3)<='1'; a(2)<='1'; a(1)<='1'; a(0)<='1';
        wait for 5ns;
        	assert y='0' report "1111 failed"; 
        --incorrect test case
        a(3)<='1'; a(2)<='1'; a(1)<='1'; a(0)<='1';
        wait for 5ns;
        	assert y='1' report "1111 failed"; 
        wait;
	end process;
end;