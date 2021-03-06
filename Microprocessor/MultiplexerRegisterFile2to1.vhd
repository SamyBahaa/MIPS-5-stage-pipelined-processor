library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
  Entity Mux2_1 is
    port(A,B :in std_logic_vector(31 downto 0);
         S   :in std_logic;
         Z   :out std_logic_vector(31 downto 0)
         );
  End Mux2_1;
 
Architecture arch_Mux2_1 of Mux2_1 is 
   begin
       Z <=   A when s='0'
         else B;
 End arch_Mux2_1;

