module num_7seg_B (out, w, x, y, z);

input w;
input x;
input y;
input z;
output out;

wire w, x, y, z, out;

assign out = w || (x&&(!y)) || (x&&(!z)) || ((!y)&&(!z));
endmodule