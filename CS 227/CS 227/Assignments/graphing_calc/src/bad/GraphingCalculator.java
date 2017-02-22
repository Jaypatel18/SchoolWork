package bad;
import cs227.plotter.Plotter;

/**
 * A GraphingCalculator object plots the graph of a given
 * function on a Plotter window.   This version does not use interfaces and
 * requires GraphingCalculator to be updated whenever we add a new type of
 * function.
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
  public void plotFunction(LinearFunction f)
  {
    plotter.clear();
    double x = -Plotter.VIEWPORT_MAX;
    while (x < Plotter.VIEWPORT_MAX + gap)
    {
      plotter.addPoint(x, f.yValue(x));
      x += gap;
    }
  }

  public void plotFunction(SineFunction f)
  {
    plotter.clear();
    double x = -Plotter.VIEWPORT_MAX;
    while (x < Plotter.VIEWPORT_MAX + gap)
    {
      plotter.addPoint(x, f.yValue(x));
      x += gap;
    }
  }

  /**
   * Sends a sequence of points to the plotter for
   * plotting the given function.
   * 
   * @param f
   *   the function to be plotted
   */
  public void plotFunction(QuadraticFunction f)
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
