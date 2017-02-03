module lab11control(q2,q1,q0,w,y2,y1,y0);
input q2,q1,q0,w;
output y2,y1,y0;
assign y2 = (q2&~q1&~w)|((q2^q1)&(~q0&w));
assign y1 = (~q2&~q0)&(q1^w);
assign y0 = (q2&~q1)&(q0^w);
endmodule