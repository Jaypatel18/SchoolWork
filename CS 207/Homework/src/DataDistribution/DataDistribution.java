package pa4;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.Scanner;



public class DataDistribution {

	private static int i;
	public static void main(String[] args)  throws FileNotFoundException{
		System.out.println("Enter the files name");
		Scanner stdin= new Scanner (System.in);
		String filename = stdin.next();
		ArrayList <Integer> data = readfromfile (filename);
		int[] frequence= firstdigitfrequence(data);
		double[] percentage= firstdigitpercentage (data);
		System.out.println("First Digit   frequency   percentage");
		for (int i=0; i < frequence.length; i++) {
			System.out.println ((i+1) +    frequence[i] +   percentage[i]); 
		}
		if (isUniform(percentage)) {
			System.out.println ("The data obeys uniform law");
		}else if (isBenford(percentage)) {
			System.out.println ("The data obeys benford law");
		}else{
			System.out.println ("The data does not obey any law");
		}
	}

	public static int firstDigit (int a) {
	    while (a > 10 ) {
	        a = a / 10;
	    }
	    return a;
	
	}
		  
	public static int[] firstdigitfrequence (ArrayList<Integer>list) {
		int [] name= new int[9];
		int a = list.get(i);
		int firstdigit = firstDigit(a);
		i = name[firstdigit-1]++;
		
		return name;	
		
		
	}
	public static double[] firstdigitpercentage(ArrayList <Integer> list){
		double[] ratio = new double [9];
		int[]  frequences=firstdigitfrequence(list);
		double add = 0.0;
		for (int i =0; i<list.size();i ++) {
			add++; }
		for (int i=0; i<=0; i++) {
			ratio[i] = (frequences[i]/add*100);
		}
		return ratio;
	}
	public static ArrayList<Integer> readfromfile (String Filename) throws FileNotFoundException
	{
		File f = new File (Filename);
		Scanner fileIn = new Scanner (f);
		ArrayList<Integer> list = new ArrayList<Integer>();
		while (fileIn.hasNextInt()) {
			list.add(fileIn.nextInt());
	}	
		return list;
	}

	public static double[] createUniformArray () {
		double [] uniform = {11.11, 11.11, 11.11, 11.11, 11.11, 11.11, 11.11, 11.11, 11.11};
		
	
	return uniform;
	}

	public static double[] createBenFordArray() {
		double[] Benford = {30.1, 17.6, 12.5, 9.7, 7.9, 6.7, 5.8, 5.1, 4.6};
		
		return Benford;
		
	}
public static boolean close(double[] a, double[] b)
	{
		if(a.length!=b.length)
		{
			return false;
		}
		else
		{
			int flag = 0;
			for(int i=1;i<a.length;i++)
			{
				 if(a[i]-b[i]<=2.0||b[i]-a[i]<=2.0)
				 {
					 
				 }
				 else 
				 {
					 flag=1;
				 }
			}
			if(flag==0)
			{
				return true;
			}else
				return false;
		}
	}
	public static boolean isUniform(double[] d)
	{
		return close(d,createUniformArray());
	}
	public static boolean isBenford(double[] d)
	{
		return close(d,createBenFordArray());
	}

	
	}