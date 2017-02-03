package R9;

import java.util.Scanner;

public class TestArray {

	public static void main(String[] args) {
		Scanner stdin = new Scanner(System.in);
		
		double[] scores = new double[5];
		System.out.println(scores.length);
		
		int[] data = new int[25];
		System.out.println (data.length);
		
		int[] values = {2,-3,4,6,8,-99};
		System.out.println (values.length);
		
		for (int i =0; i<scores.length ; i++) {
			System.out.println ("please enter " + i + "th array value");
			scores[i]=stdin.nextDouble();
		}
		System.out.println ();
		for (int i =0; i<scores.length;i++) {
			System.out.print (scores[i] + " ");
			System.out.println ();
		
		}
		System.out.println (sumArray(scores));
		for (int i =0; i<values.length;i++) {
			System.out.print (values[i] + " ");
		}
		
}

	public static double sumArray (double[] dArray){
	double sum = 0;
	for (int i=0; i<dArray.length;i++) {
		sum = sum + dArray[i];
	}
	return sum;
}
	public static double[] squareArray(double[] dArray) {
		double [] sArray = new double [dArray.length];
		for (int i = 0; i<dArray.length;i++) {
			sArray[i] = Math.pow(dArray[i],2);
		}
		return sArray;
	}


		
		
}

