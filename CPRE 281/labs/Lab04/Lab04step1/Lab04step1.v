module Lab04step1(F,G,C,W,A);
	input F, G, C, W;
	output A;
	reg A;
	
	always @(F or C or G or W)
	begin 
		case({F,C,G,W})
			4'b0000: A= 'b0;
			4'b0001: A= 'b0;
			4'b0010: A= 'b0;
			4'b0011: A= 'b1;
			4'b0100: A= 'b0;
			4'b0101: A= 'b0;
			4'b0110: A= 'b1;
			4'b0111: A= 'b1;
			4'b1000: A= 'b1;
			4'b1001: A= 'b1;
			4'b1010: A= 'b0;
			4'b1011: A= 'b0;
			4'b1100: A= 'b1;
			4'b1101: A= 'b0;
			4'b1110: A= 'b0;
			4'b1111: A= 'b0;
		endcase;
	end
endmodule 