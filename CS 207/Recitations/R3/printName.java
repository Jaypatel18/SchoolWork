package R3;

public class printName {

	public static void main(String[] args) {
		String firstName;
		String lastName;
		firstName = "John";
		lastName = "Atanasoff";
		String fullName;
		fullName = firstName + lastName;
        System.out.println(fullName);
        int firstLen = firstName.length();
        int secondLen = lastName.length();
        int fullLen = fullName.length();
        String str1 = firstName.substring(0,3);
        String str2 = lastName.substring(1,7);
        
        
	}

}
