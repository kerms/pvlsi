library IEEE, work; 
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity Alu_tb is
end Alu_tb;

architecture test_bench of Alu_tb is
  signal op1, op2, res: std_logic_vector(31 downto 0);
  signal cin, cout, z,n,v:std_logic;
  signal cmd : std_logic_vector(1 downto 0);
  signal vdd, vss: bit;

begin
  l0 : entity work.Alu(flow)
    port map(op1, op2, cin, cmd, res, cout, z, n, v, vdd, vss);
  
  process
  begin
    op1 <= "00000000000000000000000000000000";
    op2 <= "11111111111111111111111111111111";
    cin <= '0';
    cmd <= "00";
    wait for 1  ns;
    wait;      
  end process;

end test_bench;
