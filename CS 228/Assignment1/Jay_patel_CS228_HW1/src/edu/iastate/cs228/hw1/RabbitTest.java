package edu.iastate.cs228.hw1;

import static org.junit.Assert.*;

import java.io.FileNotFoundException;

import org.junit.Before;
import org.junit.Test;

public class RabbitTest {

	Rabbit rabbit;
	World world;
	World world2;
	
	@Before
	public void setup() throws FileNotFoundException{
		this.rabbit = new Rabbit(null,0,0,0);
		this.world = new World("grid1.txt");
		world2 = new World ("grid1.txt");
	}

	@Test
	public void testWho() {
		assertEquals(State.RABBIT,this.rabbit.who());
	}

	@Test
	public void testNext() {
		PredatorPrey.updateWorld(world, world2);
		assertEquals(world.grid[1][1].next(world2).who(), State.EMPTY);
	}

}
