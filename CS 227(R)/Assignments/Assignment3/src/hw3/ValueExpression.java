package hw3;

import api.IExpression;

/**
 * Abstract supertype for an expression with no subexpressions
 * (such as a literal or variable).
 */
public abstract class ValueExpression extends ProgramElement implements IExpression
{
  /**
   * Constructs a value expression.
   * @param givenName
   *   a name for the type of element
   * @param givenText
   *   a text representation of the value
   */
  protected ValueExpression(String givenName, String givenText)
  {
    super(givenName, givenText);
    // TODO - anything else you need
  }
}
