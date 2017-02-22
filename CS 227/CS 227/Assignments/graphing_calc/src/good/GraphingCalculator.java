package good;
import cs227.plotter.Plotter;

/**
 * A GraphingCalculator object plots the graph of a given
 * function on a Plotter window.  The function to be
 * plotted can be any instance of the SingleVariableFunction
 * interface.
 */
public class GraphingCalculator
{
  /**
   * The Plotter to be used.
   */
  private Plotter plotter;
  
  /**
   * Distance between x-values to be plotted.
   */
  private double gap;
  
  /**
   * Constructs a new GraphingCalculator that will use the 
   * given sampling gap.
   * @param samplingGap
   */
  public GraphingCalculator(double samplingGap)
  {
    gap = samplingGap;
    plotter = new Plotter();
    plotter.startPlotter();
  }
  

  /**
   * Sends a sequence of points to the plotter for
   * plotting the given function.
   * 
   * @param f
   *   the function to be plotted
   */
  public void plotFunction(SVFunction f)
  {
    plotter.clear();
    double x = -Plotter.VIEWPORT_MAX;
    while (x < Plotter.VIEWPORT_MAX + gap)
    {
      plotter.addPoint(x, f.yValue(x));
      x += gap;
    }
  }
}
