-- lib
library IEEE, work; 
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;

entity adder4 is
  port ( A,B: in std_logic_vector( 3 downto 0 );
         cin: in std_logic;
         S : out std_logic_vector( 3 downto 0 );
         R : out std_logic );
end adder4;

architecture flow of adder4 is
  signal c: unsigned(2 downto 0);
  Component full_add1 is
    port (
    a, b, cin : in std_logic;
    s, cout : out std_logic);
  end Component;

begin

  inst_FA_1 : full_add1 port map(a(0),b(0),'0',s(0),c(0));
  inst_FA_2 : full_add1 port map(a(1),b(1),c(0),s(1),c(1));
  inst_FA_3 : full_add1 port map(a(2),b(2),c(1),s(2),c(2));
  inst_FA_4 : full_add1 port map(a(3),b(3),c(2),s(3),R);

end flow;
