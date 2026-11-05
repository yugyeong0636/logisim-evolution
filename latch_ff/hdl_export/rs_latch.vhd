LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rs_latch IS
  PORT (
    s  : IN  std_logic;   -- Set
    r  : IN  std_logic;   -- Reset
    q  : OUT std_logic;
    qb : OUT std_logic
  );
END rs_latch;

ARCHITECTURE bhv OF rs_latch IS
  SIGNAL q_int, qb_int : std_logic;
BEGIN
  -- Cross-coupled NOR gates (same as the Logisim circuit)
  q_int  <= r NOR qb_int;
  qb_int <= s NOR q_int;

  q  <= q_int;
  qb <= qb_int;
END bhv;
