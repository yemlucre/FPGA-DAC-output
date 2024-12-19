library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DAC is
  Port (
        clk : IN  STD_LOGIC; 
        key4 : IN  STD_LOGIC; 
        key : IN  STD_LOGIC_VECTOR (2 downto 0);
        led0 :   buffer STD_LOGIC:='0';
        led1 :   buffer STD_LOGIC:='0';
        led2 :   buffer STD_LOGIC:='0';
        led3 :   out STD_LOGIC;
        clk_out :   out STD_LOGIC;
        wrt_out :   out STD_LOGIC;
        wave : OUT  STD_LOGIC_VECTOR (13 downto 0)
      );
end DAC;

architecture Behavioral of DAC is

    component LED_show is
        port (
            clk:IN    STD_LOGIC;
            led_out   :out    STD_LOGIC 
              );end component;
    
    component jc_wave is
        port (
            clk : std_logic;
            wavej : out STD_LOGIC_VECTOR (13 downto 0)
        );
    end component;
    
    component ak_wave is
        port (
            clk : in std_logic;
            wavek : out STD_LOGIC_VECTOR (13 downto 0)
        );
    end component;
    
    component sine_wave is
        port (
            clk : in STD_LOGIC;
            dac_out : out STD_LOGIC_VECTOR (13 downto 0)
        );
    end component;

    -- 信号声明
    signal stop : STD_LOGIC := '0';  -- 初始化 stop 信号
    signal s : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- 默认选择值
    signal wavej : STD_LOGIC_VECTOR (13 downto 0);  
    signal wavek : STD_LOGIC_VECTOR (13 downto 0);  
    signal waves : STD_LOGIC_VECTOR (13 downto 0);  
    signal clk125m : STD_LOGIC;   
     
begin

    -- 实例化各个波形生成模块
    led_inst : LED_show port map(clk => clk,  led_out =>led3 );
    jc_inst : jc_wave port map(clk => clk, wavej => wavej);
    ak_inst : ak_wave port map(clk => clk,  wavek => wavek);
    sin_inst : sine_wave port map(clk => clk,  dac_out => waves);


    
    -- 控制波形输出
    process(clk,  key4, s)  
    begin
        if rising_edge(clk) then    
            if key4 = '0' then
                stop <= not stop;  -- key4 控制 stop 信号反转
            end if;

            -- 根据 stop 状态选择波形
            if stop = '0' then
                case s is
                    when "01" => wave <= wavej;  -- wavej 波形
                    when "10" => wave <= wavek;  -- wavek 波形
                    when "11" => wave <= waves;  -- 正弦波
                    when others => wave <= (others => '0');  -- 无波形输出
                end case;
            else
                wave <= (others => '0');  -- 如果 stop = 1，输出无效波形
            end if;
        end if;
    end process;

    -- 处理 key 输入信号与 s 信号的映射
    process(key)
    begin
        case key is
            when "110" => s <= "01";  led0<=not  led0;-- 选择 wavej
            when "101" => s <= "10";  led1<=not  led1;-- 选择 wavek
            when "011" => s <= "11";  led2<=not  led2;-- 选择正弦波
            when others => s <= "01";  -- 默认（没有波形选择）
        end case;
    end process;

    process(clk)   begin
        clk_out<=clk;
        wrt_out<=clk;
    end process;
    
end Behavioral;
