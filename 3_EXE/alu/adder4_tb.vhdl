-- lib
library IEEE, work; 
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
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
  
  variable din_rand : unsigned(3 downto 0);
  variable rand_A : unsigned(3 downto 0);
  variable rand_B : unsigned(3 downto 0);
  variable new_val : std_logic_vector(3 downto 0);

  begin

    A <= "0000";
    B <= "0011";
    cin <= '0';
    wait for 2 ns;
    assert (s = "0011") report "ERROR" severity ERROR;
    assert (R = '0') report "ERROR" severity ERROR;

    A <= "0000";
    B <= "0011";
    cin <= '1';
    wait for 2 ns;
    assert (s = "0100") report "ERROR" severity ERROR;
    assert (R = '0') report "ERROR" severity ERROR;

    for i in 0 to 100 loop
      -- generation aleatoire de valeurs pour din
      din_rand := (din_rand(2 downto 0) & din_rand(3)) xor ("00" & din_rand(3) & "0");
      rand_A := din_rand;
      din_rand := (din_rand(2 downto 0) & din_rand(3)) xor ("00" & din_rand(3) & "0");
      rand_B := din_rand;
      new_val := std_logic_vector(unsigned(rand_B) + unsigned(rand_A));
      wait for 2 ns;
      assert (new_val = S) report "ERROR" severity ERROR;
    end loop;
    wait;
  end process;
  
end behav;
