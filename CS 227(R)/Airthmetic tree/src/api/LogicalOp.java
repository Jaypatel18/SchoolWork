package api;

/**
 * Constants representing logical binary operators.
 */
public enum LogicalOp
{
  AND("&&"), OR("||");
  
  private final String text;
  private LogicalOp(final String text)
  {
    this.text = text;
  }
  
  /**
   * Returns a text representation of this operator.
   * @return
   *   text representation of this operator
   */
  public String getText()
  {
    return text;
  }
}
