library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity Alu is
  port ( op1  : in  Std_Logic_Vector(31 downto 0);
         op2  : in  Std_Logic_Vector(31 downto 0);
         cin  : in  Std_Logic;
         cmd  : in  Std_Logic_Vector(1 downto 0);
         res  : out Std_Logic_Vector(31 downto 0);
         cout : out Std_Logic;
         z    : out Std_Logic;
         n    : out Std_Logic;
         v    : out Std_Logic;
         vdd  : in  bit;
         vss  : in  bit );
end Alu;

architecture flow of Alu is
  signal s1: Std_Logic_Vector(31 downto 0);
  signal cout1: Std_Logic;
begin
  res <= s1;

  z <= '1' when s1 = "000000000000000000000000";
  
  process(cmd, op1, op2, cin)
  begin
    
  case cmd is
    when "01" =>
      s1 <= op1 and op2;
   
      v <= '0';
      cout <= '0';
      n <= '0';
    when "10" =>
      s1 <= op1 or op2;
      
      v <= '0';
      cout <= '0';
      n <= '0';  
    when "11" =>
      s1 <= op1 xor op2;
      
      v <= '0';
      cout <= '0';
      n <= '0';
    when others =>
      if cin = '0' then s1 <= Std_Logic_Vector( signed(op1) + signed(op2));
      else s1 <= Std_Logic_Vector( signed(op1) + signed(op2) + 1);
      end if;
      cout1 <= (op1(30) and op2(30)) or (op1(31) or op2(31));
      
      n <= s1(31);
      cout <= cout1;
      if cout1 = '1' then v <= '1';
      end if;
  end case;
  end process;

end flow;
