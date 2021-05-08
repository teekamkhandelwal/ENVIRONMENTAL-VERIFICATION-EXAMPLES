module dut(dff_if.dut intf);

  always@(posedge intf.clk)
  begin
    if(intf.rst==1)
      intf.q<=1'b0;
    else
      intf.q<=intf.d;
  end

endmodule
