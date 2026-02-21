library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ak_wave is
  Port (
     clk      : in  STD_LOGIC;        -- 输入时钟信号
     wavek : out std_logic_vector(13 downto 0)
  );
end ak_wave;

architecture Behavioral of ak_wave is
  signal cnt : unsigned(13 downto 0) := (others => '0');
  signal s   : std_logic := '0'; -- 控制计数方向
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if s = '0' then
        if cnt = "11111111111111" then
          s <= '1'; -- 切换到递减
          cnt<="11111111111110";
        else
          cnt <= cnt + 1; -- 递增
        end if;
      else
        if cnt = "00000000000000" then
          s <= '0'; -- 切换到递增
          cnt<="00000000000001";
        else
          cnt <= cnt - 1; -- 递减
        end if;
      end if;
    end if;
  end process;

  -- 输出波形
  wavek <= std_logic_vector(cnt);
end Behavioral;
