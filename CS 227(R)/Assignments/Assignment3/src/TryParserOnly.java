import hw3.BlockStatement;
import parser.ViewerNode;
import util.ParserUtil;
import viewer.TreeViewer;
import api.IExpression;

/**
 * Example using the parser and viewer that does not depend
 * on the ProgramElement hierarchy.
 */
public class TryParserOnly
{

  public static void main(String[] args)
  {   
    //String t = "(2 + 3) * 4";
    String t = "(2 + 3) >= 4 && !(5 == -(6 * 7))";
    ViewerNode v = ParserUtil.parseExpressionRaw(t);
    TreeViewer.start(v);

    String myProgram = 
        "count = 1; \n" +
        "while(count <= 10) \n" +
        "{ \n" +
        "  output(count); \n" +
        "  count = count + 1; \n" +
        "} \n";
    
   //System.out.println(myProgram);
    
   //ViewerNode v = ParserUtil.parseProgramFromStringRaw(myProgram);
   //TreeViewer.start(v);   
  }

}
