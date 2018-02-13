package pa4;

public class WhileLoop {

	public static void main(String[] args) {

		/**
		 * This is part1
		 */
		
		System.out.println("This is part1");
		int num = 2;

		while (num < 20) {

			num = num + 2;
			System.out.print(num+" ");
		}

		/**
		 * This is part2
		 */
		System.out.println();
		System.out.println();
		System.out.println("This is part2");
		
		int i = 34;
		while (i < 49) {

			i++;
			if (i % 3 == 0) {

				System.out.print(i + " ");

			} else if (i % 5 == 0) {
				System.out.print(i + " ");
			}

		}
		
		/**
		 * This is part3
		 */
		
		System.out.println();
		System.out.println();
		System.out.println("This is part3");
		
		int sum=0;
		int j = 2;
		 while(j < 100){
			 j++;
			
			 if( j % 4 == 0){
				sum = sum + j;

			 }
		 
		 }
		 
		 System.out.println(sum);
	
	}

}
