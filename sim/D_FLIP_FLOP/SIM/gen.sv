//********************************************
`ifndef __dff_gen__
`define __dff_gen__
//`include "d_pkt.sv"
//`include "d_cfg.sv"
class d_gen;

d_cfg   cfg;
d_pkt   pkt;
mailbox gen2drv;
mailbox gen2sb;

function new(d_cfg cfg,mailbox gen2drv,mailbox gen2sb,d_pkt pkt);
  this.cfg     = cfg;
  this.gen2drv = gen2drv;
  this.gen2sb  = gen2sb;
  this.pkt     = pkt;
endfunction

task run();
begin
 // repeat(cfg.num_txn) begin
    pkt=new();
    pkt.randomize();
    $display("@%0t generator :: pkt=%p",$time , pkt);
    gen2drv.put(pkt);
    gen2sb.put(pkt);
 // end
end
endtask

endclass
