package hw3; //Done

import api.IEnvironment;

/**
 * Concrete implementation of the IEnvironment interface.
 * @author Jay
 */
public class Environment implements IEnvironment
{
    
    private int Nam;
    private String Newname;

  @Override 
  public int get(String name) 
  {
     return Nam;
  }

  @Override
  public void put(String name, int value)
  {
    // TODO Auto-generated method stub
    Newname = name;
    Nam = value;
  }

  @Override
  public void remove(String name)
  {
    // TODO Auto-generated method stub
    name.replaceAll(Newname, null);
  }

}