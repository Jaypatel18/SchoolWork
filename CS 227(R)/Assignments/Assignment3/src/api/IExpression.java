package api;

/**
 * An arithmetic or logical expression that represents a value.  
 * Logical values are represented using 0 for false and 1 for true.
 */
public interface IExpression
{
  /**
   * Returns the value of this expression in the given environment.  
   * Logical values are represented using 0 for false and 1 for true.
   * If the expression contains no variables, the environment is ignored.
   * @param env
   *   environment with which this expression is to be evaluated
   * @return
   *   value of the expression in the given environment
   */
  int evaluate(IEnvironment env);
}
