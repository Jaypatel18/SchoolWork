import api.ArithmeticOp;
import api.IEnvironment;
import api.IExpression;
import api.IStatement;
import api.RelationalOp;
import hw3.ArithmeticExpression;
import hw3.AssignmentStatement;
import hw3.BlockStatement;
import hw3.Environment;
import hw3.Identifier;
import hw3.Literal;
import hw3.LoopStatement;
import hw3.OutputStatement;
import hw3.RelationalExpression;
import viewer.TreeViewer;


/**
 * Some examples related to hw3.  
 */
public class Example
{

  public static void main(String[] args)
  {
    example1();
    
//    System.out.println();
//    example2();
    
//    System.out.println();
//    example3();
    
//    System.out.println();
//    example4();
  }

  private static void example1()
  {
    // A literal value.  
    IExpression e0 = new Literal(2);
    IExpression e1 = new Literal(3);
    
    // create the expression 2 + 3
    IExpression aSum = new ArithmeticExpression(ArithmeticOp.PLUS, e0, e1);
    
    // Note the environment is not used here, we can just pass in null
    System.out.println(e0.evaluate(null));   // expected 2
    System.out.println(e1.evaluate(null));   // expected 3
    System.out.println(aSum.evaluate(null)); // expected 5
    
    // create the expression (2 + 3) * 4
    IExpression e2 = new Literal(4);
    IExpression aProduct = new ArithmeticExpression(ArithmeticOp.TIMES, aSum, e2);
    System.out.println(aProduct.evaluate(null)); // expected 20

    // optionally, take a look at the resulting elements using the viewer
    //TreeViewer.start(aProduct); 
  }
  
  private static void example2()
  {
    // A variable is just a name
    Identifier myVar = new Identifier("x");
    
    // In order to evaluate a variable, we need an environment
    // in which it is given a value.
    IEnvironment env = new Environment();
    env.put("x", 17);
    
    // Try looking up x in the environment
    System.out.println(env.get("x"));  // expected 17
     
    // Evaluating a variable by itself should give us the value in the environment
    System.out.println(myVar.evaluate(env));  // expected 17
    
    // Create an expression x - 5
    IExpression newExpr = new ArithmeticExpression(ArithmeticOp.MINUS, myVar, new Literal(5));
    System.out.println(newExpr.evaluate(env));  // expected 12

    // The environment can be updated
    env.put("x", 42);
    
    // Then evaluate the expression with respect to the new environment 
    System.out.println(newExpr.evaluate(env));  // expected 37

  }
  
  private static void example3()
  {
    
    // create the expression 2 + 3
    IExpression e0 = new Literal(2);
    IExpression e1 = new Literal(3);
    IExpression aSum = new ArithmeticExpression(ArithmeticOp.PLUS, e0, e1);

    // Statements do not have a value, but can be executed.
    // The simplest is an output statement, which should print
    // the value of an expression to the console.
    IStatement printIt = new OutputStatement(aSum);
    printIt.execute(null);  // prints 5
    
    // Executing an assignment statement has the side-effect of updating
    // or adding a variable to the given environment.
    IEnvironment env = new Environment();
    Identifier myVar = new Identifier("foo");
    IStatement assign = new AssignmentStatement(myVar, aSum);
    assign.execute(env);
    System.out.println(env.get("foo"));  // expected 5
  }
  
  private static void example4()
  {
    // create a loop that prints numbers 1 to 10
    IExpression one = new Literal(1);
    IExpression ten = new Literal(10);
    Identifier indexVar = new Identifier("count");
    
    // count = 1
    IStatement initialize = new AssignmentStatement(indexVar, one);
    
    // count <= 10
    IExpression test = new RelationalExpression(RelationalOp.LTE, indexVar, ten);
    
    // output(count)
    IStatement display = new OutputStatement(indexVar);
    
    // count = count + 1
    IExpression sum = new ArithmeticExpression(ArithmeticOp.PLUS, indexVar, one);
    IStatement increment = new AssignmentStatement(indexVar, sum);  
    
    // create the loop statement using a block for the body
    BlockStatement block = new BlockStatement();
    block.addStatement(display);
    block.addStatement(increment);
    IStatement loop = new LoopStatement(test, block);
    
    // now run it
    IEnvironment env = new Environment();
    initialize.execute(env);
    loop.execute(env);

    // Optionally, run the viewer on the loop statement
    //TreeViewer.start(loop);
  }
}
