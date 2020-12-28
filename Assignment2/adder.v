module cla_gen(P, G, C0, C);
parameter W = 4; 
output [W : 0] C;
wire [W : 0] C;
input [W-1 : 0] P, G;
input C0;

assign C[0] = C0;

genvar i;
for(i = 0; i < W; i = i + 1)
begin
	assign C[i+1] = G[i] | (P[i]&C[i]);
end

endmodule

module addsub_cla(A, B, M, S, C, V);
parameter W = 4;
input [W-1 : 0] A;
input [W-1 : 0] B;
input M;
output [W-1 : 0] S;
output C, V;

wire [W-1 : 0] S;
wire [W : 0] CARRY;
wire [W-1 : 0] P;
wire [W-1 : 0] G;
 
genvar i;
for(i = 0; i < W; i = i + 1)
begin
	assign P[i] = (B[i]^M)^A[i];
	assign G[i] = (B[i]^M)&A[i]; 
end


cla_gen #(W) CLAGEN (P, G, M, CARRY);

for(i = 0; i < W; i = i + 1)
begin
	assign S[i] = P[i]^CARRY[i]; 
end

assign C = CARRY[W]; 
assign V = CARRY[W]^CARRY[W-1];

endmodule