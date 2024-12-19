library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_JC is
--  Port ( );
end TB_JC;

architecture Behavioral of TB_JC is
component	jc_wave	is	
     Port (
        clk      : in  STD_LOGIC;        -- ÊäÈëÊ±ÖÓÐÅºÅ
  		wavej    :  out STD_LOGIC_VECTOR (13 downto 0)
  		);
end	component;
signal	wave	:	STD_LOGIC_VECTOR (13 downto 0);
signal  clk     :   STD_LOGIC:='0';
begin

tb_inst:	jc_wave	port	map(wavej=>wave,clk=>clk);
process begin
    clk<=not    clk;
    wait    for 10ns;
end process;
end Behavioral;
