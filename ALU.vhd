library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(pc, t1, t2, se, ls: in std_logic_vector(15 downto 0);
			state:in std_logic_vector(4 downto 0);
			opcode: in std_logic_vector(3 downto 0);
			c: out std_logic_vector(15 downto 0);
			alu_z: out std_logic);
end entity;


architecture struct of ALU is

	component and_5 is
		port(A : std_logic_vector(4 downto 0);Y : out std_logic);
	end component and_5;

	-------------------------------------------------------------------------------------------------------------------------
	
	component adder is
		port(A,B:in std_logic_vector(15 downto 0); C: out std_logic; S: out std_logic_vector(15 downto 0));
	end component adder;

	------------------------------------------------------------------------------------------------------------------------
	
	component subtractor is
		port(A,B:in std_logic_vector(15 downto 0); C: out std_logic; S: out std_logic_vector(15 downto 0));
	end component subtractor;	
		
	------------------------------------------------------------------------------------------------------------------------
		
	component multiplier is
		port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
	end component multiplier;
	
	------------------------------------------------------------------------------------------------------------------------
	
	component OR_BIT is
		port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
	end component OR_BIT;

	------------------------------------------------------------------------------------------------------------------------
	
	component IMP_BIT is
		port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
	end component IMP_BIT;

	------------------------------------------------------------------------------------------------------------------------
	
	component AND_BIT is
		port (A:in std_logic_vector(15 downto 0);B:in std_logic_vector(15 downto 0);M:out std_logic_vector(15 downto 0));
	end component AND_BIT;

	------------------------------------------------------------------------------------------------------------------------

	signal s1,s3,s5,s6,s8,s13,s17,c_add,c_sub:std_logic;
	signal unsigned_2: std_logic_vector(15 downto 0):="0000000000000010";
	signal add16_s, sub16_s, mul16_s, and16_s, or16_s, imp16_s: std_logic;
	signal ALU_A, ALU_B, ALU_C:std_logic_vector(15 downto 0);
	signal add16, sub16, mul16, and16, or16, imp16: std_logic_vector(15 downto 0);
	signal and5:std_logic_vector(5 downto 0);
	
begin

--s1,s3,s5,s6,s8,s13,s17: states for alu implementation.

a1: and_5 port map(A(4)=>not(state(4)),A(3)=>not(state(3)),A(2)=>not(state(2)),A(1)=>not(state(1)),A(0)=>state(0),Y=>s1); 
a2: and_5 port map(A(4)=>not(state(4)),A(3)=>not(state(3)),A(2)=>not(state(2)),A(1)=>state(1),A(0)=>state(0),Y=>s3); 
a3: and_5 port map(A(4)=>not(state(4)),A(3)=>not(state(3)),A(2)=>(state(2)),A(1)=>not(state(1)),A(0)=>state(0),Y=>s5); 
a4: and_5 port map(A(4)=>not(state(4)),A(3)=>not(state(3)),A(2)=>(state(2)),A(1)=>state(1),A(0)=>not(state(0)),Y=>s6); 
a5: and_5 port map(A(4)=>not(state(4)),A(3)=>(state(3)),A(2)=>not(state(2)),A(1)=>not(state(1)),A(0)=>not(state(0)),Y=>s8); 
a6: and_5 port map(A(4)=>not(state(4)),A(3)=>(state(3)),A(2)=>(state(2)),A(1)=>not(state(1)),A(0)=>state(0),Y=>s13); 
a7: and_5 port map(A(4)=>(state(4)),A(3)=>not(state(3)),A(2)=>not(state(2)),A(1)=>not(state(1)),A(0)=>state(0),Y=>s17); 
	
ALU_GENERATE: for i in 15 downto 0 generate
ALU_A(i)<= ((s1 or s13) and pc(i)) or ((s3 or s8) and t1(i)) or (s17 and t2(i));
ALU_B(i)<= (s1 and unsigned_2(i)) or (s3 and t2(i)) or ((s8 or s17) and se(i)) or (s13 and ls(i));
ALU_C(i)<= (add16_s and add16(i)) or (sub16_s and sub16(i)) or (mul16_s and mul16(i)) or (and16_s and and16(i)) or (or16_s and or16(i)) or (imp16_s and imp16(i));
end generate ALU_GENERATE;

a8:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>not(opcode(2)),A(1)=>not(opcode(1)),A(0)=>not(opcode(0)),Y=>and5(0));
a9:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>not(opcode(2)),A(1)=>opcode(1),A(0)=>not(opcode(0)),Y=>and5(1));
a10:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>not(opcode(2)),A(1)=>opcode(1),A(0)=>(opcode(0)),Y=>and5(2));
a11:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>opcode(2),A(1)=>not(opcode(1)),A(0)=>not(opcode(0)),Y=>and5(3));
a12:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>opcode(2),A(1)=>not(opcode(1)),A(0)=>opcode(0),Y=>and5(4));
a13:and_5 port map(A(4)=>s3,A(3)=> not(opcode(3)),A(2)=>opcode(2),A(1)=>opcode(1),A(0)=>not(opcode(0)),Y=>and5(5));

add16_s<=s1 or s6 or s8 or s13 or s17 or and5(0);
sub16_s<=s5 or and5(1);
mul16_s<=and5(2);
and16_s<=and5(3);
or16_s<=and5(4) ;
imp16_s<=and5(5);
	
alu_add: adder port map(A=>ALU_A, B=>ALU_B, C=>c_add, S=>add16);
alu_sub: subtractor port map(A=>ALU_A, B=>ALU_B, C=>c_sub, S=>sub16);
alu_mul: multiplier port map(A=>ALU_A(3 downto 0), B=>ALU_B(3 downto 0), M=>mul16);
alu_and: and_bit port map(A=>ALU_A,B=>ALU_B,M=>and16);
alu_or: or_bit port map(A=>ALU_A,B=>ALU_B,M=>or16);
alu_imp: imp_bit port map(A=>ALU_A,B=>ALU_B,M=>imp16);

alu_z<=not(sub16(0) or sub16(1) or sub16(2) or sub16(3) or sub16(4) or sub16(5) or sub16(6) or sub16(7) or sub16(8) or sub16(9) or sub16(10) or sub16(11) or sub16(12) or sub16(13) or sub16(14) or c_sub or sub16(15));

c<=ALU_C;
	
end struct;
	
