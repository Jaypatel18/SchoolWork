package hw3;

import api.IExpression;

/**
 * Abstract binary expression.  This element has
 * two subelements, the expressions on the left and right sides,
 * in that order.
 */
public abstract class BinaryExpression extends ProgramElement implements IExpression
{
  /**
   * Constructs a binary expression from the given sub-expressions.  
   * @param givenName
   *   a name for the type of element
   * @param givenText
   *   a text representation of the operator
   * @param lhs
   *   expression on the left side
   * @param rhs
   *   expression on the right side
   */
  protected BinaryExpression(String givenName, String givenText, IExpression lhs, IExpression rhs)
  {
    super(givenName, givenText);
    // TODO - anything else you need
  }

}
