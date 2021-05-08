interface dff_if(input clk);
logic   d;
logic   rst;
logic   q;

clocking cb @(posedge clk);
default input #1ns output #1ns;
input q;
output rst;
output d;
endclocking 

modport dut(input  clk,rst,d, output q);
modport tb (clocking cb);
endinterface               
