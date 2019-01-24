library IEEE, work; 
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.alu;

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
    -- var for random
    variable seed1 :positive ; 
    variable seed2 :positive ; 
    variable re1 : integer;    
    variable re2 : real ;

    -- var in
    variable rand_1 : unsigned(31 downto 0); -- op1
    variable rand_2 : unsigned(31 downto 0); -- op2
    variable new_val : std_logic_vector(32 downto 0); -- res compute
    variable var_command : unsigned(1 downto 0); -- random command
    variable var_cout : std_logic;
    variable rand_cin : unsigned(0 downto 0);
    begin
      
      for i in 0 to 100 loop

        -- random command
        uniform (seed1,seed2,re2);
        re1 := integer (re2 * real(2**2 -1));
        var_command := to_unsigned (re1,2);


        
        uniform (seed1,seed2,re2);
        re1 := integer (re2 * real(2**30 -1));
        rand_1 := to_unsigned (re1,32);

        uniform (seed1,seed2,re2);
        re1 := integer (re2 * real(2**30 -1));
        rand_2 := to_unsigned (re1,32);

        uniform (seed1,seed2,re2);
        re1 := integer (re2 * real(2**1 -1));
        rand_cin := to_unsigned (re1,1);

        op1 <= std_logic_vector(rand_1);
        op2 <= std_logic_vector(rand_2);
        cin <= std_logic(rand_cin(0));
        cmd <= std_logic_vector(var_command);

        wait for 2 ns;

        -- test result
        case var_command is
        when "01" =>
        new_val := "0"&std_logic_vector(rand_1 and rand_2);
        assert (res = new_val(31 downto 0)) report "ERROR and " severity ERROR;
        --assert (v='0') report "ERROR and v = 1" severity ERROR;
        
        when "10" =>
        new_val := "0"&std_logic_vector(rand_1 or rand_2);
        assert (res = new_val(31 downto 0)) report "ERROR or" severity ERROR;
        
        when "11" =>
        new_val := "0"&std_logic_vector(rand_1 xor rand_2);
        assert (res = new_val(31 downto 0)) report "ERROR xor " severity ERROR;
        
        when others =>
        new_val := std_logic_vector("0"&rand_1 + rand_2 + unsigned'(rand_cin));
        var_cout := new_val(32);
        assert (res = new_val(31 downto 0)) report "Error add" severity ERROR;
        assert (var_cout = cout) report "Error add cout" severity ERROR;
      end case;

    end loop;
    wait;      
  end process;

end test_bench;
