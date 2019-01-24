-- lib
library IEEE, work; 
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.adder4;  
entity adder4_tb is
end adder4_tb;

architecture behav of adder4_tb is
  component adder4
  port (
    A,B: in std_logic_vector( 3 downto 0 );
    cin: in std_logic;
    S : out std_logic_vector( 3 downto 0 );
    R : out std_logic );
end component;

signal A, B, S : std_logic_vector(3 downto 0);
signal cin: std_logic;
signal R: std_logic;

begin

  adder4_inst : adder4
  port map (
    A => A,
    B => B,
    cin => cin,
    S => S,
    R => R
    );

  process

  variable seed1 :positive ;
  variable seed2 :positive ;
  variable re1 : integer;
  variable re2 : real ;
  
  variable din_rand : unsigned(3 downto 0);
  variable rand_A : unsigned(3 downto 0);
  variable rand_B : unsigned(3 downto 0);
  variable new_val : std_logic_vector(3 downto 0);

  begin

    A <= "0000";
    B <= "0011";
    cin <= '0';
    wait for 2 ns;
    assert (s = "0011") report "ERROR 0000+0011+0" severity FAILURE;
    assert (R = '0') report "ERROR 0000+0011 : r = 1" severity FAILURE;
    

    A <= "0000";
    B <= "0011";
    cin <= '1';
    wait for 2 ns;
    assert (s = "0100") report "ERROR 0000+0011+1" severity FAILURE;
    assert (R = '0') report "ERROR 0000+0011+1 : r = 1" severity FAILURE;

    for i in 0 to 100 loop
      -- generation aleatoire de valeurs pour din
      uniform (seed1,seed2,re2);
      re1 := integer (re2 * real(2**4 -1));
      rand_A := to_unsigned (re1,4);
      uniform (seed1,seed2,re2);
      re1 := integer (re2 * real(2**4 -1));
      rand_B := to_unsigned (re1,4);

      new_val := std_logic_vector(unsigned(rand_B) + unsigned(rand_A)+unsigned'( '0' & cin));
      A <= std_logic_vector(rand_A);
      B <= std_logic_vector(rand_B);
      cin <= cin;
      wait for 2 ns;
      assert (new_val = S) report "ERROR : " 
        &integer'image(to_integer(rand_A))&"+"
        &integer'image(to_integer(rand_B))&"+"
        &std_logic'image(cin)&"="
        &integer'image(to_integer(unsigned(S))) severity FAILURE;
    end loop;
    wait;
  end process;
  
end behav;
