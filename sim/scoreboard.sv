//`include "base_packet.sv"

class score;
base b1,b2;
mailbox mon2sb,drv2sb;

function new(base b1,b2, mailbox drv2sb,mon2sb);
this.b1=b1;
this.b2=b2;
this.drv2sb=drv2sb;
this.mon2sb=mon2sb;
endfunction

task sb_run;
 begin
       drv2sb.get(b1);
       mon2sb.get(b2);
       if(b2.out==(b1.out))
         $display($time,"Data from montior and driver is  matched,b1.in0=%b,b1.in1=%b,b2.in0=%b,b2.in1=%b,b1.sel=%b,b2.sel=%b,b2.out=%b,b1.out=%b",
        b1.in0,b1.in1,b2.in0,b2.in1,b1.sel,b2.sel,b1.out,b2.out);
       else
         $display($time,"Data from monitor and driver is not matched,b1.in0=%b,b1.in1=%b,b2.in0=%b,b2.in1=%b,b1.sel=%b,b2.sel=%b,b2.out=%b,b1.out=%b",
        b1.in0,b1.in1,b2.in0,b2.in1,b1.sel,b2.sel,b1.out,b2.out);
  end


endtask

endclass
