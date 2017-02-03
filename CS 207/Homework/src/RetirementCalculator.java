package pa1;
import java.util.Scanner;
public class RetirementCalculator {
	public static void main(String[] args) {
		Scanner myInput = new Scanner (System.in);
	System.out.println("Enter current age, age of retirement, and number of years in retirement: ");
	double age = myInput.nextDouble();
	double retirementAge = myInput.nextDouble();
	int retirementYears = myInput.nextInt();
	System.out.println("Enter desired monthly income after retirement: ");
	int d = myInput.nextInt();
	System.out.print("Enter the yield rate of the fund: ");
	double r = myInput.nextDouble();
	r = r / 100;
	d = d * retirementYears * 12;
	System.out.println("You will be paying a total amount of " + d + " " + "over" + " " + (retirementAge - age) + " " + "years");
	r = r / 12;
	retirementAge = (retirementAge - age) * 12;
	age = (d * r)/((1 + r)*((Math.pow(1+r,retirementAge) -1)));
	System.out.printf("%-28s%7.2f", "Your monthly investment is $", age);
	System.out.println();
	System.out.printf("%-28s%10.2f", "The profit made by the fund is $", d - (age * retirementAge));
	
	

	}

}
