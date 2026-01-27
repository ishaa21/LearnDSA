// Check for Same (String Comparison) in Java
// Different methods to compare two strings

public class CheckForSame {
    public static void main(String[] args) {
        String str1 = "Hello";
        String str2 = "Hello";
        String str3 = "hello";
        String str4 = "World";
        
        // Method 1: Using equals() method - case sensitive
        System.out.println("Using equals() method:");
        System.out.println("str1.equals(str2): " + str1.equals(str2));  // true
        System.out.println("str1.equals(str3): " + str1.equals(str3));  // false
        System.out.println("str1.equals(str4): " + str1.equals(str4));  // false
        
        // Method 2: Using == operator (not recommended for content comparison)
        System.out.println("\nUsing == operator (reference comparison):");
        System.out.println("str1 == str2: " + (str1 == str2));
        
        // Method 3: Using equalsIgnoreCase() - case insensitive
        System.out.println("\nUsing equalsIgnoreCase():");
        System.out.println("str1.equalsIgnoreCase(str3): " + str1.equalsIgnoreCase(str3));  // true
        
        // Method 4: Using compareTo() method
        System.out.println("\nUsing compareTo():");
        System.out.println("str1.compareTo(str2): " + str1.compareTo(str2));  // 0 = equal
        System.out.println("str1.compareTo(str3): " + str1.compareTo(str3));  // > 0
        System.out.println("str1.compareTo(str4): " + str1.compareTo(str4));  // < 0
        
        // Method 5: Using compareToIgnoreCase() - case insensitive
        System.out.println("\nUsing compareToIgnoreCase():");
        System.out.println("str1.compareToIgnoreCase(str3): " + str1.compareToIgnoreCase(str3));  // 0
        
        // Method 6: Comparing substrings
        System.out.println("\nComparing substrings:");
        String str5 = "Helloworld";
        String str6 = "Hellouni";
        System.out.println("First 5 chars equal: " + str5.substring(0, 5).equals(str6.substring(0, 5)));
        
        // Method 7: Using contentEquals()
        System.out.println("\nUsing contentEquals():");
        System.out.println("str1.contentEquals(str2): " + str1.contentEquals(str2));
    }
}
