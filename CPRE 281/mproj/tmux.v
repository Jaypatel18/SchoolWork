module tmux(A,B,C,S);
	input A,C,S;
	output B;
	
		assign B = ((A&~S)|(B&S));
		
endmodule 