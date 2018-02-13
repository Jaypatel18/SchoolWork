package hw3;

import api.IEnvironment;
import api.IExpression;

/**
 * Logical 'not' expression.  Logical values are represented using 0 
 * for false and 1 for true.  This element has one subelement, the 
 * expression to be negated.
 */
public class LogicalNot extends UnaryExpression
{
  
  /**
   * Constructs a unary expression that represents the logical negation
   * of the given expression.
   * @param expr
   *   the logical expression to be negated
   */
  public LogicalNot(IExpression expr)
  {
    super("NOT", "!", expr);
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
