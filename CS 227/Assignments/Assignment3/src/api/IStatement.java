package api;

/**
 * Statement that can be executed.  Executing a statement does not
 * return a value, but statements may
 * update the environment (assignment) or produce output. 
 */
public interface IStatement
{
  /**
   * Executes the given statement in the given environment.
   * Note that a statement may update the environment by
   * creating variables or assigning new values to variables.
   * @param env
   *   environment in which this statement will be executed
   */
  void execute(IEnvironment env);
}
