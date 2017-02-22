package hw3;

import api.IEnvironment;

/**
 * Expression type representing a literal integer value.
 * This element has no subelements.
 */
public class Literal extends ValueExpression
{
  /**
   * Constructs a literal with the given value.
   * @param value
   *   int value for this litera.
   */
  public Literal(int value)
  {
    super("Int", "" + value);
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
