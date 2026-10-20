--------------------------------------------------------------------------------
-- Description : 
-- 1, Write VHDL code.
-- 1)out1 <= a and b and c and d;
-- 2)out2 <= a or b or c or d;
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--entity
ENTITY and_or_out IS
  PORT (
        a, b, c, d : in std_logic;
        out1, out2 : out std_logic
    );
END and_or_out;  -- ENTITY are not absolutely necessary! END; 가능

--architecture
architecture bhv of and_or_out is
begin
    out1 <= a and b and c and d;
    out2 <= a or b or c or d;
end architecture bhv;
