package good;

/**
 * This is just an example function that is not directly
 * referenced in GCMain, in order to illustrate
 * using the Java reflection API to dynamically load
 * a new class.  Try selecting option "d" and enter 
 * "good.Foo" as the name and 0
 * for the number of arguments in the constructor.
 */
public class Foo implements SVFunction
{
  @Override
  public double yValue(double x)
  {
    // kind of a sawtooth?
    return 3 + x - Math.floor(x);
  }

}
