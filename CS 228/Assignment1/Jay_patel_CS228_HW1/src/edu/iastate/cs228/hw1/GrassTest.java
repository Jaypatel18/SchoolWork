package edu.iastate.cs228.hw1; //work

import static org.junit.Assert.*;

import java.io.FileNotFoundException;

import org.junit.Before;
import org.junit.Test;

public class GrassTest {
	Grass grass;
	World world;
	World world2;
	
	
	@Before
	public void setup() throws FileNotFoundException{
		this.grass = new Grass(null,0,0);
		this.world = new World("grid1.txt");
		world2 = new World ("grid1.txt");
	}

	@Test
	public void testWho() {
		assertEquals(State.GRASS,this.grass.who());
	}

	@Test
	public void testNext() {
		PredatorPrey.updateWorld(world, world2);
		assertEquals(world.grid[0][3].next(world2).who(), State.BADGER);
	}
}
