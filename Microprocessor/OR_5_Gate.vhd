library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_5_Gate is
    Port ( clk  : in  STD_LOGIC;  
           INO1 : in  STD_LOGIC;  
           INO2 : in  STD_LOGIC;
           INO3 : in  STD_LOGIC;  
           INO4 : in  STD_LOGIC;  
           INO5 : in  STD_LOGIC;
           OO : out  STD_LOGIC
          );  
end entity OR_5_Gate;

architecture arch_OR_5_Gate of OR_5_Gate is
begin
 process(clk)
 begin
 if rising_edge(clk) then 
OO <= INO1 or INO2 or INO3 or INO4 or INO5;    
end if;
end process;
end arch_OR_5_Gate;

