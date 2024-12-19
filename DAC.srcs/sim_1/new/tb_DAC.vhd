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

  -- 信号定义
  signal clk : STD_LOGIC := '0';
  signal key4 : STD_LOGIC := '1';  -- key4 信号固定为 1，可以根据需要修改
  signal key : STD_LOGIC_VECTOR (2 downto 0) := "000";  -- 初始化 key 为 "000"
  signal wave : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";  -- 初始化 wave 为 0
  signal    led0:STD_LOGIC;
  signal    led1:STD_LOGIC:='0';
  signal    led2:STD_LOGIC:='0';
  signal    led3:STD_LOGIC:='0';
  signal    clk_tb  :    STD_LOGIC;
  signal    wrt_tb  :    STD_LOGIC;

begin
  -- 实例化 DAC 组件
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

  -- 时钟生成过程（每 5ns 切换一次时钟信号）
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
    -- 测试用例 1：设置 key 为 "101"
    key <= "110";
    wait for 2  ms;  -- 等待 50ns 后改变 key 信号
    
    -- 测试用例 2：设置 key 为 "010"
    key <= "101";
    wait for 2  ms;

    -- 测试用例 3：设置 key 为 "111"
    key <= "011";
    wait for 2  ms;
    
    -- 测试用例 4：设置 key 为 "000"
    key <= "000";
    wait for 2  ms;
end process;

end Behavioral;
