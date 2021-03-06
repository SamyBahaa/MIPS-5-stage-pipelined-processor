Library IEEE;
Use ieee.std_logic_1164.all;

ENTITY ALU IS
PORT (Selectors : IN std_logic_vector(3 downto 0); 
	    Cin,Nin,Zin: IN std_logic;
      A,B: IN std_logic_vector(31 DOWNTO 0);
	    CF,NF,ZF: OUT std_logic;
      F: OUT std_logic_vector(31 DOWNTO 0);
      Enable:IN std_logic);
END ALU;

ARCHITECTURE archALU OF ALU IS

COMPONENT partA IS
PORT ( S0,S1,Cin: IN std_logic;
       CF: OUT std_logic;
       A,B: IN std_logic_vector (31 DOWNTO 0);
       F: OUT std_logic_vector (31 DOWNTO 0));
END COMPONENT;

COMPONENT partB IS 
PORT ( S0,S1,Cin:IN std_logic;
       CF: OUT std_logic;
       A,B: IN std_logic_vector (31 DOWNTO 0);
       F: OUT std_logic_vector (31 DOWNTO 0));
END COMPONENT;

COMPONENT partC IS 
PORT ( S0,S1,Cin:IN std_logic;
       A: IN std_logic_vector (31 DOWNTO 0);
	     Imm: IN std_logic_vector (31 DOWNTO 0);
       CF: OUT std_logic;
       F: OUT std_logic_vector (31 DOWNTO 0));
END COMPONENT;

COMPONENT partD IS 
PORT ( S0,S1,Cin:IN std_logic;
       CF:OUT std_logic;
       A: IN std_logic_vector (31 DOWNTO 0);
       B: IN std_logic_vector (31 DOWNTO 0);
       F: OUT std_logic_vector (31 DOWNTO 0));
END COMPONENT; 
SIGNAL F_A,F_B,F_C,F_D,RESULT:std_logic_vector (31 DOWNTO 0);
SIGNAL SEL0,SEL1,SEL2,SEL3   : std_logic;
SIGNAL Cout_A,Cout_B,Cout_C,Cout_D:std_logic;
BEGIN
SEL0 <= Selectors(0);
SEL1 <= Selectors(1);
SEL2 <= Selectors(2);
SEL3 <= Selectors(3);
compA: partA PORT MAP (SEL0,SEL1,Cin,Cout_A,A,B,F_A);
compB: partB PORT MAP (SEL0,SEL1,Cin,Cout_B,A,B,F_B);
compC: partC PORT MAP (SEL0,SEL1,Cin,A,B,Cout_C,F_C);
compD: partD PORT MAP (SEL0,SEL1,Cin,Cout_D,A,B,F_D);

  RESULT<=	F_A WHEN SEL3='0' AND SEL2='0' AND Enable='1'
	ELSE F_B WHEN SEL3='0' AND SEL2='1' AND Enable='1'
	ELSE F_C WHEN SEL3='1' AND SEL2='0' AND Enable='1'
	ELSE F_D WHEN SEL3='1' AND SEL2='1' AND Enable='1';
 
  F<=RESULT;	

  CF<= 	Cout_A WHEN SEL3='0' AND SEL2='0' AND Enable='1'
	ELSE Cout_B WHEN SEL3='0' AND SEL2='1' AND Enable='1'
	ELSE Cout_C WHEN SEL3='1' AND SEL2='0' AND Enable='1'
	ELSE Cout_D WHEN SEL3='1' AND SEL2='1' AND Enable='1';

	NF<= Nin WHEN SEL3='1' AND SEL2='1' AND Enable='1'
	ELSE RESULT (31) WHEN Enable='1';
	ZF<= Zin WHEN SEL3='1' AND SEL2='1' AND Enable='1'
	ELSE '1' WHEN RESULT(31 DOWNTO 0) = "00000000000000000000000000000000" AND Enable='1'
	ELSE '0' WHEN Enable='1';
END archALU;