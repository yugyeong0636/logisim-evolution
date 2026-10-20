library ieee;
use ieee.std_logic_1164.all;

--entity
entity vote_display is
    port (
        en      : in  std_logic;
        vt      : in  std_logic_vector(15 downto 1);
        display : out std_logic_vector(7 downto 0)
    );
end entity vote_display;

--architecture
architecture bhv of vote_display is
begin
    process(en, vt)
        variable sum : integer range 0 to 15;
    begin
        -- 1의 개수 세기
        sum := 0;
        for i in 1 to 15 loop
            if vt(i) = '1' then
                sum := sum + 1;
            end if;
        end loop;

        if en = '1' then
            -- en = '1' : 결과 표시
            case sum is
                when 0  => display <= "11111101";  -- 0
                when 1  => display <= "01100001";  -- 1
                when 2  => display <= "11011011";  -- 2
                when 3  => display <= "11110011";  -- 3
                when 4  => display <= "01100111";  -- 4
                when 5  => display <= "10110111";  -- 5
                when 6  => display <= "10111111";  -- 6
                when 7  => display <= "11100001";  -- 7
                when 8  => display <= "11111111";  -- 8
                when 9  => display <= "11110111";  -- 9
                when 10 => display <= "11101111";  -- A
                when 11 => display <= "00111111";  -- b (B)
                when 12 => display <= "10011101";  -- C
                when 13 => display <= "01111011";  -- d (D)
                when 14 => display <= "10011111";  -- E
                when 15 => display <= "10001111";  -- F
                when others => display <= "00000000";
            end case;
        else
            -- en = '0' (또는 그 외) : 꺼짐
            display <= "00000000";
        end if;
    end process;
end architecture bhv;