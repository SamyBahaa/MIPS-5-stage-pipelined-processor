library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
  Entity Mux8_1 is
    port(A1,A2,A3,A4,A5,A6,A7,A8 :in std_logic_vector(31 downto 0);
         S                       :in std_logic_vector(2 downto 0);
         Z                       :out std_logic_vector(31 downto 0)
         );
  End Mux8_1;
 
Architecture arch_Mux8_1 of Mux8_1 is 
   begin
        Z <=     A1 when S = "000"
           else  A2 when S = "001"
           else  A3 when S = "010"
           else  A4 when S = "011"
           else  A5 when S = "100"
           else  A6 when S = "101"
           else  A7 when S = "110"
           else  A8 when S = "111"; 

 End arch_Mux8_1;

