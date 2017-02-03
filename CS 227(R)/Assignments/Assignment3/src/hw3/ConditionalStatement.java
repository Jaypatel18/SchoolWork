package hw3;

import api.IEnvironment;
import api.IExpression;
import api.IStatement;

/**
 * Statement type representing a conditional.  A conditional has a logical
 * expression and two statements.  If the logical expression is true, the
 * first statement is executed and if the logical expression is false, the
 * second statement is executed.  This element has three subelements, the 
 * condition, the first statement, and the second statement, in that order.
 */
public class ConditionalStatement extends ProgramElement implements IStatement
{
  /**
   * Constructs a conditional statement from the given condition
   * and alternative actions.
   * @param condition
   *    an expression to use as the condition
   * @param s0
   *    statement to be executed if the condition is true (nonzero)
   * @param s1
   *    statement to be executed if the condition is false (zero)
   */
  public ConditionalStatement(IExpression condition, IStatement s0, IStatement s1)
  {
    super("Conditional", null);
    // TODO - anything else you need
  }

  @Override
  public void execute(IEnvironment env)
  {
    // TODO Auto-generated method stub
    
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
