package R10;
import java.util.*;
import java.util.Scanner;

public class ArrayListPractice {

	public static void main(String[] args) {
		Scanner stdin = new Scanner (System.in);
		ArrayList<Integer> data = new ArrayList<Integer>();
		System.out.println ("Enter any list of integer, But end the list by typing non- integer");
		
		while (stdin.hasNextInt()) {
			int num = stdin.nextInt();
			data.add(num);
			}
		printList(data);
		int sum = sumList (data);
		int average=sum/data.size();
		System.out.println (average);
		
		
	}
	public static void printList(ArrayList<Integer> list) {
		for(int i = 0; i< list.size(); i++) {
			System.out.println(list.get(i));
		}
			
}
	public static int sumList(ArrayList<Integer> list) {
		int sum = 0;
		for  ( int j = 0 ; j < list.size();j++) {
			sum = sum +list.get(j);
		}
		return sum;
	}
}
