module Y2(S,y3,y2,y1,y0,_Y2);
	input S,y3,y2,y1,y0;
	output _Y2;
	
	assign _Y2 = y3 | ~S&y2&~y1&y0 | ~S&~y2&y1&~y0 | S&y2&y1&y0 | S&~y2&~y1&~y0;
	
endmodule
