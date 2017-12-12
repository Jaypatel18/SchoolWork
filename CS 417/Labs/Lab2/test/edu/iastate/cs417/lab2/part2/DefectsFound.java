package edu.iastate.cs417.lab2.part2;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import edu.iastate.cs417.lab2.demo.Counter;

/**
 * 
 * @author Jay Patel
 *
 */
public class DefectsFound {
	
	private Counter c;
	
	
	@Before
	public void i()
	{
		c = new Counter();
	}
	
	/**
	 * Long string small Os
	 */
	
	@Test
	public void Test1()
	{
		int r = c.countOs("This is a very long string with a lots of alphabets man. Hello");
		assertEquals(3,r);
	}
	
	/**
	 * Tab that doesn't throw exception
	 * output: IllegalArgumentExcpetion
	 */
	@Test (expected = IllegalArgumentException.class)
	public void Test2()
	{
		c.countOs("\tab\tab\tab\tab\tab\tab\tab");
		
	}

}
