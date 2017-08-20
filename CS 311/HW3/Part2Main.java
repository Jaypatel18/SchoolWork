package HW3;

import java.util.ArrayList;

/**
 * 
 * Main for part 2 worst case
 * 
 * @author Jay Patel
 *
 */
public class Part2Main 
{
	/**
	 * 
	 * Using this static variables throughout
	 */
	private static InsertionSort<Integer> s = new InsertionSort<>();
	// Making an arrayList
	private static ArrayList<Integer> lst = new ArrayList<>();
	
	private static ArrayList <Integer> cl (int s1)
	{
		ArrayList<Integer> t = new ArrayList<>();
		
		int j = s1 - 1;
		
		for(int i = 0; i < s1; i++ )
		{
			t.add(j);
			j--;
		}
		return t;
	}

	public static void main(String[] args) 
	{

		// Similar to what I did in part 2F Main
		

		System.out.println("Takes approx 5 - 10 secs until the outputs are shown below for Part2 except F: \n");

		long t1 = 0;
		int limit = 1000;
		int s1 = 1;
		

		while (t1 < limit) 
		{
			lst.clear();
			t1 = 0;
			for (int i = s1 - 1; i >= 0; i--) 
			{
				lst.add(i);
			}
			t1 = s.analyzeSort(lst);
			s1 = s1 * 2;
		}
		s1 = s1 / 2;
		
		int a = binarysearch(s1);
		

		System.out.println("S " + s1 + " " + "T " + t1 + "\n");
		
		long[] wc = new long[50];
		int lm = wc.length;
		int interval = a/ 50;		

		/**
		 * Part C
		 */

		for (int i = 0; i < lm; i++) 
		{
			s1 = 1 + (i * interval);
			lst.clear();
			for (int j = s1 - 1; j >= 0; j--) 
			{
				lst.add(j);
				
			}
			wc[i] = s.analyzeSort(lst);
			System.out.println("S " + s1 + " " + "T " + wc[i]);
		}
		System.out.println("Code executed and results are shown above!");
	}
	
	/**
	 * using the same binary search as earlier
	 * @param allocatedsize
	 * @return
	 */
	
	private static int binarysearch(int allocatedsize) 
	{
	
		int ms = 0;
		int mxs = allocatedsize;
		long st = 0;
		int avg = 0;
		long smt = 0;
		int limit = 1000;
		int avg2 = 2;
		while (st < limit || smt >= limit) 
		{
			avg = (ms + mxs) / avg2;
			
			st = s.analyzeSort(cl(avg));
			smt = s.analyzeSort(cl(ms - 1));
			
			if(st < limit)
			{
				ms = avg + 1;
			}
			else if (smt >= limit)
			{
				mxs = avg - 1;
			}
			
			System.out.printf("M: %2d, T: %2d, SMT: %2d", avg, st, smt);
			
		}
		
		System.out.printf("\nS: %d Time: %2d\n", avg, st);
		
		//return the mid
		return avg;
	}
	 

}
