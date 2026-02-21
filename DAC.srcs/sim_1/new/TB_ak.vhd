library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ak is
--  Port ( );
end TB_ak;

architecture Behavioral of TB_ak is
component	ak_wave	is	port(clk   : in  std_logic; -- Ê±ÖÓÐÅºÅ
                             wavek : out std_logic_vector(13 downto 0));
end	component;
signal	wave	:	std_logic_vector(13	downto	0);
signal  clk     :   STD_LOGIC:='0';


begin
tb_inst:	ak_wave	port	map(wavek=>wave,clk=>clk);
process begin
    loop
    clk<=not    clk;
    wait    for 10ns;
    end loop;
end process;
end Behavioral;
