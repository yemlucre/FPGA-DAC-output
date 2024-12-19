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

    -- �ź�����
    signal stop : STD_LOGIC := '0';  -- ��ʼ�� stop �ź�
    signal s : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Ĭ��ѡ��ֵ
    signal wavej : STD_LOGIC_VECTOR (13 downto 0);  
    signal wavek : STD_LOGIC_VECTOR (13 downto 0);  
    signal waves : STD_LOGIC_VECTOR (13 downto 0);  
    signal clk125m : STD_LOGIC;   
     
begin

    -- ʵ����������������ģ��
    led_inst : LED_show port map(clk => clk,  led_out =>led3 );
    jc_inst : jc_wave port map(clk => clk, wavej => wavej);
    ak_inst : ak_wave port map(clk => clk,  wavek => wavek);
    sin_inst : sine_wave port map(clk => clk,  dac_out => waves);


    
    -- ���Ʋ������
    process(clk,  key4, s)  
    begin
        if rising_edge(clk) then    
            if key4 = '0' then
                stop <= not stop;  -- key4 ���� stop �źŷ�ת
            end if;

            -- ���� stop ״̬ѡ����
            if stop = '0' then
                case s is
                    when "01" => wave <= wavej;  -- wavej ����
                    when "10" => wave <= wavek;  -- wavek ����
                    when "11" => wave <= waves;  -- ���Ҳ�
                    when others => wave <= (others => '0');  -- �޲������
                end case;
            else
                wave <= (others => '0');  -- ��� stop = 1�������Ч����
            end if;
        end if;
    end process;

    -- ���� key �����ź��� s �źŵ�ӳ��
    process(key)
    begin
        case key is
            when "110" => s <= "01";  led0<=not  led0;-- ѡ�� wavej
            when "101" => s <= "10";  led1<=not  led1;-- ѡ�� wavek
            when "011" => s <= "11";  led2<=not  led2;-- ѡ�����Ҳ�
            when others => s <= "01";  -- Ĭ�ϣ�û�в���ѡ��
        end case;
    end process;

    process(clk)   begin
        clk_out<=clk;
        wrt_out<=clk;
    end process;
    
end Behavioral;
