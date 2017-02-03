package pa2;

import java.util.Scanner;

/**
 * 
 * 
 * @author Jay
 *
 */

public class GravitationalForce {

	public static void main(String[] args) {

		final double G = ((6.673) * Math.pow(10, -11));

		Scanner in = new Scanner(System.in);

		System.out.println("Please enter the name of the planet and its "
				+ "weight in quintillion kilograms");

		String name = in.next();
		double weight = in.nextInt();

		System.out.println("Enter the weight of the person in kilo grams");
		double kg = in.nextInt();

		System.out.println("Please enter the radius of the planet Alderaan in "
				+ "million meters");
		double radius = in.nextDouble();
		double F = G
				* ((weight * kg * Math.pow(10, 18)) / Math.pow(
						radius * Math.pow(10, 6), 2));
		double g = G
				* ((weight * Math.pow(10, 18)) / Math.pow(
						radius * Math.pow(10, 6), 2));

		System.out
				.println("The gravitational force of planet Alderaan on the person is "
						+ F + " Newtons");
		System.out.println("The gravity of planet Alderaan is " + g
				+ " meters per second squared");

	}

}
