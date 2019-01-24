library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;

use work.shifter;
entity shifter_tb is
end shifter_tb;

architecture shifter_tb_arc of shifter_tb is
	component shifter is
	port (
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
	    vss       : in  bit
	);
end component shifter;

signal shift_lsl : Std_Logic;
signal shift_lsr : Std_Logic;
signal shift_asr : Std_Logic;
signal shift_ror : Std_Logic;
signal shift_rrx : Std_Logic;
signal shift_val : Std_Logic_Vector(4 downto 0); -- shift amont
signal din       : Std_Logic_Vector(31 downto 0); --rm
signal cin       : Std_Logic;
signal dout      : Std_Logic_Vector(31 downto 0);
signal cout      : Std_Logic; --carry
signal vdd       : bit;
signal vss       : bit;

begin
	shifter_inst : shifter
	port map (
		shift_lsl => shift_lsl,
		shift_lsr => shift_lsr,
		shift_asr => shift_asr,
		shift_ror => shift_ror,
		shift_rrx => shift_rrx,
		shift_val => shift_val,
		din       => din      ,
		cin       => cin      ,
		dout      => dout     ,
		cout      => cout     ,
		vdd       => vdd      ,
		vss       => vss      	
		);
	process
	-- variable
	variable seed1 :positive ;
	variable seed2 :positive ;
	variable re1 : integer;
	variable re2 : real ;

	variable rand_A : unsigned(31 downto 0);
	variable rand_B : unsigned(31 downto 0);
	variable new_val : std_logic_vector(31 downto 0);
	variable var_cout : unsigned(0 downto 0);

	begin
		shift_lsl <= '1';
		shift_lsr <= '0';
		shift_asr <= '0';
		shift_ror <= '0';
		shift_rrx <= '0';

		shift_val <= "00010";
		din <= X"00000010";
		cin <= '1';

		wait for 2 ns;
		shift_lsl <= '0';
		shift_lsr <= '0';
		shift_asr <= '0';
		shift_ror <= '0';
		shift_rrx <= '0';

		shift_val <= "00010";
		din <= X"ABCD1234";
		cin <= '1';

		wait for 2 ns;

		wait;
	end process;
end  shifter_tb_arc;