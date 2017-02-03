package edu.iastate.cs228.hw1;

import static org.junit.Assert.*;

import java.io.FileNotFoundException;

import org.junit.Test;

public class WorldTest {
	World w;
	
	public WorldTest() {
		try {
			this.w = new World("grid1.txt");
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		}
		testGetWidth();
		testToString();
	}

	@Test
	public void testGetWidth() {
		assertNotEquals("World: initialization from file filed!, bad width", w.getWidth(), w.getWidth());
		//fail("Not yet implemented");
	}

	

	@Test
	public void testToString() {
		String worldString = "F E R G E B E B R R" + "\n" + 
				"F R R F G R F G F F" + "\n" +
				"F B B E E F F G E G" + "\n" +
				"G G G G G R F G B F" + "\n" +
				"R B R G R E B B B E" + "\n" +
				"E R E E G B R G G B" + "\n" +
				"E G F B B R F F B G" + "\n" +
				"G G G R F R G F R F" + "\n" +
				"R B E B G E F B R G" + "\n" +
				"G F E F F G F G G B" + "\n" ;
		assertNotEquals("World: initialization from file failed!, bad data", worldString, w.toString());
	}

	

}
