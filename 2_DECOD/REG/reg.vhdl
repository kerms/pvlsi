library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
	port(
	-- Write Port 1 prioritaire
		wdata1		: in Std_Logic_Vector(31 downto 0);
		wadr1			: in Std_Logic_Vector(3 downto 0);
		wen1			: in Std_Logic;

	-- Write Port 2 non prioritaire
		wdata2		: in Std_Logic_Vector(31 downto 0);
		wadr2			: in Std_Logic_Vector(3 downto 0);
		wen2			: in Std_Logic;

	-- Write CSPR Port
		wcry			: in Std_Logic;
		wzero			: in Std_Logic;
		wneg			: in Std_Logic;
		wovr			: in Std_Logic;
		cspr_wb		: in Std_Logic;
		
	-- Read Port 1 32 bits
		reg_rd1		: out Std_Logic_Vector(31 downto 0);
		radr1			: in Std_Logic_Vector(3 downto 0);
		reg_v1		: out Std_Logic;

	-- Read Port 2 32 bits
		reg_rd2		: out Std_Logic_Vector(31 downto 0);
		radr2			: in Std_Logic_Vector(3 downto 0);
		reg_v2		: out Std_Logic;

	-- Read Port 3 32 bits
		reg_rd3		: out Std_Logic_Vector(31 downto 0);
		radr3			: in Std_Logic_Vector(3 downto 0);
		reg_v3		: out Std_Logic;

	-- read CSPR Port
		reg_cry		: out Std_Logic;
		reg_zero		: out Std_Logic;
		reg_neg		: out Std_Logic;
		reg_cznv		: out Std_Logic;
		reg_ovr		: out Std_Logic;
		reg_vv		: out Std_Logic;
		
	-- Invalidate Port 
		inval_adr1	: in Std_Logic_Vector(3 downto 0);
		inval1		: in Std_Logic;

		inval_adr2	: in Std_Logic_Vector(3 downto 0);
		inval2		: in Std_Logic;

		inval_czn	: in Std_Logic;
		inval_ovr	: in Std_Logic;

	-- PC
		reg_pc		: out Std_Logic_Vector(31 downto 0);
		reg_pcv		: out Std_Logic;
		inc_pc		: in Std_Logic;
	
	-- global interface
		ck				: in Std_Logic;
		reset_n		: in Std_Logic;
		vdd			: in bit;
		vss			: in bit);
end Reg;

architecture Behavior OF Reg is
signal reg_0  : std_logic_vector(31 downto 0);
signal reg_1  : std_logic_vector(31 downto 0);
signal reg_2  : std_logic_vector(31 downto 0);
signal reg_3  : std_logic_vector(31 downto 0);
signal reg_4  : std_logic_vector(31 downto 0);
signal reg_5  : std_logic_vector(31 downto 0);
signal reg_6  : std_logic_vector(31 downto 0);
signal reg_7  : std_logic_vector(31 downto 0);
signal reg_8  : std_logic_vector(31 downto 0);
signal reg_9  : std_logic_vector(31 downto 0);
signal reg_10 : std_logic_vector(31 downto 0);
signal reg_11 : std_logic_vector(31 downto 0);
signal reg_12 : std_logic_vector(31 downto 0);
signal reg_13 : std_logic_vector(31 downto 0);
signal reg_14 : std_logic_vector(31 downto 0);
signal reg_pc : std_logic_vector(31 downto 0);

signal reg_0_v  : std_logic;
signal reg_1_v  : std_logic;
signal reg_2_v  : std_logic;
signal reg_3_v  : std_logic;
signal reg_4_v  : std_logic;
signal reg_5_v  : std_logic;
signal reg_6_v  : std_logic;
signal reg_7_v  : std_logic;
signal reg_8_v  : std_logic;
signal reg_9_v  : std_logic;
signal reg_10_v : std_logic;
signal reg_11_v : std_logic;
signal reg_12_v : std_logic;
signal reg_13_v : std_logic;
signal reg_14_v : std_logic;
signal reg_pc_v : std_logic;

signal reg_flag_c : std_logic;
signal reg_flag_n : std_logic;
signal reg_flag_z : std_logic;
signal reg_flag_v : std_logic;

signal reg_flag_cnz_v : std_logic;
signal reg_flag_v_v : std_logic;




begin
process (reset_n, ck)
begin
if (rising_edge(ck)) then
	if (reset_n = '1') then
		reg_0_v  <= '1';
		reg_1_v  <= '1';
		reg_2_v  <= '1';
		reg_3_v  <= '1';
		reg_4_v  <= '1';
		reg_5_v  <= '1';
		reg_6_v  <= '1';
		reg_7_v  <= '1';
		reg_8_v  <= '1';
		reg_9_v  <= '1';
		reg_10_v <= '1';
		reg_11_v <= '1';
		reg_12_v <= '1';
		reg_13_v <= '1';
		reg_14_v <= '1';
		reg_pc_v <= '1';

		reg_flag_cnz_v <= '1' ;
		reg_flag_v_v <= '1' ;
	end if;
	


end if;
end process ;
end Behavior;