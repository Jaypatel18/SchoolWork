package pa4;

import java.util.Scanner;

public class ForLoop {

	public static void main(String[] args) {

		System.out.println("This is part1");

		for (int i = 87; i >= 45; i--) {
			if (i % 2 != 0) {
				System.out.print(i + " ");
			}

		}

		System.out.println();
		System.out.println();
		System.out.println("This is part2");
		int sum = 0;
		for (int j = 4; j <= 15; j++) {
			sum = sum + (j * j);

		}
		System.out.println(sum);

		System.out.println();
		System.out.println("This is part3");

		Scanner sc = new Scanner(System.in);
		System.out
		.println("Please enter the number of rows and column with a blank in between");
		int row = sc.nextInt();
		int column = sc.nextInt();

		for (int k = 1; k < column; k++) {
			// System.out.println();
			// I am not sure how many spaces we need so I have two options:-
			// for space in between the astricks please write system.out.println
			// which is commented out.

			if (k == 1 || k == column - 1) {
				for (int l = 1; l <= row + 1; l++) {
					System.out.print("*");

				}

			}

			else {

				for (int m = 1; m <= row + 1; m++) {
					if (m == 1 || m == row + 1) {
						System.out.print("*");
					}

					else {
						System.out.print(" ");
					}

				}
			}

			System.out.println();

		}
		sc.close();

	}

}
