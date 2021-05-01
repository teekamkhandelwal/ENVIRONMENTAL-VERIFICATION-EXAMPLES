interface m_intf;
logic in0;
logic in1;
logic sel;
logic out;
modport dut(input in0,in1,sel, output out);
modport tb(input out ,output in0,in1,sel);
endinterface
