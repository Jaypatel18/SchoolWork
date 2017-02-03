import java.util. Scanner;
public class retirementplaneer1 {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		System.out.println("Please enter your present age?");
		int present_age= stdin.nextInt();
		System.out.println("Please enter your age of retirement?");
		int retirement_age= stdin.nextInt();	
		System.out.println("Number of years in retirement?");
		int Years_retirement= stdin.nextInt();
		System.out.println("Please enter desired monthly income after retirement?");
		double desired_income= stdin.nextInt();
		System.out.println("Yeild rate of the fund?");
		double yeild_rate= stdin.nextInt();
		double math = desired_income*12*Years_retirement;
		double math2= (retirement_age-present_age)*12;
		double math3= (yeild_rate/12)/100;
		double formula= ((math*math3)/((math3 + 1)*((Math.pow(math3 + 1, math2)-1))));
	
		System.out.println("Your monthly investment is$"+ formula);
		System.out.println("You will be paying a total amount of $"+(formula*12*(retirement_age-present_age) + " over 25 years"));
		System.out.println(("The profit made by the fund is $"+ ((((desired_income*Years_retirement)*12))-(formula*12*(retirement_age-present_age)))));
		
	}
	
}
