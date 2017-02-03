package hw3;

import api.ArithmeticOp;
import api.IEnvironment;
import api.IExpression;

/**
 * Binary expression with an arithmetic operator.  This element has
 * two subelements, the expressions on the left and right sides,
 * in that order.
 */
public class ArithmeticExpression extends BinaryExpression
{
  
  /**
   * Constructs a binary expression from the given sub-expressions.  This constructor
   * does not check whether the given expressions are arithmetic expressions.
   * @param op
   *   the binary operator
   * @param lhs
   *   expression on the left side
   * @param rhs
   *   expression on the right side
   */
  public ArithmeticExpression(ArithmeticOp op, IExpression lhs, IExpression rhs)
  {
    super(op.toString(), op.getText(), lhs, rhs);
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
