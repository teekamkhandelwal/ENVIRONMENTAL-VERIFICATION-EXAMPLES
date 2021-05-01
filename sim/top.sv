`include "interface.sv"
`include "environment.sv"
//`include "dut.sv"
module mux_top;
m_intf if1();
dut d2(if1.dut);
environment1 e2(if1.tb);
endmodule
