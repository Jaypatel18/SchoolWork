package edu.iastate.cs228.hw1; //work

import static org.junit.Assert.*;

import org.junit.Test;

public class LivingTest {
	World world;
	int row;
	int column;

	public LivingTest() {
		try {
			this.world = new World("grid1.txt");
			this.row = 2;
			this.column = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testCensus() {
		// assertArrayEquals(message, expected, actuals);
		Living living = world.grid[row][column];
		int[] population = new int[5];
		int[] expected = { 2, 2, 1, 1, 3 };
		living.census(population);
		assertArrayEquals("Censuses: Counting all life forms succeeded!",
				expected, population);
	}

}
