library IEEE; 
use IEEE.std_logic_1164.all;

entity HA is
  port(A, B: in  std_logic;
       S, R: out std_logic); 
end HA;


architecture FLOW of HA is 
begin
    S <= A xor B; 
    R <= A and B; 
end FLOW;
