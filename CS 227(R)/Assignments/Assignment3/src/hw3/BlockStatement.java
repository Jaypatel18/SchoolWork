package hw3;

import api.IEnvironment;
import api.IStatement;

/**
 * Compound statement representing a sequence of statements.  Execution
 * of a block iterates through the sequence, calling execute() on each
 * one.  The number of subelements is the number of statements in
 * this block (possibly zero).
 */
public class BlockStatement extends ProgramElement implements IStatement
{
  /**
   * Constructs an empty sequence of statements.
   */
  public BlockStatement()
  {
    super("Block", null);
    // TODO - anything else you need
  }

  /**
   * Adds a statement to this block.  The statements will be executed
   * in the order added.
   * @param s
   *   statement to be added to this block
   */
  public void addStatement(IStatement s)
  {
    // TODO
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
