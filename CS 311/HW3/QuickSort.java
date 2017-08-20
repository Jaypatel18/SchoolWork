package HW3;

import java.util.ArrayList;

import HW3.SortAnalysis;

/**
 * 
 * @author Jay Patel
 *
 *Implemted QuickSort, this class is being used in my 3Main and 3F
 * @param <E>
 */
public class QuickSort<E extends Comparable<? super E>> implements SortAnalysis<E> {
	
	/**
	 * 
	 * Calling the recursion and implemented the quick sort
	 */
	@Override
	public long analyzeSort(ArrayList<E> list) {

		long st = System.currentTimeMillis();
		QuickSort2(list, 0, list.size() - 1);
		return System.currentTimeMillis() - st;

	}
	/**
	 * 
	 * Quick sort recursion
	 * @param lst
	 * @param begin
	 * @param end
	 */
	private void QuickSort2(ArrayList<E> lst, int begin, int end) {
		if (begin < end) 
		{
			int a = breaking(lst, begin, end);
			QuickSort2(lst, begin, a - 1);
			QuickSort2(lst, a + 1, end);
		}

		return;
	}
	
	/**
	 * 
	 * breaking method being called quicksort recurssion
	 * @param lst
	 * @param begin
	 * @param end
	 * @return
	 */
	public int breaking(ArrayList<E> lst, int begin, int end) {
		E p = lst.get(end);
		int z = begin - 1;
		E curr;

		for (int i = begin; i < end; i++) {
			curr = lst.get(i);

			if (curr.compareTo(p) <= 0) {
				z++;
				swap(lst, i, z);
			}
		}

		swap(lst, z + 1, end);
		return z + 1;
	}
	
	/**
	 * 
	 * Swap method being called in breaking
	 * @param lst
	 * @param i
	 * @param z
	 */

	private void swap(ArrayList<E> lst, int i, int z) {
		E t = lst.get(i);
		lst.set(i, lst.get(z));
		lst.set(z, t);

	}

}
