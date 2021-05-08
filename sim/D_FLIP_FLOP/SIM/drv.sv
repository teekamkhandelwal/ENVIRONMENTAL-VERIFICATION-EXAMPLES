`ifndef __dff_drv__
`define __dff_drv__
//`include "d_pkt.sv"

class d_drv;
  mailbox         gen2drv;
  d_pkt           pkt;
  virtual dff_if  intf;

  function new(mailbox gen2drv, virtual dff_if  intf,d_pkt pkt);
   this.gen2drv = gen2drv;
   this.intf    = intf;
   this.pkt=pkt;
  endfunction

  task run();
  begin 
 gen2drv.get(pkt);
 intf.rst=1;
 #11 intf.rst=0;

  #1 intf.d=pkt.d;
 $display("@%0t Driver :: pkt =%p ",$time, pkt );
  end
   /*pkt =new();
   while(gen2drv.num()!=0)begin
     $display("@%0t, Driving pkt =%p",$time,pkt);
     gen2drv.get(pkt);
     intf.d   <= pkt.d;
     intf.rst<=1;
     @(posedge intf.clk);
     #1;
     intf.d   <=1'bx;
    end*/
  endtask

endclass

`endif
