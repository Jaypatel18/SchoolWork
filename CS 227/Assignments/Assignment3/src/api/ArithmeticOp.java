package api;

/**
 * Constants representing arithmetic binary operators.
 */
public enum ArithmeticOp
{
  PLUS("+"), MINUS("-"), TIMES("*"), DIV("/");
  
  private final String text;
  private ArithmeticOp(final String text)
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
