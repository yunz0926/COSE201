module zero_detector (
output [1:0] present_state,
output y,
input x,
input clock,
input reset
);

reg [1:0] next_state;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

always @ (posedge clock, negedge reset)
if (reset == 0) present_state <= S0;
else 
begin
	case(present_state)
	S0: if (x) next_state = S0; else next_state = S1;
	S1: if (x) next_state = S0; else next_state = S2;
	S2: if (x) next_state = S0; else next_state = S2;
	endcase
end 

assign y = present_state[1] & (~present_state[0]);

endmodule