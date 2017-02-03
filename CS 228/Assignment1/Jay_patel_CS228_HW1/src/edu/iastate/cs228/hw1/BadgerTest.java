package edu.iastate.cs228.hw1;

import static org.junit.Assert.*;
import java.io.FileNotFoundException;
import org.junit.Before;
import org.junit.Test;

public class BadgerTest {
	Badger badger;
	World world;
	World world2;

	@Before
	public void setup() throws FileNotFoundException {
		this.badger = new Badger(null, 0, 0, 0);
		this.world = new World("grid1.txt");
		world2 = new World("grid1.txt");
	}

	@Test
	public void testWho() {
		assertEquals(State.BADGER, this.badger.who());

	}

	@Test
	public void testNext() {
		PredatorPrey.updateWorld(world, world2);
		assertEquals(State.EMPTY,world.grid[0][5].next(world2).who());
	}

}
