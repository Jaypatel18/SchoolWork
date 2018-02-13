package R10;
import java.util.*;
import java.util.Scanner;
public class BasicOfArrayList {

	public static void main(String[] args) {
	Scanner stdin=new Scanner (System.in);
	ArrayList<Integer> scores = new ArrayList<Integer>();
	System.out.println (scores.size());
	scores.add(56);
	System.out.println (scores.size());
	scores.add(-67);
	System.out.println (scores.size());
	scores.get(0);
	System.out.println (scores.get(1));
	scores.add(-78);
	ArrayList<Double> data = new ArrayList<Double>();
	for(int i = 1; i<= 5; i++) {
		System.out.println("Please enter " + i +"th number");
		double num = stdin.nextDouble();
		data.add(num);
	}
	for (int j = 0;j <5; j++) {
		System.out.println(data.get(j));} 
	data.set(2,99.0);
	System.out.println (data.get(2));
	
	}

	}


