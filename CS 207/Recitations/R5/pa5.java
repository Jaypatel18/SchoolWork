package R5;
import java.util.Scanner;
public class pa5 {

	public static void main(String[] args) {
		Scanner stdin = new Scanner (System.in);
		System.out.println("Enter your present age");
		if (stdin.hasNextDouble()) {
			double age = stdin.nextDouble();
			if (age<0){
				System.out.println("Invalid Input"); 
			}
			else 
				if (age<13){
					System.out.println("You have to pay $5");
				}
				else if (age>=13){
					System.out.println("You have to pay $10");
			}
		}else {
			System.out.println("Invalid input");
		}
		
		

	}
}


