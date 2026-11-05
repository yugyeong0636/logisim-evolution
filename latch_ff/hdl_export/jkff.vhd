LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY jkff IS
  PORT (
    clk : IN  std_logic;  -- Clock signal
    j   : IN  std_logic;  -- Data input
    k   : IN  std_logic;  -- Data input
    clr : IN  std_logic;  -- Asynchronous clear signal
    set : IN  std_logic;  -- Asynchronous set signal
    q   : OUT std_logic   -- Data output
  );
END ENTITY jkff;

ARCHITECTURE bhv OF jkff IS
  SIGNAL q_internal : std_logic := '0';  -- Internal signal to represent output q
BEGIN
  -- Drive the output port q with the internal signal
  q <= q_internal;
  process(clk, clr, set)
  begin
    -- Asynchronous clear (highest priority)
    if clr = '1' then
      q_internal <= '0';
    -- Asynchronous set (second-highest priority)
    elsif set = '1' then
      q_internal <= '1';
    -- Clock edge-triggered behavior
    elsif (clk'event and clk = '1') then
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
