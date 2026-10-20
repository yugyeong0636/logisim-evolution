--------------------------------------------------------------------------------
-- Description :
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity voting_with_25 is
    port (
        vt : in std_logic_vector(25 downto 1);
        result : out std_logic
    );
end entity voting_with_25;

--architecture
architecture bhv of voting_with_25 is
begin
    process(vt)
        variable sum : integer range 0 to 25;
    begin
        sum := 0;
        for i in 1 to 25 loop
            if (vt(i) = '1') then
                sum := sum + 1;
                if sum >= 13 then
                    result <= '1';
                else
                    result <= '0';
                end if;
            end if;
        end loop;
    end process;
end architecture bhv;

