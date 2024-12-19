library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_DAC is
--  Port ( );
end tb_DAC;

architecture Behavioral of tb_DAC is
  component DAC is
    Port (
      clk : IN  STD_LOGIC; 
      key4 : IN  STD_LOGIC; 
      led0 :   buffer STD_LOGIC;
      led1 :   buffer STD_LOGIC;
      led2 :   buffer STD_LOGIC;
      led3 :   out STD_LOGIC;
      clk_out :   out STD_LOGIC;
      wrt_out :   out STD_LOGIC;
      key : IN  STD_LOGIC_VECTOR (2 downto 0);
      wave : OUT  STD_LOGIC_VECTOR (13 downto 0)
    );
  end component;

  -- �źŶ���
  signal clk : STD_LOGIC := '0';
  signal key4 : STD_LOGIC := '1';  -- key4 �źŹ̶�Ϊ 1�����Ը�����Ҫ�޸�
  signal key : STD_LOGIC_VECTOR (2 downto 0) := "000";  -- ��ʼ�� key Ϊ "000"
  signal wave : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";  -- ��ʼ�� wave Ϊ 0
  signal    led0:STD_LOGIC;
  signal    led1:STD_LOGIC:='0';
  signal    led2:STD_LOGIC:='0';
  signal    led3:STD_LOGIC:='0';
  signal    clk_tb  :    STD_LOGIC;
  signal    wrt_tb  :    STD_LOGIC;

begin
  -- ʵ���� DAC ���
  inst_DAC: DAC port map (
    clk_out=>clk_tb,
    wrt_out=>wrt_tb,
    clk => clk,
    key4 => key4,
    key => key,
    wave => wave,
    led0    =>  led0,
    led1    =>  led1,
    led2    =>  led2,
    led3    =>  led3
  );

  -- ʱ�����ɹ��̣�ÿ 5ns �л�һ��ʱ���źţ�
  process
  begin
--  key <= "011";
    loop
      clk <= not clk;
      wait for 10 ns;   
    end loop;
  end process;
  
process
  begin
    -- �������� 1������ key Ϊ "101"
    key <= "110";
    wait for 2  ms;  -- �ȴ� 50ns ��ı� key �ź�
    
    -- �������� 2������ key Ϊ "010"
    key <= "101";
    wait for 2  ms;

    -- �������� 3������ key Ϊ "111"
    key <= "011";
    wait for 2  ms;
    
    -- �������� 4������ key Ϊ "000"
    key <= "000";
    wait for 2  ms;
end process;

end Behavioral;
