package edu.iastate.cs228.hw4;

/**
 *  
 * @author Jay
 *
 */

import java.util.Comparator;

/**
 * 
 * This class compares two points p1 and p2 by polar angle with respect to a
 * reference point. It is known that the reference point is not above either p1
 * or p2, and in the case that either or both of p1 and p2 have the same
 * y-coordinate, not to their right.
 *
 */
public class PointComparator implements Comparator<Point> {
	private Point referencePoint;

	/**
	 * 
	 * @param p
	 *            reference point
	 */
	PointComparator(Point p) {
		referencePoint = p;
	}

	/**
	 * Use cross product and dot product to implement this method. Do not take
	 * square roots or use trigonometric functions. See the PowerPoint notes on
	 * how to carry out cross and dot products.
	 * 
	 * Call comparePolarAngle() and compareDistance().
	 * 
	 * @param p1
	 * @param p2
	 * @return -1 if one of the following three conditions holds: a) p1 and
	 *         referencePoint are the same point but p2 is a different point; b)
	 *         neither p1 nor p2 equals referencePoint, and the polar angle of
	 *         p1 with respect to referencePoint is less than that of p2; c)
	 *         neither p1 nor p2 equals referencePoint, p1 and p2 have the same
	 *         polar angle w.r.t. referencePoint, and p1 is closer to
	 *         referencePoint than p2. 0 if p1 and p2 are the same point 1 if
	 *         one of the following three conditions holds: a) p2 and
	 *         referencePoint are the same point but p1 is a different point; b)
	 *         neither p1 nor p2 equals referencePoint, and the polar angle of
	 *         p1 with respect to referencePoint is greater than that of p2; c)
	 *         neither p1 nor p2 equals referencePoint, p1 and p2 have the same
	 *         polar angle w.r.t. referencePoint, and p1 is further to
	 *         referencePoint than p2.
	 * 
	 */
	public int compare(Point p1, Point p2) {
		// Here I am just bascially checking the conditions mentioned above in the java doc

		if ((referencePoint.equals(p1) && p2 != referencePoint)
				|| ((p1 != referencePoint && p2 != referencePoint) && (comparePolarAngle(
						p1, p2) < 0))
				|| ((p1 != referencePoint && p2 != referencePoint)
						&& (comparePolarAngle(p1, p2) == 0) && (compareDistance(
						p1, p2) < 0))) {
			return -1;
		} else if ((referencePoint.equals(p2) && p1 != referencePoint)
				|| ((p2 != referencePoint && p2 != referencePoint) && (comparePolarAngle(
						p1, p2) > 0))
				|| ((p2 != referencePoint && p2 != referencePoint)
						&& (comparePolarAngle(p1, p2) == 0) && (compareDistance(
						p1, p2) > 0))) {
			return 1;
		}

		else {
			return 0;
		}
	}

	/**
	 * Compare the polar angles of two points p1 and p2 with respect to
	 * referencePoint. Use cross products. Do not use trigonometric functions.
	 * 
	 * Precondition: p1 and p2 are distinct points.
	 * 
	 * @param p1
	 * @param p2
	 * @return -1 if p1 equals referencePoint or its polar angle with respect to
	 *         referencePoint is less than that of p2. 0 if p1 and p2 have the
	 *         same polar angle. 1 if p2 equals referencePoint or its polar
	 *         angle with respect to referencePoint is less than that of p1.
	 */
	public int comparePolarAngle(Point p1, Point p2) {
		int compare = 0;
		if (p1.equals(p2)) // here I am just seeing if it equal to the parameter p2 and if it is 
			// then it should be 0
			compare = 0;
		// Here I am checking it is greater than 0
		else if (cp(p1, p2) > 0
				|| (p1.getX() == referencePoint.getX() && p1.getY() == referencePoint
						.getY())) {
			compare = -1;
		} else if (p2.getX() == referencePoint.getX()
				&& p2.getY() == referencePoint.getY() || (cp(p1, p2) < 0)) {
			compare = 1;
		} else
			compare = 0;
		return compare;

	}
	/**
	 * This is the helper method where I am just checking the reference points to the 
	 * corresponding cordinates and then just multiply those two points and add to the different
	 * points.
	 * 
	 * 
	 * @param p1
	 * @param p2
	 * @return
	 */

	private int cp(Point p1, Point p2) {

		int c = 0;
		int point1 = p1.getX() - referencePoint.getX();
		int pointY1 = p1.getY() - referencePoint.getY();
		int pointX2 = p2.getX() - referencePoint.getX();
		int pointY2 = p2.getY() - referencePoint.getY();

		c = point1 * pointY2 - pointX2 * pointY1;

		return c;
	}

	/**
	 * Compare the distances of two points p1 and p2 to referencePoint. Use dot
	 * products. Do not take square roots.
	 * 
	 * @param p1
	 * @param p2
	 * @return -1 if p1 is closer to referencePoint 0 if p1 and p2 are
	 *         equidistant to referencePoint 1 if p2 is closer to referencePoint
	 */
	public int compareDistance(Point p1, Point p2) {
		int compare = 0;
		int d1 = 0;
		int d2 = 0;
		d1 = dp(referencePoint, p1);
		d2 = (int) dp(referencePoint, p2); // just casting here to the reference point	
		// checking here to see if it smaller and then if it is then it should be -1
		if (d1 < d2)
			compare = -1;
		else if (d2 < d1) // Here is it is it should be 1
			compare = 1;
		else
			compare = 0;
		return compare;
	}
	/**
	 * This is the helper method I created for the dot product where I am using the reference points
	 * and substract with the correspoding cordinates
	 * amd the just multiplying those cordinates and add those to different points
	 * just as the equation.
	 * 
	 * @param referencePoint2
	 * @param p1
	 * @return
	 */
	private int dp(Point referencePoint2, Point p1) {

		int d = 0;
		referencePoint2 = referencePoint;

		int point1 = p1.getX() - referencePoint2.getX();
		int point2 = p1.getY() - referencePoint2.getY();

		d = point1 * point1 + point2 * point2;

		return d;
	}
}
