package hw2;

/**
 * This class encapsulates information about the state of the wheel
 * for a wheel of fortune game. The state of the wheel is represented
 * by its counterclockwise rotation in degrees.  The wheel represented
 * by this class has 24 segments each covering 15 degrees of rotation.
 * The value associated with each segment is fixed and is given by an internal
 * array of values (WHEEL_SEGMENTS). The rotation is always between
 * 1 and 359, with exact multiples of 15 degrees disallowed.
 */
public class GameWheel
{
  /**
   * Constant representing the "bankrupt" wheel segment.
   */
  public static final int BANKRUPT = -1;
  
  /**
   * Constant representing the "free play" wheel segment.
   */
  public static final int FREE_PLAY = 0;
  
  /**
   * Constant representing the "lose a turn" wheel segment.
   */
  public static final int LOSE_A_TURN = 1;

  /**
   * Numeric values for the wheel segments.
   */
  private static final int[] SEGMENT_VALUES = 
    {
      500, // 0 degrees
      900, // 15 degrees
      700,
      300,
      800,
      550,
      400,
      500,
      600,
      350,
      500,
      900,
      BANKRUPT,
      650,
      FREE_PLAY,
      700,
      LOSE_A_TURN,
      800,
      500,
      450,
      500,
      300,
      BANKRUPT,
      5000  // 345 degrees
    };

  /**
   * Current rotation of the wheel.  This value should always be between
   * 1 and 359 and should never be an exact multiple of 15.
   */
  private int rotation;
  
  /**
   * Constructs a new game wheel with an initial rotation of 359 degrees.
   */
  public GameWheel()
  {
    rotation = 359;
  }
  
  /**
   * Adds the given number of degrees to the wheel's position.  
   * If adding the given number would cause the rotation to be
   * an exact multiple of 15, then 1 is subtracted.  The result
   * is wrapped so that the end result is between 1 and 359 (inclusive).
   * (Note that the argument may be negative.)
   * @param degrees
   *   number of degrees to spin the wheel
   */
  public void spin(int degrees)
  {
    rotation += degrees;
    if (rotation % 15 == 0)
    {
      rotation -= 1;
    }
    while (rotation >= 360) rotation -= 360;
    while (rotation < 0) rotation += 360;
  }
  
  /**
   * Returns the current rotation of the wheel.
   * @return
   *   current rotation of the wheel
   */
  public int getRotation()
  {
    return rotation;
  }
  
  /**
   * Returns the value for the segment at the wheel's current rotation.
   * @return
   *   segment value for current rotation
   */
  public int getSegmentValue()
  {
    int whichSegment = rotation / 15;
    return SEGMENT_VALUES[whichSegment];
  }
}
