LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_latch IS
PORT (
    clk : IN std_logic;
    d   : IN std_logic;
    q   : OUT std_logic
);
END d_latch;

ARCHITECTURE bhv OF d_latch IS
BEGIN

    PROCESS(clk, d)
    BEGIN
        IF (clk = '1') THEN
            q <= d;
        END IF;
    END PROCESS;

END bhv;
