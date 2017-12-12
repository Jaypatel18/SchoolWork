import static org.junit.Assert.*;
import org.junit.Test;
import Lab1.CodeWithErrors;

public class codewitherrors_test 
{
	CodeWithErrors ce = new CodeWithErrors();

	/**
	 * Test that passes the first requirement one passes whenever the fault is not
	 * reached.
	 */
	@Test
	public void test1() 
	{
		
		int[] input = { 10, 0, 0, 0, 0 };
		assertEquals("Should be a A", 0, ce.num10(input));

	}

	/**
	 * Test that passes the second requirement one passes only if the fault is
	 * reached, but does not infect.
	 */
	@Test
	public void test2() 
	{

		int[] input = { 1, 0, 0 };
		assertEquals("Should be a B", 0, ce.num10(input));
	}

	/**
	 * Test that passes the third requirement one passes only if the fault is
	 * reached, infects, but does not propagate.
	 * 
	 * knows the output but doesn't give the output as its suppose to be
	 */
	@Test
	public void test3() 
	{
		int[] input = { 10, 0, 0 };
		assertEquals("Should be a B", 0, ce.num10(input));
	}

	/**
	 * Test that passes the fourth requirement one passes only if the fault is
	 * reached, infects, and propagates – i.e., you detect a failure in the output.
	 */
	@Test
	public void test4() 
	{

		int[] input = { 10, 0, 0 };
		assertEquals("Should be a C", 1, ce.num10(input));
		// if don't want it to be observed
		// assertEquals("Should be a C", 0, ce.num10(input));
	}

	/**
	 * Test that passes the fifth requirement one passes only if the fault is not
	 * reached and the result is correct. no other failure
	 */
	@Test
	public void test5() 
	{
		int[] input = { 10, 0, 0 };
		assertEquals("Should be a C", 0, ce.num10(input));
	}

}
