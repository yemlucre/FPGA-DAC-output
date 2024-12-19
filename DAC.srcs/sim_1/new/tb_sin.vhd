library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sin is
--  Port ( );
end tb_sin;

architecture Behavioral of tb_sin is
component   sine_wave is  
    port(
    clk      : in  STD_LOGIC;          
    dac_out  : out STD_LOGIC_VECTOR (13 downto 0)        
        );
end component;
signal  clk :STD_LOGIC:='0';
signal  dac_out :STD_LOGIC_VECTOR (13 downto 0);

begin
sine_inst:  sine_wave port 
    map(clk=>clk,dac_out=>dac_out);
process begin
    loop
    clk<=not    clk;
    wait    for 5ns;
    end loop;
end process;
end Behavioral;
