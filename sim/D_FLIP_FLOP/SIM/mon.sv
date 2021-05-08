
`ifndef __dff_mon__
`define __dff_mon__
//`include "d_pkt.sv"
class d_mon;

mailbox mon2sb;
virtual dff_if intf;
d_pkt pkt;
function new(mailbox mon2sb,virtual dff_if intf,d_pkt pkt);
  this.mon2sb = mon2sb;
  this.intf   = intf;
  this.pkt=pkt;
endfunction


task run();
//d_pkt pkt;
begin
	@(intf.cb);
 pkt.q=intf.q;
 $display("@%0t Monitor :: pkt =%p ", $time, pkt);
 mon2sb.put(pkt);
  /*while (mon2sb.num()!=0) begin	
    @(posedge intf.clk);
    pkt   = new();
    pkt.q = intf.q;
    $display("@%0t, Monitor pkt =%p",$time(), pkt);
    mon2sb.put(pkt);
  end*/
end
endtask

endclass
