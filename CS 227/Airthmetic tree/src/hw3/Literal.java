package hw3; //DONE

import api.IEnvironment;

/**
 * Expression type representing a literal integer value. This element has no sub
 * elements.
 * 
 * @author Jay
 */

public class Literal extends ValueExpression {
	/**
	 * Constructs a literal with the given value.
	 * 
	 * @param value
	 *            int value for this literal.
	 */
	private int expression; //This will keep track of the given environment

	public Literal(int value) {
		super("Int", "" + value);
		expression = value;
	}

	@Override
	public int evaluate(IEnvironment env) {
		return expression; // return in the given environment
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
