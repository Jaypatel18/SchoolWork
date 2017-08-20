package HW3;

/**
 * 
 * @author Jay Patel
 *
 */
public class MatrixOperations implements MatrixAnalysis 
{
	@Override
	/**
	 * using the method as given in the interface 
	 * 
	 */
	public long analyzeMultiply(double[][] m1, double[][] m2, double[][] m3) 
	{
		long TRT = 0;

		for (int i = 0; i < 3; i++) 
		{
			long CRT = System.currentTimeMillis();

			for (int j = 0; j < m1.length; j++) 
			{
				double it = 0;

				for (int k = 0; k < m1.length; k++) 
				{
					for (int m = 0; m < m1.length; m++) 
					{
						it += m1[j][m] * m2[m][k];
					}

					m3[j][k] = it;
				}
			}
			TRT = TRT + System.currentTimeMillis() - CRT;
		}
		return TRT / 3;
	}
	/**
	 * 
	 * No enough time to implement this
	 */
	@Override
	// For extra credit
	public long analyzeInverse(double[][] m1, double[][] m2) 
	{
		// TODO Auto-generated method stub
		return 0;
	}

}
