module Mux4to1 (w0,w1,w2,w3,s,f);
input w0,w1,w2,w3;
input [1:0]s;
output f;
reg f;
always@ (s or w0 or w1 or w2 or w3)
if (s==2'b00)
f<=w0;
else if (s==2'b01)
f<=w1;
else if (s==2'b10)
f<=w2;
else 
f<=w3;
endmodule