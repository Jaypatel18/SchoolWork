package edu.iastate.cs417.lab2.part1;

import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

import edu.iastate.cs417.lab2.util.FileUtil;

/**
 * 
 * CFG derived (Part I) tests go in this class. The tests should be simple unit tests. 
 * One test method per test case; all in this class. 
 * 
 * @author Jay Patel
 *
 */
public class CfgTests {
	
	/**
	 * Checking for null in try and catch block
	 */
	@Test
	public void test1()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile(" ", 1);
		assertNull(thrownull);
	}
	
	
	/**
	 * Passing the null
	 */
	@Test
	public void test2()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile(null, 1);
		assertNull(thrownull);
	}
	
	
	/**
	 * Wrong file name
	 */
	@Test
	public void test3()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("asd.txt", 1);
		assertNull(thrownull);
	}
	
	
	/**
	 * Passing the right name, if its right then it isn't null
	 */
	@Test
	public void test4()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test.txt", 1);
		assertNotNull(thrownull);
	}
	
	
	/**
	 * When index is equal to zero
	 * that means that the text file is empty
	 */
	@Test
	public void test5()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test2.txt", 0);	
		int row = thrownull.length;
		assertEquals(0, row);
	}
	
	
	/**
	 * Index out of bounds
	 */
	@Test (expected = IndexOutOfBoundsException.class)
	public void test6()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test2.txt", 0);
		int col = thrownull[0].length;
		assertEquals(0, col);
	}
	
	/**
	 *  within the file
	 * length of column = 1
	 * go straight to else 
	 * would fail because in this case its 4 and not 3
	 */
	@Test
	public void test7()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test.txt", 1);
		int col = thrownull[0].length;
		assertEquals(1, col); 
	}
	/**
	 * within the file
	 * length of row = 1
	 
	
	@Test
	public void test8()
	{
	
		Object thrownull [][] = FileUtil.getParametersFromFile("test3.txt", 1);
		int row = thrownull.length;
		assertEquals(1, row); 
	}
	*/
	
	
	/**
	 *  Column equal to the actual file 
	 */
	@Test
	public void test8()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test5.txt", 6);
		Object newone [][] = {{"1","2","3","4","5","6"}};
		Assert.assertArrayEquals(thrownull, newone);
	}
	
	/**
	 * within the file
	 * length of column < 1
	 */
	
	@Test
	public void test9()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test3.txt", -1);
		assertNull(thrownull); 
	}
	
	/**
	 * within the file
	 * length of column > 1
	 * MalformedTestSet
	 */
	
	@Test
	public void test10()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test3.txt", 11);
		assertNull(thrownull);
	}
	
	/**
	 * IllegalArgument exception
	 */
	
	@Test (expected = IllegalArgumentException.class)
	public void test11()
	{
		@SuppressWarnings("unused")
		Object thrownull [][] = FileUtil.getParametersFromFile("jay.txt", 1);
	}
	
	/**
	 * NullFileInput
	 */
	@Test (expected = IllegalArgumentException.class)
	public void test12()
	{
		@SuppressWarnings("unused")
		Object thrownull [][] = FileUtil.getParametersFromFile(null, 1);
	}
	
	/**
	 * Wrong file
	 */
	@Test (expected = IllegalArgumentException.class)
	public void test13()
	{
		@SuppressWarnings("unused")
		Object thrownull [][] = FileUtil.getParametersFromFile("patel.txt", 1);
	}
	
	/**
	 * Empty file
	 */
	@Test (expected = IndexOutOfBoundsException.class)
	public void test14()
	{
		@SuppressWarnings("unused")
		Object thrownull [][] = FileUtil.getParametersFromFile("test2.txt", 1);
	}
	
	/**
	 * Correct file
	 */
	@Test
	public void test15()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test3.txt", 1);
		assertNotNull(thrownull);
	}
	
	/**
	 * Column more than actual file
	 */
	@Test
	public void test16()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test3.txt", 9);
		assertNull(thrownull);
	}
	
	/**
	 *  Column equal one when goes inside the loop
	 */
	@Test
	public void test17()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test6.txt", 1);
		Object newone [][] = {{"how"},{"are"},{"you"}};
		Assert.assertArrayEquals(thrownull, newone);
	}
	
	/**
	 * Column parameters less than the actual size
	 */
	@Test
	public void test18()
	{
		Object thrownull [][] = FileUtil.getParametersFromFile("test5.txt", 5);
		Object newone [][] = {{"1","2","3","4","5"}};
		Assert.assertArrayEquals(thrownull, newone);
		
	}
	
	
	
	

}