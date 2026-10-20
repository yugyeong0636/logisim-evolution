--------------------------------------------------------------------------------
-- Description :
-- 8-to-1 Multiplexer
--------------------------------------------------------------------------------
-- ch.. 8개니까 2^3... 000 001 010 011 ...
-- 
-- 
-- 
-- 
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity
ENTITY multiplexer_8_1 IS
  PORT (
        a, b, c, d, e, f, g, h : in std_logic;
        ch : in std_logic_vector(2 downto 0);
        data : out std_logic
    );
END multiplexer_8_1;

--arcitecture
ARCHITECTURE bhv OF multiplexer_8_1 IS
BEGIN
    process(a, b, c, d, e, f, g, h, ch)
    begin
        case ch is
            when "000" => data <= a;
            when "001" => data <= b;
            when "010" => data <= c;
            when "011" => data <= d;
            when "100" => data <= e;
            when "101" => data <= f;
            when "110" => data <= g;
            when others => data <= '0';
        end case;
    end process;
END bhv;

