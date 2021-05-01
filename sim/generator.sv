//`include "base_packet.sv"
class gen;
base b;
mailbox gen2drv;

function new(base b, mailbox gen2drv);
	this.b=b;
	this.gen2drv=gen2drv;
endfunction

task gen_run;
begin
b.randomize();
gen2drv.put(b);
end
endtask

endclass
