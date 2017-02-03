module Y0(S,y0,_Y0);
	input S,y0;
	output _Y0;
	
	assign _Y0 = ~S&y0 | S&~y0;
	
endmodule