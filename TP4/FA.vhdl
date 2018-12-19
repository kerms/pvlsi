-- lib
library ieee, work;
use ieee.std_logic_1164.all;
entity FA is
  port(A, B: in std_logic;
       cin: in std_logic;
       S: out std_logic;
       R: out std_logic
       );
end FA;


architecture flow of FA is
  signal S1, R1, R2: std_logic;
begin
  label0: entity work.HA(flow)
    port map (A, B, S1, R1);
  
  label1: entity work.HA(flow)
    port map (cin, S1, S, R2);

  R <= R1 or R2;
  
end flow;
