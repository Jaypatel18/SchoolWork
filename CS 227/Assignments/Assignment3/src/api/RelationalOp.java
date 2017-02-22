package api;

/**
 * Constants representing relational operators.
 */
public enum RelationalOp
{
  EQ("=="), NEQ("!="), LT("<"), GT(">"), LTE("<="), GTE(">=") ;
  
  private final String text;
  private RelationalOp(final String text)
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
