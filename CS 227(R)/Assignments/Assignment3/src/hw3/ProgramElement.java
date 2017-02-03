package hw3;

import parser.ViewerNode;

/**
 * Base class for all program elements, which includes expressions
 * and statements (objects implementing the IExpression and IStatement
 * interfaces, respectively).  This class implements the ViewerNode 
 * interface, which makes it possible to use the TreeViewer utility
 * to examine program elements.  The ViewerNode interface
 * requires subtypes to have the ability to 
 * return information about the direct sub-elements of which they
 * are composed.  Every concrete subtype must therefore implement the
 * methods <code>getNumSubElements</code> and <code>getSubElement</code>.
 * Subelements are indexed starting at zero.  
 * <p>
 * For example, for any binary
 * expression, <code>getNumSubElements()</code> returns 2, 
 * <code>getSubElement(0)</code> returns the expression on the left-hand
 * side, and <code>getSubElement(1)</code> returns the expression
 * on the right-hand side.
 */
public abstract class ProgramElement implements ViewerNode
{
  /**
   * A name for this element type.
   */
  private String name;
  
  /**
   * A text representation of this element.
   */
  private String text;
  
  /**
   * Constructs an element with the given type name and text representation.
   * @param givenName
   *   name for this element type
   * @param givenText
   *   text representation of this element
   */
  protected ProgramElement(String givenName, String givenText)
  {
    if (givenName == null)
    {
      givenName = "";
    }
    if (givenText == null)
    {
      givenText = "";
    }
    name = givenName;
    text = givenText;
  }
  
  /**
   * Returns the name for this element type.
   */
  @Override
  public String getName()
  {
    return name;
  }
  
  /**
   * Returns the text representation of this element type.
   */
  @Override
  public String getText()
  {
    return text;
  }
  
  @Override
  public String toString()
  {
    String desc = name + " " + text;
    if (text.length() == 0)
    {
      desc += "(" + getNumSubElements() + ")";
    }
    return desc;
    
  }
  
  /**
   * Returns the number of direct subelements of this one.
   */
  @Override
  public abstract int getNumSubElements();
  
  /**
   * Returns the subelement at the given index, or
   * an instance of <code>DefaultElement</code> if the
   * given index is not valid for this element.
   */
  @Override
  public abstract Object getSubElement(int index);
}
