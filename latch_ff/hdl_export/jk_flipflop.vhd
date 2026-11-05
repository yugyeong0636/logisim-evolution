LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY jk_flipflop IS
  PORT (
    clk : IN  std_logic;  -- Clock signal
    j   : IN  std_logic;  -- Data input
    k   : IN  std_logic;  -- Data input
    q   : OUT std_logic   -- Data output
  );
END ENTITY jk_flipflop;

ARCHITECTURE bhv OF jk_flipflop IS
  SIGNAL q_internal : std_logic := '0';  -- Internal signal to represent output q
BEGIN
  -- Drive the output port q with the internal signal
  q <= q_internal;
  process(clk)
  begin
    -- Clock edge-triggered behavior
    if (clk'event and clk = '1') then
      if (j = '1' and k = '0') then
        q_internal <= '1';  -- Set output to 1
      elsif (j = '0' and k = '1') then
        q_internal <= '0';  -- Reset output to 0
      elsif (j = '1' and k = '1') then
        q_internal <= not q_internal;  -- Toggle the output
      end if; -- Close if block
    end if; -- Close main if block
  end process;
END ARCHITECTURE bhv;
