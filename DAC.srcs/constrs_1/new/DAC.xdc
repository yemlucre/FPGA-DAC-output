set_property -dict { PACKAGE_PIN U18    IOSTANDARD LVCMOS33 } [get_ports clk]
#set_property CLOCK_DEDICATED_ROUTE TRUE [get_ports clk]
set_property -dict { PACKAGE_PIN N15    IOSTANDARD LVCMOS33 } [get_ports { key[0] }]
set_property -dict { PACKAGE_PIN N16    IOSTANDARD LVCMOS33 } [get_ports { key[1] }]
set_property -dict { PACKAGE_PIN T17    IOSTANDARD LVCMOS33 } [get_ports { key[2] }]
set_property -dict { PACKAGE_PIN R17    IOSTANDARD LVCMOS33 } [get_ports { key4 }]

set_property -dict { PACKAGE_PIN M14    IOSTANDARD LVCMOS33 } [get_ports { led0 }]
set_property -dict { PACKAGE_PIN M15    IOSTANDARD LVCMOS33 } [get_ports { led1 }]
set_property -dict { PACKAGE_PIN K16    IOSTANDARD LVCMOS33 } [get_ports { led2 }]
set_property -dict { PACKAGE_PIN J16    IOSTANDARD LVCMOS33 } [get_ports { led3 }]

# Ϊ wave[0] �� wave[13] ��������
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { wave[0] }]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { wave[1] }]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { wave[2] }]
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { wave[3] }]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { wave[4] }]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { wave[5] }]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { wave[6] }]
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { wave[7] }]
set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports { wave[8] }]
set_property -dict { PACKAGE_PIN G20   IOSTANDARD LVCMOS33 } [get_ports { wave[9] }]
set_property -dict { PACKAGE_PIN F19   IOSTANDARD LVCMOS33 } [get_ports { wave[10] }]
set_property -dict { PACKAGE_PIN F20   IOSTANDARD LVCMOS33 } [get_ports { wave[11] }]
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { wave[12] }]
set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { wave[13] }]
set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports { wrt_out }]
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { clk_out }]