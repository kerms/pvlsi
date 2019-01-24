library IEEE, work;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity Shifter is
  port(
    shift_lsl : in  Std_Logic;
    shift_lsr : in  Std_Logic;
    shift_asr : in  Std_Logic;
    shift_ror : in  Std_Logic;
    shift_rrx : in  Std_Logic;
    shift_val : in  Std_Logic_Vector(4 downto 0); -- shift amont
    din       : in  Std_Logic_Vector(31 downto 0); --rm
    cin       : in  Std_Logic;
    dout      : out Std_Logic_Vector(31 downto 0);
    cout      : out Std_Logic; --carry
    -- global interface
    vdd       : in  bit;
    vss       : in  bit );
end Shifter;


architecture flow of Shifter is
  
  begin
    process(shift_lsl, shift_lsr, shift_asr, shift_ror, shift_rrx, shift_val, din, cin, vss, vdd)
    variable shift_val_integer : integer;
    begin
        if Is_X(shift_val) then 
          shift_val_integer := 0;
        else 
          shift_val_integer:= to_integer(unsigned(shift_val));
        end if;
      if shift_lsl='1' then
        if shift_val_integer /= 0 then
          lsl_0 : for i in 0 to shift_val_integer loop
            dout(i) <= '0';
          end loop ; -- lsl_0
      
          lsl_shift : for i in shift_val_integer to 31 loop
            dout(i) <= din(i-shift_val_integer);
          end loop ; -- lsl_shift  
          cout <= din(32-shift_val_integer);
        else
          cout <= cin;
          dout <= X"00000000";
        end if;
      elsif (shift_lsr='1') then
        if shift_val_integer = 0 then
          cout <= din(31);
          dout <= X"00000000";
        else
        lsr_0 : for i in 0 to shift_val_integer loop
          dout(31-i) <= '0';
        end loop ; -- lsr_0
      
        lsr_shift : for i in shift_val_integer to 31 loop
          dout(31-i) <= din(31-i+shift_val_integer);
        end loop ; -- lsr_shift
        cout <= din(shift_val_integer-1);
        end if;
    elsif (shift_asr='1') then
      if shift_val_integer = 0 then
        cout <= din(31);
        asr_32 : for i in 0 to 31 loop
          dout(i) <= din(31);
      end loop ; -- asr_32
      else
      asr_31 : for i in 0 to shift_val_integer loop
        dout(31-i) <= din(31);
      end loop ; -- asr_31
      
      asr_shift : for i in shift_val_integer to 31 loop
        dout(31-i) <= din(31-i+shift_val_integer);
      end loop ; -- asr_shift
      cout <= din(shift_val_integer-1);
    end if;
    elsif (shift_ror='1') then
      ror_0 : for i in 0 to shift_val_integer loop
        dout(31-i) <= din(shift_val_integer-i);
    end loop ; -- ror_0
    
    ror_shift : for i in shift_val_integer to 31 loop
      dout(31-i) <= din(31-i+shift_val_integer);
    end loop ; -- ror_shift
    cout <= din(shift_val_integer-1);
    elsif (shift_rrx='1') then
      cout <= din(0);
      dout(31) <= cin;
      rrx_shift : for i in 0 to 30 loop
        dout(i) <= din(i+1);
    end loop ; -- rrx_shift
  end if;
end process;
end flow;
