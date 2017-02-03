package edu.iastate.cs228.hw4;

/**
 *  
 * @author Jay
 *
 */

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.Scanner;

/**
 * 
 * This class implements Graham's scan that constructs the convex hull of a
 * finite set of points.
 *
 */

public class ConvexHull {
	// ---------------
	// Data Structures
	// ---------------

	/**
	 * The array points[] holds an input set of Points, which may be randomly
	 * generated or input from a file. Duplicates may appear.
	 */
	private Point[] points;
	private int numPoints; // size of points[]

	/**
	 * Lowest point from points[]; and in case of a tie, the leftmost one of all
	 * such points. To be set by the private method lowestPoint().
	 */
	private Point lowestPoint;

	/**
	 * This array stores the same set of points from points[] with all
	 * duplicates removed.
	 */
	private Point[] pointsNoDuplicate;
	private int numDistinctPoints; // size of pointsNoDuplicate[]

	/**
	 * Points on which Graham's scan is performed. They are copied from
	 * pointsNoDuplicate[] with some points removed. More specifically, if
	 * multiple points from the array pointsNoDuplicate[] have the same polar
	 * angle with respect to lowestPoint, only the one furthest away from
	 * lowestPoint is included.
	 */
	private Point[] pointsToScan;
	private int numPointsToScan; // size of pointsToScan[]

	/**
	 * Vertices of the convex hull in counterclockwise order are stored in the
	 * array hullVertices[], with hullVertices[0] storing lowestPoint.
	 */
	private Point[] hullVertices;
	private int numHullVertices; // number of vertices on the convex hull

	/**
	 * Stack used by Grahma's scan to store the vertices of the convex hull of
	 * the points scanned so far. At the end of the scan, it stores the hull
	 * vertices in the counterclockwise order.
	 */
	private PureStack<Point> vertexStack;

	// ------------
	// Constructors
	// ------------

	/**
	 * Generate n random points within the box range [-50, 50] x [-50, 50].
	 * Duplicates are allowed. Store the points in the private array points[].
	 * 
	 * @param n
	 *            >= 1; otherwise, exception thrown.
	 */
	public ConvexHull(int n) throws IllegalArgumentException {
		if (n < 1) { // Check if it is smaller than 1
			throw new IllegalArgumentException();
		}
		points = new Point[n]; // allowing points in the array
		Random r = new Random(); // creating a random
		for (int j = 0; j < n; j++) { // loop through and arrange the values
			Point temper = new Point(r.nextInt(101) - 50, r.nextInt(101) - 50);
			// this is the range
			points[j] = temper; // initializing to the varibale
		}
		numPoints = points.length;

	}

	/**
	 * Read integers from an input file. Every pair of integers represent the x-
	 * and y-coordinates of a point. Generate the points and store them in the
	 * private array points[]. The total number of integers in the file must be
	 * even.
	 * 
	 * You may declare a Scanner object and call its methods such as hasNext(),
	 * hasNextInt() and nextInt(). An ArrayList may be used to store the input
	 * integers as they are read in from the file.
	 * 
	 * @param inputFileName
	 * @throws FileNotFoundException
	 * @throws InputMismatchException
	 *             when the input file contains an odd number of integers
	 */

	public ConvexHull(String inputFileName) throws FileNotFoundException,
			InputMismatchException {
		Scanner sc = new Scanner(new File(inputFileName)); // Scan through a
															// file
		points = new Point[0]; // allowing points into array
		int temp = 0; // variable intizile to 0
		try {
			while (sc.hasNextInt()) { // scan through the nextInt
				points = Arrays.copyOf(points, points.length + 1);
				// in this it is just going to copyof the arrays
				points[temp] = new Point(sc.nextInt(), sc.nextInt());
				temp++;
			}
		} catch (NoSuchElementException e) { // This will check if it catches
												// the exceptions
			sc.close();
			throw new InputMismatchException();
		}
		numPoints = points.length;
		sc.close();

		 /**
		  * This is just for testing the code
		  * for (int i = 0; i < numPoints; i++) {
		 	System.out.print(points[i] + " ");
		 	}
		 	quickSort();
		  */
	}

	// -------------
	// Graham's scan
	// -------------

	/**
	 * This method carries out Graham's scan in several steps below:
	 * 
	 * 1) Call the private method lowestPoint() to find the lowest point from
	 * the input point set and store it in the variable lowestPoint.
	 * 
	 * 2) Call the private method setUpScan() to sort all points by polar angle
	 * with respect to lowestPoint. After elimination of all duplicates in
	 * points[], the points are stored in pointsNoDuplicate[]. Next, for
	 * multiple points having the same polar angle with respect to lowestPoint,
	 * keep only the one furthest from lowestPoint. The points after the second
	 * round of elimination are stored in the array pointsToScan[].
	 * 
	 * 3) Perform Graham's scan on the points in the array pointsToScan[]. To
	 * initialize the scan, push pointsToScan[0] and pointsToScan[1] onto
	 * vertexStack.
	 * 
	 * 4) As the scan terminates, vertexStack holds the vertices of the convex
	 * hull. Pop the vertices out of the stack and add them to the array
	 * hullVertices[], starting at index numHullVertices - 1, and decreasing the
	 * index toward 0. Set numHullVertices.
	 * 
	 * Two special cases below must be handled:
	 * 
	 * 1) The array pointsToScan[] could contain just one point, in which case
	 * the convex hull is the point itself.
	 * 
	 * 2) Or it could contain two points, in which case the hull is the line
	 * segment connecting them.
	 */
	public void GrahamScan() {
		lowestPoint(); // as we need to have lowest point
		setUpScan();   // as we need to call setUpScan as per the instructions
		// this is statement where I am checking if it is smaller than 3 if it is
		// then I have to just copy the Array into the new one.
		if (pointsToScan.length < 3) {
			hullVertices = Arrays.copyOf(pointsToScan, pointsToScan.length + 1);
			numHullVertices = hullVertices.length; 
			
			// in else I just copy the arrays into the corresponding array
		} else {
			vertexStack = new ArrayBasedStack<Point>();
			vertexStack.push(pointsToScan[0]);
			vertexStack.push(pointsToScan[1]);
			vertexStack.push(pointsToScan[2]);
			// Loop through it and see if it pops, peek and scan through the points of k
			// now I created the helper method where I am checking if it pushes the vertexStack
			for (int k = 3; k < numPointsToScan; k++) {
				while (CheckTurn(vertexStack.pop(), vertexStack.peek(),
						pointsToScan[k])) {
					vertexStack.pop();
				}
				// Here it will push the points into it
				vertexStack.push(pointsToScan[k]);
			}
			// In this case it will show us the size
			numHullVertices = vertexStack.size();
			hullVertices = new Point[numHullVertices];
			
			// In this case we are just decrementing and poping it
			for (int l = numHullVertices - 1; l >= 0; l--) {
				hullVertices[l] = vertexStack.pop();
			}
		}
		
		/**
		 * This is just for testing
		for(int i = 0 ; i <= hullVertices.length - 1 ; i++){
			System.out.println(hullVertices[i]);
		}
		*/
	}
	/**
	 * 
	 * This is the helper method I created for Graham scale as it makes easier to
	 * do it as in this method we just have to check the push into the parameter pop
	 * and the  use the comparator to make the new comparator and put it into the parameter peek
	 * and just return the and see if it is greater than 0
	 * @param pop
	 * @param peek
	 * @param point
	 * @return
	 */
	private boolean CheckTurn(Point pop, Point peek, Point point) {
		vertexStack.push(pop);
		PointComparator c = new PointComparator(peek);
		return c.comparePolarAngle(pop, point) > 0;
	}

	// ------------------------------------------------------------
	// toString() and Files for Convex Hull Plotting in Mathematica
	// ------------------------------------------------------------

	/**
	 * The string displays the convex hull with vertices in counter clockwise
	 * order starting at lowestPoint. When printed out, it will list five points
	 * per line with three blanks in between. Every point appears in the format
	 * "(x, y)".
	 * 
	 * For illustration, the convex hull example in the project description will
	 * have its toString() generate the output below:
	 * 
	 * (-7, -10) (0, -10) (10, 5) (0, 8) (-10, 0)
	 * 
	 * lowestPoint is listed only ONCE.
	 */
	public String toString() {
		String temper = "";
		// In this I am going to see if it smaller than numHullVertices and see if the 
		// remainder is 0 and see if it not equal to 0
		for (int j = 0; j < numHullVertices; j++) {
			if (j % 5 == 0 && j != 0) {
				// This line will help you to put into a next line
				temper = temper + "\n";
			}
			// in this line it will help you to output with the spaces.
			temper = temper + hullVertices[j].toString() + "   ";
		}
		return temper;
	}

	/**
	 * For plotting in Mathematica.
	 * 
	 * Writes to the file "hull.txt" the vertices of the constructed convex hull
	 * in counterclockwise order for rendering in Mathematica. These vertices
	 * are in the array hullVertices[], starting at lowestPoint. Every line in
	 * the file displays the x and y coordinates of only one point. Write the
	 * coordinates of lowestPoint again to end the file.
	 * 
	 * For instance, the file "hull.txt" generated for the convex hull example
	 * in the project description will have the following content:
	 * 
	 * -7 -10 0 -10 10 5 0 8 -10 0 -7 -10
	 * 
	 * Note that lowestPoint (-7, -10) has its coordinates listed in the first
	 * and last lines. This is for Mathematica to plot the hull as a polygon
	 * rather than one missing the edge connecting (-10, 0) and (-7, -10).
	 * 
	 * Called only after GrahamScan().
	 * 
	 * 
	 * @throws IllegalStateException
	 *             if hullVertices[] has not been populated (i.e., the convex
	 *             hull has not been constructed)
	 */
	public void hullToFile() throws IllegalStateException {
		// For the next 3 methods I have helper methods thet will help me to do the files
		// in this it will have the text file named hull txt and then it will do hullVertices
		// and numhullVertices as their parameters as we are doing the hullToFile
		EasyFile("hull.txt", hullVertices, numHullVertices);
	}

	/**
	 * For plotting in Mathematica.
	 * 
	 * Writes to the file "points.txt" the points stored in the array
	 * pointsNoDuplicate[]. The format is the same as required for the method
	 * hullToFile(), except that the coordinates of lowestPoint appear only
	 * once.
	 * 
	 * Called only after setUpScan() or GrahamScan().
	 * 
	 * @throws IllegalStateException
	 *             if pointsNoDuplicate[] has not been populated.
	 */
	public void pointsToFile() throws IllegalStateException {
		// Same as I did before made helper method and said their parameters as
		// points and also pointsNoduplicate and numDistictPoints as we are doing pointsToFile
		EasyFile("points.txt", pointsNoDuplicate, numDistinctPoints);
	}

	/**
	 * Also implement this method for testing purpose.
	 * 
	 * Writes to the file "pointsScanned.txt" the points stored in the array
	 * pointsToScan[]. The format is the same as required for the method
	 * pointsToFile().
	 * 
	 * Called only after setUpScan() or GrahamScan().
	 * 
	 * @throws IllegalStateException
	 *             if pointsToScan[] has not been populated.
	 */
	public void pointsScannedToFile() throws IllegalStateException {
		// Again we need to do the same thing as again I have helper method which is right underneath
		// of this method and used pointsScanned as their text file and pointsToScan and numPointsToScan
		// as their parameters
		
		EasyFile("pointsScanned.txt", pointsToScan, numPointsToScan);
	}
	/**
	 * This is the helper method I created for the three method above.
	 * In this method what I am basically doing is checking if is null, if it is then 
	 * just throw expection
	 * 
	 * and I used try and catch here so that I can catch if there are any errors
	 * I used loop and checked the X and y  cordinates.
	 * @param name
	 * @param writeFile
	 * @param num
	 */
	private void EasyFile(String name, Point[] writeFile, int num) {
		if (writeFile == null) {
			throw new IllegalStateException();
		}
		try {
			PrintWriter printer = new PrintWriter(new File(name));
			for (int j = 0; j < num; j++) {
				printer.println("" + writeFile[j].getX() + " "
						+ writeFile[j].getY());
			}
			if (writeFile == hullVertices) {
				printer.println(writeFile[0].getX() + " " + writeFile[0].getY());
			}
			printer.close();
		} catch (FileNotFoundException e) {
			System.out.println(name + " Error !");
		}
	}

	/**
	 * Find the point in the array points[] that has the smallest y-coordinate.
	 * In case of a tie, pick the point with the smallest x-coordinate. Set the
	 * variable lowestPoint to the found point.
	 * 
	 * Multiple elements from points[] could coincide at the lowestPoint (i.e.,
	 * they are the same point). This situation could happen, though with a very
	 * small chance. In this case, any of them can be lowestPoint.
	 * 
	 * Ought to be private, but is made public for testing convenience.
	 */
	public void lowestPoint() {
		// Here I just kept at the 0 point
		Point tempPoint = points[0];
		// This loop is where it is going to check if it is smaller than numPoints
		// as we have to find the lowest point and make it as your starting point
		for (int k = 0; k < numPoints; k++) {
			// In this condition I am writing that so that it is checking if the points are smaller 
			// than the tempPoints which I have as the starting point initizialized to 0
			if (points[k].getY() < tempPoint.getY() && tempPoint != points[k]) {
				tempPoint = points[k];
			}
			// In this I am just going to check if there are some equals to the points and 
			//smaller to the get index
			if (points[k].getY() == tempPoint.getY()
					&& points[k].getX() < tempPoint.getX()) {
			tempPoint = points[k];
			}
		}
	
		lowestPoint = tempPoint;
	}

	/**
	 * Call quickSort() on points[]. After the sorting, duplicates in points[]
	 * will appear next to each other, with those equal to lowestPoint at the
	 * beginning of the array.
	 * 
	 * Copy the points from points[] into the array pointsNoDuplicate[],
	 * eliminating all duplicates. Update numDistinctPoints.
	 * 
	 * Copy the points from pointsNoDuplicate[] into the array pointsToScan[]
	 * and eliminate some as follows. If multiple points have the same polar
	 * angle, eliminate all but the one that is the furthest from lowestPoint.
	 * Update numPointsToScan.
	 * 
	 * Ought to be private, but is made public for testing convenience.
	 *
	 */
	public void setUpScan() {
		quickSort(); // This is the method
		nullDupli();// This is the helper method
		ScanOfInt(); // This is the helper method as well.
		
		
		/**
		 * This is just for testing
		for(int i = 0 ; i < pointsToScan.length; i++){
			System.out.println(pointsToScan[i]);
		}
		*/
	}
	
	/**
	 * I created this helper method where I am setting everything to 0
	 * and then use the comparator to the lowestPoint
	 * and used the loop for the numDistinct -1 so that it doest show me out of bounds
	 * and then used to the if statement and saw if the k + 1 is greater than 0
	 * and then use the counter to the arrat and checked it is the duplicate points are equal to
	 * k and incremented the counter 
	 */

	private void ScanOfInt() {

		int counter = 0;
		pointsToScan = new Point[0];
		PointComparator c = new PointComparator(lowestPoint);
		for (int k = 0; k < numDistinctPoints - 1; k++) {
			if (c.comparePolarAngle(pointsNoDuplicate[k],
					pointsNoDuplicate[k + 1]) == 0) {
				if (c.compareDistance(pointsNoDuplicate[k],
						pointsNoDuplicate[k + 1]) > 0) {
					pointsToScan = Arrays.copyOf(pointsToScan,
							pointsToScan.length + 1);
					pointsToScan[counter] = pointsNoDuplicate[k];
					counter++;
				}

			} else {
				pointsToScan = Arrays.copyOf(pointsToScan,
						pointsToScan.length + 1);
				pointsToScan[counter] = pointsNoDuplicate[k];
				counter++;
			}
		}
		pointsToScan = Arrays.copyOf(pointsToScan, pointsToScan.length + 1);
		pointsToScan[counter] = pointsNoDuplicate[numDistinctPoints - 1];
		numPointsToScan = pointsToScan.length;

	}
	/**
	 * This is also the method I created to check if the points are at the array of 0 and 
	 * and used to loop to go through it and checked if it smaller than 1 as i dont want to have 
	 * outofbounds exception
	 * and then checked it is equals to k +1
	 * else I have to copy the arry into the new one.
	 * 
	 * 
	 */
	private void nullDupli() {
		int counter = 0;
		pointsNoDuplicate = new Point[0];
		for (int k = 0; k < numPoints - 1; k++) {
			if (points[k].equals(points[k + 1])) {
				// System.out.println("check");
			} else {
				pointsNoDuplicate = Arrays.copyOf(pointsNoDuplicate,
						pointsNoDuplicate.length + 1);
				pointsNoDuplicate[counter] = points[k];
				counter++;
			}
		}
		pointsNoDuplicate = Arrays.copyOf(pointsNoDuplicate,
				pointsNoDuplicate.length + 1);
		pointsNoDuplicate[counter] = points[numPoints - 1];
		numDistinctPoints = pointsNoDuplicate.length;

	}

	/**
	 * Sort the array points[] in the increasing order of polar angle with
	 * respect to lowestPoint. Use quickSort. Construct an object of the
	 * pointComparator class with lowestPoint as the argument for point
	 * comparison.
	 * 
	 * Ought to be private, but is made public for testing convenience.
	 */
	public void quickSort() {
		// this is what I thought to do in the quickSort
		
		if(lowestPoint == null){
			lowestPoint();
		}
		// just called the helper method so that it helps you to do it easily
		quickSortRec(0, points.length - 1);
		

	}

	/**
	 * Operates on the subarray of points[] with indices between first and last.
	 * 
	 * @param first
	 *            starting index of the subarray
	 * @param last
	 *            ending index of the subarray
	 */
	private void quickSortRec(int first, int last) {
		//checked if it first is greater than last
		if (first >= last) {
			return;
		}
		// used to the same as partition and checked the first as well as last 
		int part = partition(first, last);
		quickSortRec(first, part - 1); // called the recursion and said -1
		quickSortRec(part + 1, last); // again called the recursiona and said +1
	}

	/**
	 * Operates on the subarray of points[] with indices between first and last.
	 * 
	 * @param first
	 * @param last
	 * @return
	 */
	private int partition(int first, int last) {
		// In this I said the array as the last
		Point pp = points[last];
		// used the compartor to see the lowestpoint
		PointComparator pc = new PointComparator(lowestPoint);
		// in this I am just doing - 1
		int i = first -1;
		// in this loop I am just checking and seeing if it the last - 1
		// and if it compares to the point of k as well it is smaller than 0
		for(int k = first; k <= last -1 ; k++){
			if(pc.compare(points[k], pp) < 0){
				i++;
				Point temp = points[i];
				points[i] = points[k];
				points[k] = temp;
			}
		}
		// this is all the another way where you jsut swap it
		Point temp = points[i + 1];
		points[i+1] = points[last];
		points[last] = temp;
		
		return i + 1;

	}


}
