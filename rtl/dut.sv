module dut(m_intf.dut mint);
assign mint.out = mint.sel? mint.in1: mint.in0;
endmodule
