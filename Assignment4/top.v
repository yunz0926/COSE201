module TOP;
wire [1:0] p_state;
wire y_out;
reg x_in;
reg CLOCK;
reg t_reset;
// create instance of zero_detector
zero_detector Z1(p_state,y_out,x_in,CLOCK,t_reset);
// simulate for 200 time units
initial #200 $finish;
// create reset signal
initial
begin
t_reset = 0;
#3 t_reset = 1;
end
// create clock signal
initial
begin
CLOCK = 0;
repeat (40)
#5 CLOCK = ˜CLOCK; // at every 5 time units
end
// create input signal
initial
begin
x_in = 0; #12 x_in = 1;
repeat (8)
#20 x_in = ˜x_in;
end
// create dumpfile to view waveforms
initial
begin
$dumpfile("hw_dump.vcd");
$dumpvars;
end
endmodule