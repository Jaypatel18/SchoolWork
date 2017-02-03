package api;

/**
 * An IEnvironment is a collection of names and associated values.
 */
public interface IEnvironment
{
  /**
   * Returns the value associated with the given name.
   * @param name
   *   given name
   * @return
   *   value associated with the given name
   * @throws InterpreterException
   *   if the given name is not found
   */
  public int get(String name);
  
  /**
   * Adds the given name and value to the environment, replacing
   * any existing value associated with the given name.
   * @param name
   *   given name
   * @param value
   *   given value
   */
  public void put(String name, int value);
  
  /**
   * Removes the given name and its associated from the environment,
   * if present.  Has no effect if the given name is not found.
   * @param name
   *   the name to be removed
   */
  public void remove(String name);
}
