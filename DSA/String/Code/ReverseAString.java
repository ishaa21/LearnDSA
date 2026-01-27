// Reverse a String in Java
// Different methods to reverse a string

public class ReverseAString {
    // Method 1: Using StringBuilder
    static String reverseStringBuilder(String str) {
        return new StringBuilder(str).reverse().toString();
    }
    
    // Method 2: Using loop
    static String reverseLoop(String str) {
        String result = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            result += str.charAt(i);
        }
        return result;
    }
    
    // Method 3: Using char array
    static String reverseCharArray(String str) {
        char[] chars = str.toCharArray();
        int left = 0, right = chars.length - 1;
        
        while (left < right) {
            char temp = chars[left];
            chars[left] = chars[right];
            chars[right] = temp;
            left++;
            right--;
        }
        return new String(chars);
    }
    
    // Method 4: Using recursion
    static String reverseRecursion(String str) {
        if (str.length() == 0)
            return str;
        else
            return reverseRecursion(str.substring(1)) + str.charAt(0);
    }
    
    public static void main(String[] args) {
        String str = "Hello World";
        
        // Method 1: Using StringBuilder (recommended)
        System.out.println("Method 1: Using StringBuilder");
        System.out.println("Original: " + str);
        System.out.println("Reversed: " + reverseStringBuilder(str));
        
        // Method 2: Using loop
        System.out.println("\nMethod 2: Using loop");
        String str2 = "Programming";
        System.out.println("Original: " + str2);
        System.out.println("Reversed: " + reverseLoop(str2));
        
        // Method 3: Using char array
        System.out.println("\nMethod 3: Using char array");
        String str3 = "Java";
        System.out.println("Original: " + str3);
        System.out.println("Reversed: " + reverseCharArray(str3));
        
        // Method 4: Using recursion
        System.out.println("\nMethod 4: Using recursion");
        String str4 = "Recursion";
        System.out.println("Original: " + str4);
        System.out.println("Reversed: " + reverseRecursion(str4));
        
        // Method 5: Using streams
        System.out.println("\nMethod 5: Using streams");
        String str5 = "Stream";
        String reversed = Stream.of(str5.split(""))
                               .reduce("", (a, b) -> b + a);
        System.out.println("Original: " + str5);
        System.out.println("Reversed: " + reversed);
    }
}

// Need to import for streams
import java.util.stream.Stream;
