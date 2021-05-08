`ifndef __dff_sb__
`define __dff_sb__
`include "d_pkt.sv"
class d_sb;

mailbox mon2sb;
mailbox gen2sb;
d_pkt   exp,recd;

function new(d_pkt exp,recd, mailbox mon2sb,mailbox gen2sb);
  this.mon2sb = mon2sb;
  this.gen2sb = gen2sb;
  this.exp    = exp;
  this.recd   = recd;
endfunction

task run();
  while(mon2sb.num()!=0)
  begin
   gen2sb.get(exp);
   mon2sb.get(recd);
   if(recd.q != exp.d)
     $display("@%0t, Error: not matched recd::Q=%p, EXP::Q=%p",$time,recd.q, exp.d);
   else
     $display("@%0t, Info: matched recd::Q=%p, EXP::Q=%p",$time,recd.q, exp.d);
  end
endtask

endclass

`endif
