`ifndef __dff_testbench__
`define __dff_testbench__
//`include "d_cfg.sv"
//`include "d_env.sv"
program d_tb(dff_if.tb intf);

// Sample testcases class	
class testcase;

d_cfg cfg;
d_env env;
virtual dff_if intf;

function new(virtual dff_if intf);
  this.intf = intf;
endfunction

// Assign required configurations and run the environment
task run();
  cfg         = new();
  cfg.num_txn = 20;
  env         = new(cfg, intf);
  env.run();
endtask

endclass


// Creating object handle for testcase
testcase test;

// Creating test object and run it
initial begin
  test=new(intf);
  test.run();
end

endprogram

`endif
