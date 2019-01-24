library IEEE; 
use IEEE.std_logic_1164.all;
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
  signal s1: Std_Logic_Vector(32 downto 0);
  signal cout1: Std_Logic;
begin
  res <= s1(31 downto 0);

  z <= '1' when s1 = "000000000000000000000000000000000" 
    else '0';

  n <= s1(31);
  process(cmd, op1, op2, cin, s1, cout1)
  begin
  -- 00 ADD
  -- 01 AND
  -- 10 OR
  -- 11 XOR
  case cmd is
    when "01" =>
      s1 <= "0"&(op1 and op2);
      v <= '0';
      cout <= '0';
    when "10" =>
      s1 <= "0"&(op1 or op2);
      v <= '0';
      cout <= '0';  
    when "11" =>
      s1 <= "0"&(op1 xor op2);
      v <= '0';
      cout <= '0';
    when others =>
      if cin = '0' then s1 <= Std_Logic_Vector( signed("0"&op1) + signed(op2));
      else s1 <= Std_Logic_Vector( signed("0"&op1) + signed(op2) + 1);
      end if;
      cout <= s1(32);
      if op1(31) = '1' and op2(31) = '1' and s1(31) = '0' then 
        v <= '1';
      elsif op1(31) = '0' and op2(31) = '0' and s1(31) = '1' then
        v <= '1';
      else 
        v <= '0';
      end if;
  end case;
  end process;

end flow;
