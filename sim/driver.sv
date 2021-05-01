//`include "base_packet.sv"
class driver;
base b;
mailbox gen2drv,drv2sb;
virtual m_intf inf;

function new(base b, mailbox gen2drv,drv2sb,virtual m_intf inf);
this.b=b;
this.gen2drv=gen2drv;
this.drv2sb=drv2sb;
this.inf=inf;
endfunction
task drv_run;
begin
gen2drv.get(b);
inf.in0=b.in0;
inf.in1=b.in1;
inf.sel=b.sel;
drv2sb.put(b);
end

endtask

endclass
