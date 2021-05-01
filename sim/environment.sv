`include "base_packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

program environment1(m_intf.tb t);
base b1,b2;
gen g1;
driver d1;
monitor m1;
score s1;
mailbox gen2drv,drv2sb,mon2sb;

initial  begin
 b1=new;
 b2=new;
 gen2drv=new;
 drv2sb=new;
 mon2sb=new;
 g1=new(b1,gen2drv);
 d1=new(b1,gen2drv,drv2sb,t);
 m1=new(b2,mon2sb,t);
 s1=new(b1,b2,drv2sb,mon2sb);

end

initial 
 begin
repeat(5) begin
 g1.gen_run();
d1.drv_run();
m1.mon_run();
s1.sb_run();
#5;
end
 end

endprogram
