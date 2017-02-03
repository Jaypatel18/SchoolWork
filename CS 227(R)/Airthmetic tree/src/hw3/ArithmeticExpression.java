package hw3; // DONE

import api.ArithmeticOp;
import api.IEnvironment;
import api.IExpression;

/**
 * Binary expression with an arithmetic operator. This element has two
 * subelements, the expressions on the left and right sides, in that order.
 * 
 * @author Jay
 */
public class ArithmeticExpression extends BinaryExpression  {

	/**
	 * Constructs a binary expression from the given sub-expressions. This
	 * constructor does not check whether the given expressions are arithmetic
	 * expressions.
	 * 
	 * @param op
	 *            the binary operator
	 * @param lhs
	 *            expression on the left side
	 * @param rhs
	 *            expression on the right side
	 */
	private ArithmeticOp op; // This will keep track of the ArithmeticOp 
	private IExpression lhs; // THis will keep track of the lhs
	private IExpression rhs; //This will keep track of the rhs
	
	public ArithmeticExpression(ArithmeticOp op, IExpression lhs,
			IExpression rhs) {
		super(op.toString(), op.getText(), lhs, rhs);
		this.op = op;
		this.lhs = lhs;
		this.rhs = rhs;
	}
	

	@Override
	public int evaluate(IEnvironment env) { //This method will look at the lhs and rhs 
											//and also the arithmetic expression
		int result =0;
		int val1 = lhs.evaluate(env);
		int val2 = rhs.evaluate(env);
		if(op.toString().equals("PLUS"))
		{
			result = val1+val2;
			
		}
		if(op.toString().equals("MINUS"))
		{
			result = val1- val2;
		}
		if(op.toString().equals("TIMES"))
		{
			result = val1 * val2;
		}
		if(op.toString().equals("DIV"))
		{
			result = val1 / val2;
		}
		return result;
		
	}

	@Override
	public int getNumSubElements() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Object getSubElement(int index) {
		// TODO Auto-generated method stub
		return null;
	}

}
