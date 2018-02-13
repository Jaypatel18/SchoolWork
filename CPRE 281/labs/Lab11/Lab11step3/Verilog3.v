module Verilog3(q1,q0,w,y0,y1);
input q1,q0,w;
output y0,y1;
assign y0 = (~q0);
assign y1 = (q1^q0)^w;
endmodule
