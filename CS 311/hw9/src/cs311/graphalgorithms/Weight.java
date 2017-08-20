package cs311.graphalgorithms;
/**
 * 
 * @author Jay Patel
 *
 */
public class Weight implements IWeight 
{

	private double weight;
	
	/**
	 * @param weight
	 */
	public Weight(double weight) 
	{	
		//assiging it
		this.weight = weight;
	}
	
	@Override
	public double getWeight() 
	{
		//returning it
		return weight;
	}

}