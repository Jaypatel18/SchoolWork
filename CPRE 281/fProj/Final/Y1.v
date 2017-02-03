module Y1(S,y3,y2,y1,y0,_Y1);
	input S,y3,y2,y1,y0;
	output _Y1;
	
	assign _Y1 = ~S&y2&~y1&~y0 | ~S&~y2&~y1&y0 | ~S&~y2&y1&~y0 | S&y3&y0 | S&y2&~y1&y0 | S&y2&y1&~y0 | S&~y3&~y2&~y1&~y0;
	
endmodule