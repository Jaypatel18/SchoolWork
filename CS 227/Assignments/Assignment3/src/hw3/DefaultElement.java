package hw3;


/**
 * A default ProgramElement that can be returned by getSubElement
 * methods in case of an out of range index.
 */
public class DefaultElement extends ProgramElement
{
  /**
   * Constructs a DefaultElement.
   */
  public DefaultElement()
  {
    super("Error", null);
  }

  /**
   * Constructs a DefaultElement with the given string as its text.
   */
  public DefaultElement(String msg)
  {
    super("Error", msg);
  }

  @Override
  public int getNumSubElements()
  {
    return 0;
  }

  @Override
  public ProgramElement getSubElement(int index)
  {
     return null;
  }

}
