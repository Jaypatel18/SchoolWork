package hw3;

import api.IExpression;

/**
 * Abstract unary expression.  This element has one subelement.
 */
public abstract class UnaryExpression extends ProgramElement implements IExpression
{
  /**
   * Constructs a unary expression from the given sub-expression.  
   * @param givenName
   *   a name for the type of element
   * @param givenText
   *   a text representation of the operator
   * @param expr
   *   expression to be operated upon
   */
  protected UnaryExpression(String givenName, String givenText, IExpression expr)
  {
    super(givenName, givenText);
    // TODO - anything else you need
  }

}
