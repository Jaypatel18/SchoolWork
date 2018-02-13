package edu.iastate.cs228.hw1;

import static org.junit.Assert.*;

import java.io.FileNotFoundException;

import org.junit.Before;
import org.junit.Test;

public class EmptyTest {
	Empty empty;
	World world;
	World world2;
	
	@Before
	public void setup() throws FileNotFoundException{
		empty = new Empty (world, 0 , 0);
		this.world = new World("grid1.txt");
		world2 = new World ("grid1.txt");
	}

	@Test
	public void testWho() {
		assertEquals(State.EMPTY,this.empty.who());
	}
	
	@Test
	public void testNext() {
		PredatorPrey.updateWorld(world, world2);
		assertEquals(world.grid[0][1].next(world2).who(), State.RABBIT);
	}

}
