package HW3;

import java.util.ArrayList;

/**
 * @author Jay Patel
 * @param <E>
 */
public class InsertionSort<E extends Comparable<? super E>> implements SortAnalysis<E> {
	
	public long analyzeSort(ArrayList<E> list) 
	{
		E curr;
		long st = System.currentTimeMillis();
		int k = 0;
		int a = list.size();
		
				
		for (int i = k; i < a; i++) 
		{
			curr = list.get(i);
			
			int j = 0;
			for (j = i - 1; j >= 0; j--) 
			{
				if (curr.compareTo(list.get(j)) > 0) 
				{
					list.remove(i);
					list.add(j + 1, curr);
				}

				else if (j == 0) 
				{
					list.remove(i);
					list.add(0, curr);
				}
			}
		}
		return System.currentTimeMillis() - st;
	}

}
