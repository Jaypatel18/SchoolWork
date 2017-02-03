package pa2;
import java .util.Scanner;
public class admisionprice {

	public static void main(String[] args) {
		Scanner stdin=new Scanner(System.in);
		System.out.println("Are you affilited with the university? Type Yes or No");
		String Iowastate;
		Iowastate=stdin.next();
		if(Iowastate.equals("yes")){
		System.out.println("Are you a student or faculty or staff? Type student, faculty or staff"); 
		String Iowa;
		Iowa=stdin.next();
		if(Iowa.equals("student")){
			System.out.println("The admission price is $3");
		}else{if(Iowa.equals("faculty") ||Iowa.equals("staff")){
			System.out.print("Your Admission price is $10");
			System.out.print("You are a faculty or staff members and you will be charge $10");
		}
		else{System.out.print("Invalid Input. You should type student, faculty or staff ");
		}
		}
		}
		else if(Iowastate.equals("no")) {
		{ System.out.println("Enter your age?");
		double age;
		age=stdin.nextDouble();
		if (age==(int)age){
		if (age > 65){
			System.out.println("Your admission price is $8");
		}
		else{if(age<0){
		 System.out.println("Invalid Input. Age can't be negative");
		}
		 else{if(age<3){	
		  System.out.print("Your admission price is free");
			
		  }
	      else{if(age<13){
	    	  System.out.print("Your admission price is $5");
	      }
	      else System.out.println("Your admission price is $15");
	      }	
		  }
		  }
		}
		else{
			System.out.println("Invalid Input. Age must be a integer");
		}
		}
		}
		else{
			System.out.println("Invalid Input. You should type yes or no");
		}
		
}

}
