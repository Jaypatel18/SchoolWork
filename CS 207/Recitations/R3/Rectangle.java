package R3;
import java.util.Scanner;
public class Rectangle {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		double width;
		double length;
		double height;
		double area;
		double perimeter;
		System.out.println("Enter width and length");
		width = stdin.nextDouble();
		length = stdin.nextDouble();
	    area = width*length;
		perimeter = 2*(width + length);
		System.out.println("Therefore the perimeter is: "+ perimeter);
		System.out.println("The area is: "+ area);
		
		
		
		
				
				
		
		
		
		

	}

}
