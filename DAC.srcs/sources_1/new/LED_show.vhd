library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_show is
  Port (
  clk:IN    STD_LOGIC;
  led_out   :out    STD_LOGIC 
        );
end LED_show;

architecture Behavioral of LED_show is
signal  led:STD_LOGIC:='0';
signal  cnt:unsigned(25 downto 0) := (others => '0');
begin
    process(clk) begin
        if rising_edge(clk) then
            if cnt = 49999999 then  -- 计数到50,000,000
                cnt <= (others => '0');
                led <= not led;  -- 每计数到50,000,000就翻转一次输出时钟信号
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    led_out <=   led;
end Behavioral;
