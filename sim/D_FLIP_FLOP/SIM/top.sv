//********************************************
`include "d_intf.sv"
`include "d_dut.sv"
`include "d_cfg.sv"
`include "d_pkt.sv"
`include "d_drv.sv"
`include "d_mon.sv"
`include "d_gen.sv"
`include "d_sb.sv"
`include "d_env.sv"
`include "d_tb.sv"

module top();

bit clk;

dff_if intf(clk);
dut    inst(intf);
d_tb   tb(intf);

initial begin
  clk=0 ;
  forever #5 clk=~clk;
end

endmodule
