import java.util.Scanner;

public class gpa {

	public static void main(String[] args) {
		int numOfCorsesTaken;
		int counter = 1;
		double credit = 0;
		double sumPoints = 0; // sum of points * credits
		String grade;
		double credits, points, gpa;

		// for getting input from the keyboard
		Scanner s = new Scanner(System.in);
		System.out.print("How many courses? ");
		numOfCorsesTaken = s.nextInt();
		System.out.println("Enter letter grades");
		System.out.println("Enter the credit of the class");
		// repeat numCourses times
		while (counter <= numOfCorsesTaken) {
			System.out.print(counter + ") ");
			grade = s.next(); // String, stopping at whitespace
			credits = s.nextDouble();
			credit += credits;
			points = convert(grade);
			System.out.println(points);
			sumPoints = points * credits + sumPoints;
			counter +=  1;
		}
		s.close();
		gpa = sumPoints / credit;
		System.out.printf("GPA is %.2f\n", gpa);

	}

	public static double convert(String grade) {
		double points = 0;
		char letter = grade.toUpperCase().charAt(0);
		if (letter == 'A')
			points = 4;
		else if (letter == 'B')
			points = 3;
		else if (letter == 'C')
			points = 2;
		else if (letter == 'D')
			points = 1;
		if (grade.length() > 1) {
			if (grade.charAt(1) == '+' && 'B' <= letter && letter <= 'D')
				points = points + .3;
			else if (grade.charAt(1) == '-' && points >= 2)
				points -= .3;
		}
		return points;
	}

}
