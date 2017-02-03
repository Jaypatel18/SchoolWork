module Y3(S,y3,y2,y1,y0,_Y3);
	input S,y3,y2,y1,y0;
	output _Y3;
	
	assign _Y3 = ~S&~y2&y1&y0 | ~S&y2&y1&~y0 | S&~y2&y1&~y0 | S&~y3&~y2&~y1&y0;
endmodule