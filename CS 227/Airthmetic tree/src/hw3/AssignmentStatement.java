package hw3;

import api.IEnvironment;
import api.IExpression;
import api.IStatement;

/**
 * Implementation of IStatement that represents an assignment to a variable in
 * the environment. Execution of an assignment statement causes the environment
 * to be updated with the new value of the variable. If the variable name is not
 * already in the environment, it is added.
 * 
 * @author Jay
 */
public class AssignmentStatement extends ProgramElement implements IStatement {
	/**
	 * Constructs an assignment statement representing v = e.
	 * 
	 * @param v
	 *            the identifier
	 * @param e
	 *            the expression to be assigned
	 */

	private IEnvironment statement;
	private int NumOfSubElements;

	public AssignmentStatement(Identifier v, IExpression e) {
		super("Assign", v.getText());
		// TODO - anything else you need
		v = (Identifier) e;
	}

	@Override
	public void execute(IEnvironment env) {
		// TODO Auto-generated method stub
		statement = env;
	}

	@Override
	public int getNumSubElements() {
		// TODO Auto-generated method stub
		return NumOfSubElements;
	}

	@Override
	public Object getSubElement(int index) {
		// TODO Auto-generated method stub
		
		return null;

	}

}
