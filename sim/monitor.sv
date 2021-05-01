//`include "base_packet.sv"
class monitor;
base b;
mailbox mon2sb;

virtual m_intf ifc;
function new(base b,mailbox mon2sb, virtual m_intf ifc);
	this.b=b;
	this.mon2sb=mon2sb;
	this.ifc=ifc;
endfunction

task mon_run();
begin
b.in0=ifc.in0;
b.in1=ifc.in1;
b.sel=ifc.sel;
mon2sb.put(b);
end
endtask

endclass
