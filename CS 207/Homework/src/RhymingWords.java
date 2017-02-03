package pa3;

import java.util.Scanner;
/**
 * Code for checking if the words are rhym
 * 
 * @author Priyank
 *
 */

public class RhymingWords {

	public static void main(String[] args) {

		String str1;
		String str2;
		String str3;
		System.out.println("Enter three strings of length at least 2");
		Scanner sc = new Scanner(System.in);
		str1 = sc.next();
		str2 = sc.next();
		str3 = sc.next();

		int x = str1.length();
		int y = str2.length();
		int z = str3.length();

		String check1 = "";
		String check2 = "";

		System.out.print(str1 + " ");
		System.out.print(str2 + " ");
		System.out.println(str3);

		if (str1.charAt(x - 1) == str2.charAt(y - 1)) {
			if (str2.charAt(y - 1) == str3.charAt(z - 1))
				if (str1.charAt(x - 1) == str3.charAt(z - 1))
					check1 += "good";
				else {
					check1 += "bad";
				}
			if (str1.charAt(x - 2) == str2.charAt(y - 2)) {
				if (str2.charAt(y - 2) == str3.charAt(z - 2))
					if (str1.charAt(x - 2) == str3.charAt(z - 2))
						check2 += "good";
			} else {
				check2 += "bad";
			}

			if (str1.charAt(x - 1) == str2.charAt(y - 1)) {
				if (str1.charAt(x - 2) == str2.charAt(y - 2))
					System.out.println(str1 + " " + str2 + " " + "rhyme");

			}
			if (str2.charAt(y - 1) == str3.charAt(z - 1)) {
				if (str2.charAt(y - 2) == str3.charAt(z - 2))
					System.out.println(str2 + " " + str3 + " " + "rhyme");

			}

			if (str1.charAt(x - 1) == str3.charAt(z - 1)) {
				if (str1.charAt(x - 2) == str3.charAt(z - 2))
					System.out.println(str1 + " " + str3 + " " + "ryhme");
			} else {
				System.out.println("No rhyming words");
			}

		}

		if (check1.equals("good"))
			if (check2.equals("good"))
				System.out.println("All words rhyme");
			else {
				System.out.println("Bad rhyming");
			}
		else {
			System.out.println("No ryming words");
		}
		sc.close();

	}
	

}
