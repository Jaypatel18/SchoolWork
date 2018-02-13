package bad;

import java.util.Scanner;

/**
 * Try out the GraphingCalculator class.  This version does not use interfaces and
 * requires GraphingCalculator to be updated whenever we add a new type of
 * function.
 */
public class GCMain
{
  public static void main(String[] args)
  {
    GraphingCalculator calc = new GraphingCalculator(0.1);
    Scanner scanner = new Scanner(System.in);
    String s = getEntry(scanner);
    while (!s.equals("q"))
    {
      if (s.equals("a"))
      {
        LinearFunction f = new LinearFunction(1.0, 0.0);
        calc.plotFunction(f);
      }
      else if (s.equals("b"))
      {
        QuadraticFunction f = new QuadraticFunction(1.0, 0.0, 0.0);
        calc.plotFunction(f);
      }
      else if (s.equals("c"))
      {
        SineFunction f = new SineFunction(3, 2);
        calc.plotFunction(f);
      }
      else
      {
        System.out.println("Enter a, b, or c (q to quit)");
      }
      s = getEntry(scanner);
    }
    
  }

  /**
   * Prints a menu and gets the user's choice.
   * @param scanner
   *   Scanner to use for reading from the console
   * @return
   *   letter entered by the user
   */
  private static String getEntry(Scanner scanner)
  {
    System.out.println("What kind of function do you want to plot?");
    System.out.println("a) Linear function");
    System.out.println("b) Quadratic function");
    System.out.println("c) Sine function");
    System.out.print("Your choice: ");    
    return scanner.next();  
  }
}
