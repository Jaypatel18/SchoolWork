package hw3;

import api.IEnvironment;
import api.IExpression;
import api.IStatement;

public class LoopStatement extends ProgramElement implements IStatement
{
  /**
   * Constructs a loop statement from the given condition and body
   * @param condition
   *   expression for the loop condition
   * @param s
   *   statement for the loop body
   */
  public LoopStatement(IExpression condition, IStatement s)
  {
    super("Loop", null);
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
