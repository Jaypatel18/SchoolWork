import api.IEnvironment;
import api.IExpression;
import hw3.BlockStatement;
import hw3.Environment;
import parser.ViewerNode;
import util.ParserUtil;
import viewer.TreeViewer;

/**
 * Example of creating expressions or statements using the parser.
 */
public class ExampleWithParser
{
  public static void main(String[] args)  throws Exception
  {
    //String t = "(2 + 3) * 4";
    String t = "(2 + 3) >= 4 && !(5 == -(6 * 7))";

    IExpression e = ParserUtil.parseExpression(t);
    System.out.println(t);
    System.out.println("Value: " + e.evaluate(null));
    System.out.println();
    TreeViewer.start(e);
     
    // this string is a program to print numbers from 1 to 10
    String myProgram = 
        "count = 1; \n" +
        "while(count <= 10) \n" +
        "{ \n" +
        "  output(count); \n" +
        "  count = count + 1; \n" +
        "} \n";
    
    
//   System.out.println(myProgram);
//   System.out.println();
//   
//   BlockStatement b = ParserUtil.parseProgramFromString(myProgram);
//   IEnvironment env = new Environment();
//   b.execute(env);
//   TreeViewer.start(b);

    // try an example of a slightly longer program from a file
//    BlockStatement b2 = ParserUtil.parseProgramFromFile("sample.txt");
//    b2.execute(new Environment());
  }
}
