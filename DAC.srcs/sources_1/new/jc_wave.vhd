library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- ʹ���ִ������ֿ�

entity jc_wave is
  Port (
    clk   : in  STD_LOGIC;          -- ����ʱ���ź�
    wavej : out STD_LOGIC_VECTOR (13 downto 0)  -- �������
  );
end jc_wave;

architecture Behavioral of jc_wave is
  signal cnt : unsigned(13 downto 0) := (others => '0');  -- ʹ�� unsigned ���Ͳ���ʼ��Ϊ0
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if cnt = to_unsigned(16383, 14) then  -- ���ֵΪ 11111111111111����16383��
        cnt <= (others => '0');  -- ����������
      else
        cnt <= cnt + 1;  -- ����������
      end if;
    end if;
  end process;

  -- �� unsigned ת��Ϊ STD_LOGIC_VECTOR ���
  wavej <= std_logic_vector(cnt);

end Behavioral;
