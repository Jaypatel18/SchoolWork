package util;
import hw3.ArithmeticExpression;
import hw3.ProgramElement;
import hw3.UnaryMinus;
import hw3.AssignmentStatement;
import hw3.BlockStatement;
import hw3.ConditionalStatement;
import hw3.Identifier;
import hw3.Literal;
import hw3.LogicalExpression;
import hw3.LogicalNot;
import hw3.LoopStatement;
import hw3.OutputStatement;
import hw3.RelationalExpression;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;

import api.ArithmeticOp;
import api.IExpression;
import api.IStatement;
import api.InterpreterException;
import api.LogicalOp;
import api.RelationalOp;
import parser.DefaultNode;
import parser.ParserImpl;
import parser.ViewerNode;

/**
 * Utility for interacting with the expression parser.
 */
public class ParserUtil
{

  /**
   * Parses a given arithmetic or logical expression and returns
   * an appropriate instance of IExpression.  Parser errors are
   * reported on console output.
   * @param expr
   *   expression to be parsed
   * @return
   *   the parsed expression as an IExpression object
   */
  public static IExpression parseExpression(String expr)
  {
    ViewerNode root = ParserImpl.parseExpression(expr);
    ProgramElement ret = treeConvRec((DefaultNode) root); 
    return (IExpression) ret;
  }

  /**
   * Parses a program given as a string and returns a BlockStatement object.
   * Parser errors are reported on console output.
   * @param programText
   *   program text to be parsed
   * @return
   *   BlockStatement object representing the program
   */
  public static BlockStatement parseProgramFromString(String programText)
  {
    ViewerNode root = ParserImpl.parseProgram(programText);
    ProgramElement ret = treeConvRec((DefaultNode) root); 
    return (BlockStatement) ret;
  }

  /**
   * Parses a program given in a file and returns a BlockStatement object.
   * Parser errors are reported on console output.
   * @param filename
   *   name of the file to be parsed
   * @return
   *   BlockStatement object representing the program
   * @throws FileNotFoundException
   *   if the named file cannot be opened
   */
  public static BlockStatement parseProgramFromFile(String filename) throws FileNotFoundException
  {
    FileInputStream in = new FileInputStream(new File(filename));
    ViewerNode root = ParserImpl.parseProgram(in);
    ProgramElement ret = treeConvRec((DefaultNode) root); 
    return (BlockStatement) ret;
  }

  /**
   * Parses an arithmetic or logical expression and returns a 
   * default ViewerNode.  This type of node cannot be evaluated,
   * but the result can be examined using the TreeViewer utility.
   * Parser errors are reported on console output.
   * @param expr
   *   expression to be parsed
   * @return
   *   a default ViewerNode 
   */
  public static ViewerNode parseExpressionRaw(String expr)
  {
    ViewerNode root = ParserImpl.parseExpression(expr);
    return root;
  }

  /**
   * Parses a program given as a string and returns a
   * default ViewerNode.  This type of node cannot be executed,
   * but the result can be examined using the TreeViewer utility.
   * Parser errors are reported on console output.
   * @param programText
   *   program text to be parsed
   * @return
   *   a default ViewerNode 
   */
  public static ViewerNode parseProgramFromStringRaw(String programText) throws FileNotFoundException
  {
    ViewerNode root = ParserImpl.parseProgram(programText);
    return root;
  }

  /**
   * Parses a program given in a file and returns a
   * default ViewerNode.  This type of node cannot be executed,
   * but the result can be examined using the TreeViewer utility.
   * Parser errors are reported on console output.
   * @param filename
   *   name of the file to be parsed
   * @return
   *   a default ViewerNode 
   */
  public static ViewerNode parseProgramFromFileRaw(String filename) throws FileNotFoundException
  {
    FileInputStream in = new FileInputStream(new File(filename));
    ViewerNode root = ParserImpl.parseProgram(in);
    return root;
  }
  
  /**
   * Converts a tree of DefaultNode into a tree of ProgramElement objects
   * @param n
   *   root of the DefaultNode subtree to be converted
   * @return
   *   subtree of ProgramElement
   */
  private static ProgramElement treeConvRec(DefaultNode n)
  {
    String type = n.getName();
    String text = n.getText();
    
    // postorder traversal, collect children first
    ArrayList<ProgramElement> children = new ArrayList<ProgramElement>();  
    for (int i = 0; i < n.getNumSubElements(); ++i)
    {
      DefaultNode child = ((DefaultNode) n.getSubElement(i));
      ProgramElement newChild = (ProgramElement) treeConvRec(child);
      children.add(newChild);
    }
    ProgramElement newNode = createProgramElement(type, text, children);
    
    return newNode;
  }

  
  /**
   * Constructs a ProgramElement object described by the given type and text.
   * @param type
   *   node type as reported by the parser
   * @param text
   *   node text as reported by the parser
   * @param children
   *   list of ProgramElements to be the subelements of this node
   * @return
   *   a ProgramElement object 
   */
  private static ProgramElement createProgramElement(String type, String text, ArrayList<ProgramElement> children)
  {
    try
    {
      // leaves
      if (type.equals("INT"))
      {
        int value = Integer.parseInt(text);
        return new Literal(value);
      }
      if (type.equals("ID"))
      {
        return new Identifier(text);
      }

      // unary ops
      if (type.equals("NEG"))
      {
        checkLength(children, 1);
        return new UnaryMinus((IExpression) children.get(0));
      }
      if (type.equals("NOT"))
      {
        checkLength(children, 1);
        return new LogicalNot((IExpression) children.get(0));
      }

      // binary ops
      if (type.equals("PLUS") ||
          type.equals("MINUS") ||
          type.equals("TIMES") ||
          type.equals("DIV"))
      {
        checkLength(children, 2);
        return new ArithmeticExpression(ArithmeticOp.valueOf(type), 
            (IExpression) children.get(0),
            (IExpression) children.get(1));      
      }

      // binary ops
      if (type.equals("EQ") ||
          type.equals("NEQ") ||
          type.equals("LT") ||
          type.equals("GT") ||
          type.equals("LTE") ||
          type.equals("GTE"))
      {
        checkLength(children, 2);
        return new RelationalExpression(RelationalOp.valueOf(type), 
            (IExpression) children.get(0),
            (IExpression) children.get(1));      
      }

      // binary ops
      if (type.equals("AND") ||
          type.equals("OR"))
      {
        checkLength(children, 2);
        return new LogicalExpression(LogicalOp.valueOf(type), 
            (IExpression) children.get(0),
            (IExpression) children.get(1));      
      }

      // statements

      if (type.equals("ASSIGN"))
      {
        checkLength(children, 2);
        return new AssignmentStatement(
            (Identifier) children.get(0),
            (IExpression) children.get(1));      

      }          

      if (type.equals("IF"))
      {
        checkLength(children, 3);
        return new ConditionalStatement(
            (IExpression) children.get(0),
            (IStatement) children.get(1),
            (IStatement) children.get(2));
      }

      if (type.equals("WHILE"))
      {
        checkLength(children, 2);
        return new LoopStatement(
            (IExpression) children.get(0),
            (IStatement) children.get(1));
      }          

      if (type.equals("OUTPUT"))
      {
        checkLength(children, 1);
        return new OutputStatement((IExpression) children.get(0));
      }          

      if (type.equals("BLOCK"))
      {
        BlockStatement s = new BlockStatement();
        for (ProgramElement e : children)
        {
          s.addStatement((IStatement) e);
        }
        return s;
      }  
    }
    catch (ClassCastException e)
    {
      throw new InterpreterException("Parser error in creating ProgramElement with type " + type + ": " + e);
    }
    catch (Exception e)
    {
      throw new InterpreterException("Parser error in creating ProgramElement with type " + type + ": " + e);
    }
    
    throw new InterpreterException("Parser error, unable to create ProgramElement with type " + type);
  }
    
  private static void checkLength(ArrayList<ProgramElement> children, int expected)
  {
    int size = children.size();
    if (size != expected)
    {
      throw new InterpreterException("Parser error, wrong number of children");
    }
  }
  
}
