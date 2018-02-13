package edu.iastate.cs228.hw1;

import static org.junit.Assert.*;

import org.junit.Test;

public class PredatorPreyTest {
	World w1;
	World w2;

	
	@Test
	public void testUpdateWorld() {
		//fail("Not yet implemented");
		PredatorPrey.updateWorld(w1, w2);
		BadgerTest badgerTest = new BadgerTest();
		FoxTest foxTest = new FoxTest();
		EmptyTest emptyTest = new EmptyTest();
		GrassTest grassTest = new GrassTest();
		RabbitTest rabbitTest = new RabbitTest();
		// other livings
		for (int i = 0; i < w1.getWidth(); i++) {
			for (int j = 0; j < w1.getWidth(); j++) {
				if (w2.grid[i][j].who() == State.BADGER) {
					badgerTest.testNext();
				} else if (w2.grid[i][j].who() == State.FOX) {
					foxTest.testNext();
				} else if (w2.grid[i][j].who() == State.EMPTY) {
					emptyTest.testNext();
				} else if(w2.grid[i][j].who() == State.GRASS){
					grassTest.testNext();
				} else if(w2.grid[i][j].who() == State.RABBIT){
					rabbitTest.testNext();
				}
			}
		}
		
	}

}
