module mproj(W,X,Y,Z,B);
	input W,X,Y,Z;
	output B;
		
	assign B =(X&~Y&Z)|(W&Z&Y)|(~W&~X&Y&~Z);
	
endmodule