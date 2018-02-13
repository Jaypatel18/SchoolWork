package edu.iastate.cs228.hw2;

/**
 * A class for generating and analyzing q-quantiles of datasets
 * 
 * @author Jay
 */
public class Quantiles {

	/* Variables to store the quantiles, size of the data, totals, etc */
	private int n; // The length of the original data array
	private int q; // The number of the quantiles
	private int[] quantiles; // Stores the q-1 quantiles
	private int topTotal; // It will keep track of the top
	private int bottomTotal; // It will keep track of the bottom

	/* NOTE: Do not store the original data */

	/**
	 * A constructor that creates a new Quantiles object, whose quantiles array
	 * has length q - 1, and contains the q-quantiles of the data array. The
	 * expected time complexity of this method must be O(n · q), or better,
	 * where n = data.length.
	 * 
	 * @param data
	 *            - The integers to split into q-quantiles
	 * @param q
	 *            - The number of q-quantiles to create
	 * 
	 * @throws IllegalArgumentException
	 *             - If q < 1 or if q > n
	 */
	public Quantiles(int[] data, int q) {
		this.q = q;
		n = data.length;
		if ((q < 1) || (q > n))
			throw new IllegalArgumentException("out of bounds");
		quantiles = new int[q - 1];
		computeQuantiles(data, q);
	}
	/**
	 * Created a helper method so that it will help me for compute the quantiles
	 * 
	 * 
	 * @param data
	 * @param q
	 */
	private void computeQuantiles(int[] data, int q) {
		for (int i = 1; i < q; i++) {
			int k = (int) Math.ceil((double) i * n / q);
			quantiles[i - 1] = OrderStatistics.select(data, 0, n - 1, k);
		}

		bottomTotal = 0;
		topTotal = 0;
		for (int i = 0; i < n; i++) {
			if (data[i] <= quantiles[0])
				bottomTotal += data[i];
			else if (data[i] > quantiles[q - 2])
				topTotal += data[i];
		}
	}

	/**
	 * A constructor that creates a new Quantiles object, whose quantiles array,
	 * has length three, and is initialized to contain the three quantiles of
	 * data. The expected time complexity of this method must be O(n), where n =
	 * data.length.
	 * 
	 * @param data
	 *            - The integers to split into q-quantiles
	 * @throws IllegalArgumentException
	 *             - If n < 4
	 */
	public Quantiles(int[] data) {
		int n = data.length;
		if (n < 4)
			throw new IllegalArgumentException("out of bounds");
		quantiles = new int[3];

		int call1 = (int) (Math.ceil(n / q));
		int call2 = (int) (Math.ceil(2 * n / q));
		int call3 = (int) (Math.ceil(3 * n / q));

		quantiles[0] = OrderStatistics.select(data, 0, n - 1, call1);
		quantiles[1] = OrderStatistics.select(data, 0, n - 1, call2);
		quantiles[2] = OrderStatistics.select(data, 0, n - 1, call3);

	}

	/**
	 * An optional constructor that creates a new Quantiles object, whose
	 * quantiles array has length q - 1, and is initialized to contain the
	 * q-quantiles of the data array.
	 * 
	 * If fast is true, then the expected time complexity of this method must be
	 * O(n log q), where n = data.length, where n = data.length (for this, you
	 * must implement the method such as the one outlined in Section 2.2.
	 * 
	 * If fast is false, then the expected time complexity of this method is
	 * only required to be O(n · q), but may be faster
	 * 
	 * @param data
	 *            - The integers to split into q-quantiles
	 * @param q
	 *            - The number of q-quantiles to create
	 * @param fast
	 *            - Flag to request a O(n log q) construction
	 * 
	 * @throws IllegalArgumentException
	 *             - If q < 1 or if q > n
	 */
	public Quantiles(int[] data, int q, boolean fast) {
		// In this method it is going to see whether the array is true if it is it is going to iterate through and if it is not then
		// it is going to refer to the very first constructor of the quantile
		


	}
	/**
	 * I will create a helper method so that it will help me for the recursion part
	 * so what I am doing is taking the middle of the array everytime and making the middle of that arry which 
	 * is already middle and repeating the same thing again and again till I am done finding the middle of the sub array
	 * and after I find the last middle I just return and dont do anything
	 * 
	 * @param data - it will look at array and the next it will look for the middle element and so on.
	 * @param i-  this is going to be the very first element
	 * @param j- this is going to be the very last
	 */
	
	/**
	 * Returns the k-th q-quantile of this object. This method must take O(1)
	 * time in the worst case.
	 * 
	 * @param k
	 *            - Specifies which q-quantile to return
	 * @return - The k-th q-quantile
	 * 
	 * @throws IllegalArgumentException
	 *             - If k < 1 or k is greater than the number of quantiles of
	 *             this object
	 */
	public int getQuantile(int k) {
		if ((k < 1) || (k > q - 1))
			throw new IllegalArgumentException("out of bounds");

		return quantiles[k - 1];
	}

	/**
	 * Returns the number of quantiles in this object. This method must take
	 * O(1) time in the worst case.
	 * 
	 * @return - The number of quantiles in this object
	 */
	public int getQ() {
		return q - 1;
	}

	/**
	 * Returns the index of the quantile group that contains x:
	 * 
	 * - If x is less than or equal to the first quantile, then return 1.
	 * 
	 * - If x is strictly greater than the last quantile (quantile q - 1), then
	 * return q.
	 * 
	 * - Otherwise, return the smallest index k such that x is less than or
	 * equal to the k-th q- quantile.
	 * 
	 * This method must take O(log k) time in the worst case.
	 * 
	 * @param x
	 *            - The item to find the quantile of
	 * @return - The quantile containing x as described above
	 */
	public int quantileQuery(int x) {
		if (x <= quantiles[0])
			return 1;
		else if (x > quantiles[q - 2])
			return q;
		else {
			int k = 0;
			for (int i = 0; i < q - 1; i++) {
				if (quantiles[i] >= x) {
					k = i;
					break;
				}
				k = i;
			}
			return k + 1;
		}

	}

	/**
	 * Returns the sum of all values that are strictly higher than the (q - 1)th
	 * q-quantile in the original data array. This method must take O(1) time in
	 * the worst case.
	 * 
	 * @return - sum of all values that are strictly higher than the (q - 1)th
	 *         q-quantile
	 */
	public int getTopTotal() {
		return topTotal;
	}

	/**
	 * Returns the sum of all vales that are smaller than or equal to the first
	 * quantile in the original data array. This method must take O(1) time in
	 * the worst case.
	 * 
	 * @return - the sum of all vales that are smaller than or equal to the
	 *         first quantile
	 */
	public int getBottomTotal() {
		return bottomTotal;
	}

	/**
	 * Returns the ratio of getTopTotal() to getBottomTotal() for this object.
	 * This method must take O(1) time in the worst case.
	 * 
	 * @return - the ratio
	 */
	public float ineqRatio() {
		return (float) getTopTotal() / getBottomTotal();
	}

	/**
	 * Returns the length of the original data array. This method must take O(1)
	 * time in the worst case.
	 * 
	 * @return - the size of the original data array
	 */
	public int size() {
		return n;
	}

	/**
	 * Overrides the toString() method, returning a String in the format given
	 * on page 6 of the project specifications.
	 * 
	 * @return - the String representation of this object
	 */
	@Override
	public String toString() {
		String thisStr = n + ", " + q + ", [";
		for (int i = 0; i < q - 1; i++) {
			thisStr += quantiles[i];
			if (i == q - 2)
				thisStr += "], ";
			else
				thisStr += ", ";
		}
		thisStr += topTotal + ", " + bottomTotal + "\n";
		return thisStr;
	}
}
