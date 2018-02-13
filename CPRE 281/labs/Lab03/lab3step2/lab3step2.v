module lab3step2 (Alarm, Cabbage, Goat, Wolf);

	input Cabbage, Goat, Wolf;
	output Alarm;
	
	assign Alarm = (Cabbage & ~Wolf) | (~Cabbage & ~Goat) | (Goat & Wolf);
	
	endmodule