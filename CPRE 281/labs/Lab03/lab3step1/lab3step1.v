module lab3step1 (Alarm, Cabbage, Goat, Wolf);

	input Cabbage, Goat, Wolf;
	output Alarm;
	
	
	and(k, Goat, Wolf); // k = Goat and Wolf
	not(w, Wolf); // Wolf is innverted and stored into w. w = !Wolf
	not(c, Cabbage); // Cabbage is inverted and stored into c. c = !Cabbage
	not(g, Goat); // Goat is inverted and stored into g. g = !Goat
	and(h, c, g); // h = c(!Cabbage) and g(!Wolf)
	and(u, w, Cabbage); // u = !Wolf and Cabbage
	or(Alarm, k, h, u);
	
endmodule