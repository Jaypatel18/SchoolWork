package R4;
import java.util.Scanner;
public class Temperature {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		System.out.println ("What is the temperature ?");
		if (stdin.hasNextDouble()) {
			double temperature = stdin.nextDouble();
			if (temperature >=80) {
				System.out.println("Its hot");
			} if (temperature <80 && >=65 ) {
				System.out.println("Its Pleasant");
			} if (temperature )
				
			}
		}
		

	}

}
