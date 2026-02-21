library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- 使用现代的数字库

entity jc_wave is
  Port (
    clk   : in  STD_LOGIC;          -- 输入时钟信号
    wavej : out STD_LOGIC_VECTOR (13 downto 0)  -- 输出波形
  );
end jc_wave;

architecture Behavioral of jc_wave is
  signal cnt : unsigned(13 downto 0) := (others => '0');  -- 使用 unsigned 类型并初始化为0
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if cnt = to_unsigned(16383, 14) then  -- 最大值为 11111111111111（即16383）
        cnt <= (others => '0');  -- 计数器归零
      else
        cnt <= cnt + 1;  -- 递增计数器
      end if;
    end if;
  end process;

  -- 将 unsigned 转换为 STD_LOGIC_VECTOR 输出
  wavej <= std_logic_vector(cnt);

end Behavioral;
