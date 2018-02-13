package ugly;

/**
 * This is really ugly code.  
 * This class illustrates a clunky way to represent a general function 
 * of one variable.  When you see code like this in which
 * there is a big "if" statement to get different behavior for 
 * different types, that is a sure sign that you should be using 
 * polymorphism.   
 */
public class SingleVariableFunction
{
  // constants for types of functions
  public static final int LINEAR = 0;
  public static final int QUADRATIC = 1;
  public static final int SINE = 2;
  
  // type of this function
  private int type;
  
  // attributes of a linear function
  private double slope;
  private double intercept;
  
  // attributes of a sine function
  private double period;
  
  // attributes of a quadratic function
  private double a;
  private double b;
  private double c;
  
  
  /**
   * Constructs a linear function with the given slope and intercept.
   * @param givenSlope
   * @param givenIntercept
   */
  public SingleVariableFunction(double givenSlope, double givenIntercept)
  {
    type = LINEAR;
    slope = givenSlope;
    intercept = givenIntercept;
  }
  
  /**
   * Constructs a sine function
   * @param p
   */
  public SingleVariableFunction(double p)
  {
    type = SINE;
    period = p;
  }
  
  
  /**
   * Constructs a quadratic function
   * @param givenA
   * @param givenB
   * @param givenC
   */
  public SingleVariableFunction(double givenA, double givenB, double givenC)
  {
    type = QUADRATIC;
    a = givenA;
    b = givenB;
    c = givenC;
  }
  
  /**
   * Returns the y-value for the given x.
   */
  public double yValue(double x)
  {
    if (type == LINEAR)
    {
      return slope * x + intercept;
    }
    else if (type == QUADRATIC)
    {
      return a * x * x + b * x + c;
    }
    else if (type == SINE)
    {
      return Math.sin((x * 2 * Math.PI) / period);
    }
    else
    {
      throw new IllegalStateException("Unknown function type " + type); 
    }
  }
}
