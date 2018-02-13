package R6;
import java.util.Scanner;
public class Disemvoweling {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		String word = stdin.next();
		String A= "";
		for (int i = 0;i<word.length(); i++){
			char c=word.charAt(i);
			if (!(c =='a' || c =='e' || c =='i' || c == 'o' || c == 'u'))
			{
				A =A+c;
			}
			
		}
		System.out.println(A);

	}
}