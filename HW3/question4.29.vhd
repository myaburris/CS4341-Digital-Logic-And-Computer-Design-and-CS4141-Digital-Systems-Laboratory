-- traffic light controller
library IEEE;
use IEEE.std_logic_1164.all;

entity trafficLightController is
	port(clock, reset, ta, tb: in STD_LOGIC;
    	 la, lb: out STD_LOGIC_VECTOR(1 downto 0));
end;

architecture synth of trafficLightController is 
	type statetype is (S0, S1, S2, S3);
    signal state, nextstate: statetype;
    begin
      --state register
      process(clock, reset) begin
          if reset='1' 
              then state<=S0;
          elsif clock'event and clock='1' 
              then state<=nextstate;
          end if;
      end process;
      --next state logic
      process(state, ta, tb) begin
          case state is
              when S0=> if ta='1'
                          then nextstate<=S0;
                        else nextstate<=S1;
                        end if;
              when S1=> nextstate<=S2;
              when S2=> if tb='1'
                          then nextstate<=S2;
                        else nextstate<=S3;
                        end if;
              when S3=> nextstate<=S0;
              when others => nextstate<=S0;
           end case;
       end process;
       --output logic
       process(state, la, lb) begin
          case state is
              when S0=> la<="00"; lb<="10";
              when S1=> la<="01"; lb<="10";
              when S2=> la<="10"; lb<="00";
              when S3=> la<="11"; lb<="01";
              when others => la<="00"; lb<="00";
          end case;
       end process;
	 end;