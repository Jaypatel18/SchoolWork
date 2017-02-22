package hw3; //DONE

import api.IEnvironment;

/**
 * Expression type representing an identifier (variable). An identifier contains
 * a string to be used as a variable name. This element has no subelements.
 */
public class Identifier extends ValueExpression {
    /**
     * Constructs an identifier using the given string name.
     * 
     * @param givenName
     *            name for this identifier
     */
    private String name; // This will keep track of the name.
    public Identifier(String givenName) {
        super("Id", givenName);
        name = givenName;
        
    }

    @Override
    public int evaluate(IEnvironment env) {
        
        
        return env.get(name);
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