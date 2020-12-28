module huffman_decoder(x, y, clk, reset);
input x;
input clk;
input reset;
output reg [2:0] y;
reg [3:0] state;
reg [3:0] next_state;
parameter S0 = 4'b1111, S1 = 4'b0000, S2 = 4'b0001, S3 = 4'b0010, S4 = 4'b0011, S5 = 4'b0100, S6 = 4'b0101, S7 = 4'b0110, S8 = 4'b0111, S9 = 4'b1100, S10 = 4'b1101;

always @(posedge clk or posedge reset)
begin
if (reset == 1) begin
	y <= 3'b000;
	state <= S0;
end
else begin
	state <= next_state;

	case(next_state)
	S1: y <= 3'b001;
	S5: y <= 3'b011; 
	S6: y <= 3'b010; 
	S8: y <= 3'b100;
	S9: y <= 3'b110; 
	S10: y <= 3'b101; 
	default: y <= 3'b000;
	endcase
end

end


always @(*)
begin
	case (state)
	S0: if(x) next_state = S2; else next_state = S1;
	S1: if(x) next_state = S2; else next_state = S1;
	S2: if(x) next_state = S4; else next_state = S3;
	S3: if(x) next_state = S6; else next_state = S5;
	S4: if(x) next_state = S8; else next_state = S7;
	S5: if(x) next_state = S2; else next_state = S1;
	S6: if(x) next_state = S2; else next_state = S1;
	S7: if(x) next_state = S10; else next_state = S9;
	S8: if(x) next_state = S2; else next_state = S1;
	S9: if(x) next_state = S2; else next_state = S1;
	S10: if(x) next_state = S2; else next_state = S1;
	default: next_state = S0;
	endcase

end

endmodule