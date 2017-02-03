package mini2;

import java.util.Random;

/**
 * Some wacky practice problems using loops. Note this is a "utility" class
 * containing only static methods.
 */
public class LoopyStuff {
	/**
	 * Returns the index for the nth occurrence of the given character in the
	 * given string, or -1 if the character does not occur n or more times. This
	 * method is case sensitive. Examples:
	 * <ul>
	 * <li>findNth("mississippi", 's', 1) returns 2
	 * <li>findNth("mississippi", 's', 4) returns 6
	 * <li>findNth("mississippi", 's', 5) returns -1
	 * <li>findNth("mississippi", 'w', 1) returns -1
	 * </ul>
	 * 
	 * @param s
	 *            given string
	 * @param ch
	 *            given character to find
	 * @param n
	 *            occurrence to find
	 * @return index of nth occurrence, or -1 if the character does not occur n
	 *         or more times
	 */
	public static int findNth(String s, char ch, int n) // DONE
	{
		// last number is the occurrence
		// and then if the string
		// has that occurrence then return the index or else return -1

		if (n <= 0) {
			return -1;
		}
		int position = 0;
		for (int i = 0; i < s.length(); i += 1) {
			if (s.charAt(i) == ch) {
				position += 1;
				if (position == n) {
					return i;
				}
			}
		}
		return -1;
	}

	/**
	 * Determines whether the given string is a palindrome, that is, is the same
	 * forward and backward. This method is case sensitive. For example
	 * <ul>
	 * <li>"abcba" is a palindrome
	 * <li>"abccba" is a palindrome
	 * <li>any one-character string is a palindrome
	 * <li>the empty string is a palindrome
	 * <li>"abcab" is not a palindrome
	 * </ul>
	 * 
	 * @param s
	 *            the given string
	 * @return true if the given string is a palindrome, false otherwise
	 */
	public static boolean isPalindrome(String s) // DONE
	{
		// race car is Palindrome because if you flip them around
		// you are going to get the same spelling

		if (s.length() <= 1) {
			return true;
		}
		char[] temporary = s.toCharArray();
		for (int i = 0; i < temporary.length / 2; i++) {
			if (temporary[i] != temporary[temporary.length - i - 1]) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Determines the number of random integers that must be generated using a
	 * given <code>Random</code>in order to get two consecutive values that are
	 * the same. The integers are generated in the range 0 through
	 * <code>max</code> - 1, and they MUST be generated using the method
	 * <code>nextInt(int n)</code> on the given instance of <code>Random</code>.
	 * For example, if <code>max</code> is 10 and the first five values
	 * generated from nextInt(10) are 3, 8, 4, 2, 2, then the method stops and
	 * returns 5.
	 * 
	 * @param rand
	 *            a given instance of <code>java.util.Random</code>
	 * @param max
	 *            upper bound on numbers to be generated
	 * @return number of calls to <code>nextInt(int n)</code> that were made in
	 *         order to obtain two consecutive equal values
	 */
	public static int randomExperiment(Random rand, int max) {
		int current = rand.nextInt(max);
		int counter = 1;
		int temp = 0;

		while (current != (temp = rand.nextInt(max))) {
			counter += 1;
			current = temp;
		}
		return counter + 1;
	}

	/**
	 * Returns the second largest number in a string of integers. For example,
	 * given the string "42 137 -7 42 66 55" the method returns 66. Note that
	 * the second largest value may be the same as the largest, e.g., for the
	 * string "5 5 5 3" the method returns 5. If the given string is invalid or
	 * contains fewer than two numbers, the behavior of this method is
	 * undefined.
	 * 
	 * @param nums
	 *            string of integers
	 * @return second largest number in the given string
	 */
	public static int findSecondLargest(String nums) {
		String[] arr = nums.split(" ");
		if (arr.length < 1) {
			return Integer.MIN_VALUE;
		}
		int first = Integer.MIN_VALUE;
		int second = first;
		for (int i = 0; i < arr.length; i++) {
			int tempo = Integer.parseInt(arr[i]);
			if (tempo > first) {
				if (first == Integer.MIN_VALUE) {
					first = tempo;
				} else {
					second = first;
					first = tempo;
				}
			} else {
				if (tempo > second) {
					second = tempo;
				}
			}
		}
		return second;
	}

	/**
	 * Determines whether s and t differ by having exactly one pair of distinct
	 * adjacent characters reversed. This method is case sensitive. For example,
	 * <ul>
	 * <li>differByOneSwap("banana", "banaan") is true
	 * <li>differByOneSwap("banana", "banana") is false
	 * <li>differByOneSwap("banana", "bbaaan") is false
	 * <li>differByOneSwap("aa", "aa") is false
	 * </ul>
	 * 
	 * @param s
	 *            given string
	 * @param t
	 *            given string
	 * @return true if s and t are the same except for one reversed pair of
	 *         adjacent characters
	 */
	public static boolean differByOneSwap(String s, String t) {
		if (s.length() != t.length()) {
			return false;
		}
		boolean flag = true;
		boolean temp = true;
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) != t.charAt(i)) {
				temp = false;
				if (flag == true) {
					if (i + 1 == s.length()) {
						return false;
					} else {
						if (s.charAt(i + 1) != t.charAt(i)
								|| s.charAt(i) != t.charAt(i + 1)) {
							return false;
						} else {
							i++;
						}
					}
				} else {
					return false;
				}
				flag = false;
			}
		}
		if (temp == true) {
			return false;
		}
		return true;
	}

	/**
	 * Determines whether the all characters of the string <code>target</code>
	 * can be found as a subsequence of the string <code>source</code>. That is,
	 * the characters in <code>target</code> occur in <code>source</code> in the
	 * same order but do not have to be adjacent. This method is case sensitive.
	 * For example,
	 * <ul>
	 * <li>containsSubsequence("mug", "hamburgers") returns true
	 * <li>containsSubsequence("burrs", "hamburgers") returns true
	 * <li>containsSubsequence("hamburgers", "hamburgers") returns true
	 * <li>containsSubsequence("gum", "hamburgers") returns false
	 * <li>containsSubsequence("hamm", "hamburgers") returns false
	 * <li>containsSubsequence("", "hamburgers") returns true
	 * <ul>
	 * 
	 * @param target
	 *            the subsequence to be found
	 * @param source
	 *            the given string in which to find the subsequence
	 * @return true if the target is a subsequence of the source, false
	 *         otherwise
	 */
	public static boolean containsSubsequence(String target, String source) {
		if (target.length() == 0) {
			return true;
		}
		for (int i = 0 ; i < source.length(); i ++) {
			int position = 0;
			for (int j = i ; j< source.length () ; j++){
				if ( source.charAt(j) == target.charAt(position)) {
					position ++;
				}
				if ( position == target.length()){
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Prints a pattern of 2n rows containing dashes and stars, as illustrated
	 * below for n = 5. Note that the first row starts with exactly n - 1 spaces
	 * and the middle rows have no spaces.
	 * 
	 * <pre>
	 * 
	 *     **
	 *    *--*
	 *   *----*
	 *  *------*
	 * *--------*
	 * *--------*
	 *  *------*
	 *   *----*
	 *    *--*
	 *     **
	 * </pre>
	 * 
	 * @param n
	 *            one-half the number of rows in the output
	 */
	public static void printStars(int n) {
		if ( n <= 0) {
			return;
		}
		for (int i = 0; i < n ;i++){
			for (int j = 0; j < n - 1 -i;j++){
				System.out.print(' ');
			}
			System.out.print('*');
			for (int j = 0; j <2*i; j++){
				System.out.print('-');
			}
			System.out.println('*');
		}
		for (int i = n-1 ; i >= 0; i--){
			for (int j = 0 ; j < n-1-i ;j++){
				System.out.print(' ');
			}
			System.out.print('*');
			for ( int j = 0 ; j < 2*i ; j++){
				System.out.print('-');
			}
			System.out.println('*');
		}
	}

}