package edu.iastate.cs228.hw2;

/**
 * A class used to generate order statistics of datasets
 * 
 * @author Jay
 */
public class OrderStatistics {

	/**
	 * Returns the minimum element (first order statistic) in array arr. This
	 * method must run in worst-case O(n) time, where n = arr.length, using a
	 * linear scan of the input array.
	 * 
	 * @param arr
	 *            - The data to search
	 * @return - the minimum element of arr
	 */
	public static int findMinimum(int[] arr) {
		return select(arr,0,arr.length - 1,1);
	}

	/**
	 * Returns the maximum element (first order statistic) in array arr. This
	 * method must run in worst-case O(n) time, where n = arr.length, using a
	 * linear scan of the input array.
	 * 
	 * @param arr
	 *            - The data to search
	 * @return - the maximum element of arr
	 */
	public static int findMaximum(int[] arr) {
		return select(arr,0,arr.length - 1,arr.length);
	}

	/**
	 * An implementation of the SELECT algorithm of Figure 1 of the project
	 * specification. Returns the ith order statistic in the subarray
	 * arr[first], ..., arr[last]. The method must run in O(n) expected time,
	 * where n = (last - first + 1).
	 * 
	 * @param arr
	 *            - The data to search in
	 * @param first
	 *            - The leftmost boundary of the subarray (inclusive)
	 * @param last
	 *            - The rightmost boundary of the subarray (inclusive)
	 * @param i
	 *            - The requested order statistic to find
	 * @return - The ith order statistic in the subarray
	 * 
	 * @throws IllegalArgumentException
	 *             - If i < 1 or i > n
	 */
	public static int select(int[] arr, int first, int last, int i)
			throws IllegalArgumentException {
		if (i < 1 || i > (last - first + 1)) {
			throw new IllegalArgumentException("Out of bounds");

		}

		int p;
		int k;
		if (first == last) {
			return arr[first];
		}
		p = partition(arr, first, last);
		k = p - first + 1;

		if (k == i) {
			return arr[p];
		}

		else if (i < k) {
			return select(arr, first, p - 1, i);
		}

		else {
			return select(arr, p + 1, last, i - k);
		}

	}
	
	/**
	 * Created helper method becauase it will help me for the partition
	 * and I can put the pivot on the number and figure out
	 * 
	 * @param arr - data will search through
	 * @param first - left boundry
	 * @param last - right boundry
	 * @return the ith element
	 */

	private static int partition(int[] arr, int first, int last) {
		int temp;
		int p;
		int i;
		int j;

		p = arr[last];
		i = first - 1;

		for (j = first; j <= last - 1; j++) {
			if (arr[j] <= p) {
				i++;

				temp = arr[j];
				arr[j] = arr[i];
				arr[i] = temp;
			}
		}

		if (i + 1 > arr.length - 1) {

		} else {
			temp = arr[i + 1];
			arr[i + 1] = arr[last];
			arr[last] = temp;
		}

		return i + 1;

	}

	/**
	 * Returns the ith order statistic of array arr in O(n) expected time, where
	 * n = arr.length.
	 * 
	 * @param arr
	 *            - The data to search through
	 * @param i
	 *            - The requested order statistic to find in arr
	 * @return - The ith order statistic in arr
	 * 
	 * @throws IllegalArgumentException
	 *             - If i < 1 or i > n
	 */
	public static int findOrderStatistic(int[] arr, int i) throws IllegalArgumentException{
		if(i < 1 || i > arr.length){
			throw new IllegalArgumentException("out of bounds");
		}
		return select(arr,0,arr.length-1,i);
	}

	/**
	 * Returns the median (n/2th order statistic rounding up) in array arr in
	 * O(n) expected time, where n = arr.length.
	 * 
	 * @param arr
	 *            - The array to find the median of
	 * @return - The median value of arr
	 */
	public static int findMedian(int[] arr) {
		return select(arr,0,arr.length-1,(arr.length + 1)/2);
	}
}
