package edu.iastate.cs228.hw4;
	
	import java.io.File;
	import java.io.FileNotFoundException;
	import java.util.InputMismatchException;

	public class Test {

	public static void main(String[] args) 
	throws InputMismatchException,
	FileNotFoundException
	{
			ConvexHull ch = new ConvexHull("test.txt");
			System.out.println("||||||||||||||||");
			ch.lowestPoint();
			System.out.println("||||||||||||||||");
			System.out.println(ch.toString());
			System.out.println("||||||||||||||||");
			
			
			Point r = new Point(2,4);
			
			Point p1 = new Point(3,3);
			Point p2 = new Point(3,3);
			Point p3 = new Point(3,3);
			
			Point p4 = new Point(2,2);
			Point p5 = new Point(4,1);
			Point p6 = new Point(1,4);
			
			PointComparator pc = new PointComparator(r);
			int result = pc.comparePolarAngle(p1, p2);
			System.out.println(result);
			System.out.println("||||||||||||||||");
			
			
			result = pc.compareDistance(p1, p2);
			System.out.println(result);
			System.out.println("||||||||||||||||");
			
			result = pc.compare(p1, p2);
			System.out.println(result);
			System.out.println("||||||||||||||||");
			
			ch.setUpScan();
			System.out.println("||||||||||||||||");
			
			
			ch.GrahamScan();
	}
}
