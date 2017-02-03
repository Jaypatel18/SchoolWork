package hw3;

import api.IEnvironment;

/**
 * Expression type representing an identifier (variable).
 * An identifier contains a string to be used as a variable name.
 * This element has no subelements.  
 */
public class Identifier extends ValueExpression
{
  /**
   * Constructs an identifier using the given string name.
   * @param givenName
   *   name for this identifier
   */
  public Identifier(String givenName)
  {
    super("Id", givenName);
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
