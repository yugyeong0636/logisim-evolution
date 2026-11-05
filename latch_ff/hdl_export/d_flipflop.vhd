LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flipflop IS
  PORT (
    clk : IN std_logic;
    d   : IN std_logic;
    q   : OUT std_logic
  );
END d_flipflop;


ARCHITECTURE bhv OF d_flipflop IS
BEGIN
  process(clk)
  BEGIN
    IF (clk'event AND clk = '1') THEN
      q <= d;
    END IF;
  END process;
END bhv;
