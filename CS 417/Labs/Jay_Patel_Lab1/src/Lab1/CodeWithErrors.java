package Lab1;

/**
 * 
 * @author Jay Patel
 *
 */
public class CodeWithErrors {
	
	public static int num10(int[] x) 
	{
		int c = 0;
		
		if (x.length > 4) 
		{
			return 0;
		} 
		
		else 
		{
			for (int i = 1; i < x.length; i++) // fault here
			{
				if (x[i] == 10) {
					c++;
				}
			}
			return c;
		}
	}
	
	

}
