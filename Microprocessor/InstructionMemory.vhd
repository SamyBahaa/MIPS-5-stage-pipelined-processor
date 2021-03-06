library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all; -- Required for freading a file

Entity InstructionMemory is
  port(
      PC_value        : in std_logic_vector(31 downto 0);
      Instruction_out : out std_logic_vector(31 downto 0)
      );
End Entity InstructionMemory;

Architecture arch_InstructionMemory Of InstructionMemory Is
  type ram_type is array (0 to 4095) of std_logic_vector(15 downto 0); --2^12=4KB  4096 byte
	signal ram       : ram_type;
	signal rPC_value :  std_logic_vector(10 downto 0);
  BEGIN
       rPC_value<= std_logic_vector(unsigned(PC_value(10 downto 0)) + 1);
--       process
--		        file file_pointer : text;
--            variable line_content : string(1 to 16);
--            variable line_num : line;
--            variable i: integer := 0;
--            variable j : integer := 0;
--            variable char : character:='0'; 
--	     begin
--	          -- Open instructions.txt and only read from it
--            file_open(file_pointer, "instructions.txt", READ_MODE);
--            -- Read until the end of the file is reached
--            while not endfile(file_pointer) loop
--           readline(file_pointer,line_num); -- Read a line from the file
--            READ(line_num,line_content); -- Turn the string into a line 
            -- Convert each character in the string to a bit and save into memory
--                  for j in 1 to 16 loop        
--                     char := line_content(j);
--                      if(char = '1') then
--                          ram(i)(16-j) <= '1';
--                      else
--                          ram(i)(16-j) <= '0';
--                      end if; 
--                 end loop;
--                  i := i + 1;
--              end loop;
--              file_close(file_pointer); -- Close the file 
--              wait; 
--	     end process;
	Instruction_out    <= ram(to_integer(unsigned(PC_value(10 downto 0))))& ram(to_integer(unsigned(rPC_value)));
End arch_InstructionMemory;    