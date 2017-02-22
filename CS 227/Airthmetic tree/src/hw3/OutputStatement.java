package hw3;

import api.IEnvironment;
import api.IExpression;
import api.IStatement;

/**
 * Statement type whose execution causes the value of an expression to
 * be printed to the console.
 * @author Jay
 */
public class OutputStatement extends ProgramElement implements IStatement
{
  /**
   * Constructs an output statement for the given expression.
   * @param expr
   *   given expression
   */
	private IExpression GivenExpression;
	private IEnvironment GivenStatement;
	private int DirectSubElemets;
  public OutputStatement(IExpression expr)
  {
    super("Output", null);
    // TODO - anything else you need
    GivenExpression = expr;
  }

  @Override
  public void execute(IEnvironment env)
  {
    // TODO Auto-generated method stub
    GivenStatement = env;
  }

  @Override
  public int getNumSubElements()
  {
    // TODO Auto-generated method stub
    return DirectSubElemets;
  }

  @Override
  public Object getSubElement(int index)
  {
    // TODO Auto-generated method stub
    return null;
  }
  

}
