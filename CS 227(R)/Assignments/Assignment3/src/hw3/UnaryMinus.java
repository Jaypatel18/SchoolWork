package hw3;

import api.IEnvironment;
import api.IExpression;

/**
 * Arithmetic negation expression (unary minus).  This element
 * has one subelement, the expression to be negated.
 */
public class UnaryMinus extends UnaryExpression
{
  /**
   * Constructs a new unary expression representing the negative
   * of the given expression.
   * @param expr
   *   arithmetic expression to be negated
   */
  public UnaryMinus(IExpression expr)
  {
    super("NEGATION", "-", expr);
    // TODO - anything else you need
  }

  @Override
  public int evaluate(IEnvironment env)
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int getNumSubElements()
  {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public Object getSubElement(int index)
  {
    // TODO Auto-generated method stub
    return null;
  }
}
