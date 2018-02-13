package edu.iastate.cs417.lab2.part2;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import edu.iastate.cs417.lab2.demo.Counter;
import edu.iastate.cs417.lab2.util.FileUtil;

/**
 * The parameterized test mechanism for Part II goes in this class.
 * 
 * Do not try to get the name of the test set file from the keyboard. Remember,
 * this is an automated test suite; it needs to run without user intervention.
 * Thus, the file name needs to always be known to the test.
 * 
 * @author Jay Patel
 *
 */
@RunWith(Parameterized.class)
public class PartIITests {

	private static final String filename = "testdata.txt";

	private static int testId;
	private String input;
	private String expectedResult;
	private Counter counter;

	@Before
	public void initialize() {
		counter = new Counter();
	}

	// Each parameter should be placed as an argument here
	// Every time runner triggers, it will pass the arguments
	// from parameters we defined in testData() method

	public PartIITests(String input, String expectedResult) {
		this.input = input;
		this.expectedResult = expectedResult;
	}

	@SuppressWarnings("rawtypes")
	@Parameterized.Parameters
	public static Collection getTestSet() {
		Object[][] testArray = FileUtil.getParametersFromFile(filename, 2);
		return Arrays.asList(testArray);
	}
	
	/**
	 * For converting int to string 
	 * @param expectedResult2
	 * @return
	 */
	public static boolean isInteger(String expectedResult2) {
		try {
			Integer.parseInt(expectedResult2);
		} catch (NumberFormatException e) {
			return false;
		} catch (NullPointerException e) {
			return false;
		}
		return true;
	}

	@Test
	public void testCounter() {

		int result = counter.countOs(input);
		System.out.println(input);
		System.out.format("test %02d %-14s %2d%n", testId++, input, result);
		int e = 0;
		if (isInteger(expectedResult)) {
			e = Integer.parseInt(expectedResult);
			assertEquals(Integer.valueOf(e), counter.countOs(input));
		} else 
		{
			try {
				if (input.equals("null")) 
				{
					counter.countOs(null);
				}
				else
				{
					counter.countOs(input);
				}

			} catch (Exception a) {
				if (expectedResult.equals("IllegalArgumentException")) 
				{
					assertEquals((IllegalArgumentException.class), a.getClass());
				} else if (expectedResult.equals("NullPointerException.classs")) 
				{
					assertEquals((NullPointerException.class), a.getClass());
				}
			}

		}
	}

}