package HW3;

import java.util.Random;

/**
 * 
 * Main for all sub parts of Part1
 * @author Jay Patel
 * 
 *
 */
public class Part1Main {
		
	/**
	 * Global variables that I will be using in the entire class in Part1
	 */
	private static MatrixOperations op;
	private static Random r = new Random();
	
	

	public static void main(String[] args) 
	{
		System.out.println("Takes approximately 55 to 70 secs until the outputs are shown below: \n");
		op = new MatrixOperations();

		int s = 1;

		double[][] t2;
		
		
		double[][] t1;
		
	
		double[][] sol;

		/**
		 * 
		 * For Testing purpose 
		 * t1 = cm(1000); t2 = cm(1000); sol = cm(1000);
		 * long time = op.analyzeMultiply(t1, t2, sol);
		 * System.out.println(time); int size = 60000;
		 * 
		 */

		long rt = 0;
		int ms = 1000;
		while (rt < ms ) 
		{
			//method that I made for creating the matrix named cm
			t1 = cm(s);
			t2 = cm(s);
			sol = new double[s][s];
			rt = op.analyzeMultiply(t1, t2, sol);
			//doubling
			s = s * 2;

		}
		
		//diving it by 2
		s = s / 2;
		//method that I made for the part B of question 1 and binary search with size
		space(binarysearch(s));

		/**
		 * 
		 * For testing purpose only 
		 * s = 1023; t1 = cm(s); t2 = cm(s); sol = new
		 * double[s][s]; rt = op.analyzeMultiply(t1, t2, sol);
		 * System.out.println("size " + s + "runTime " + rt);
		 * 
		 */
	}

	
	/**
	 * 
	 * Binary Search as mentioned in Part A of question 1
	 * @param allocatedsize
	 * @return
	 */
	private static int binarysearch(int allocatedsize) 
	{
	
		double[][] t1;
		double[][] t2;
		double[][] s1;
		double[][] s2;
		
		int ms = 0;
		int mxs = allocatedsize;
		long st = 0;
		int avg = 0;
		long smt = 0;
		int limit = 1000;
		int avg2 = 2;
		while (st < limit || smt >= limit) 
		{
			//average
			avg = (ms + mxs) / avg2;
			//helper method for creatematrix and the mid size
			t1 = cm(avg);
			//same as above
			t2 = cm(avg);
			//2-D array for solution
			s1 = new double[avg][avg];
			//calling the method from Matrix operation
			st = op.analyzeMultiply(t1, t2, s1);
			//doing the same  but with - 1 from above
			t1 = cm(avg - 1);
			
			t2 = cm(avg - 1);
			
			s2 = new double[avg - 1][avg - 1];
			//same as above but for size minus the time
			smt = op.analyzeMultiply(t1, t2, s2);
			
			//taking care of the size time in here
			if (st < limit) 
			{
				//allocating min size to average or mid size
				ms = avg;
			} 
			else 
			{
				//if not then max size gets the average or mid size
				mxs = avg;
			}
		}
		System.out.println("After binary search I get the following: \n");
		System.out.printf("S: %1d T: %1d \n", avg, st);
		
		
		//return the mid
		return avg;
	}
	
	/**
	 * For part B of question 1
	 * @param avg
	 */
	private static void space(int avg) 
	{

		int s2;
		s2 = 1;
		int k = 20;
		
		for (int i = 0; i < k; i++) 
		{
			s2 = 1 + (i * avg/20);
			System.out.printf("S: %1d T: %1d \n", s2, op.analyzeMultiply(cm(s2), cm(s2), cm(s2)));
		}
		System.out.println("Code executed and results are shown above!");
	}
	
	

	/**
	 * 
	 * Creating the  Matrix
	 * @param s
	 * @return
	 */
	
	private static double[][] cm(int s) 
	{   double[][] t = new double[s][s];
		for (int i = 0; i < s; i++) 
		{
			for (int j = 0; j < s; j++) 
			{
				t[i][j] = r.nextDouble();
			}
		}
		return t;
	}

}
