package R6;

import java.util.Scanner;

public class NumberOfChars {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		System.out
				.println("Please enter the list of words but the last word should be quit");
		String currentWord = stdin.next();
		double n = 0;
		double i = 0;

		while (!(currentWord.equals("quit"))) {
			n = n + currentWord.length();
			currentWord = stdin.next();
			i++;

		}
		double average = n / i;
		System.out.println(n);
		System.out.println(average);
	}
}