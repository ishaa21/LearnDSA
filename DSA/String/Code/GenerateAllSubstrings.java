import java.util.ArrayList;
import java.util.List;

// Generate All Substrings in Java
// Print all possible substrings of a given string

public class GenerateAllSubstrings {
    
    // Method 1: Print substrings directly
    static void generateSubstrings(String str) {
        int len = str.length();
        int count = 0;
        
        System.out.println("All substrings:");
        
        // Outer loop for starting position
        for (int i = 0; i < len; i++) {
            // Inner loop for ending position
            for (int j = i + 1; j <= len; j++) {
                // Extract and print substring
                System.out.println(str.substring(i, j));
                count++;
            }
        }
        System.out.println("Total substrings: " + count);
    }
    
    // Method 2: Return substrings as list
    static List<String> generateSubstringsList(String str) {
        List<String> substrings = new ArrayList<>();
        int len = str.length();
        
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j <= len; j++) {
                substrings.add(str.substring(i, j));
            }
        }
        return substrings;
    }
    
    public static void main(String[] args) {
        // Test 1
        String str1 = "ABC";
        System.out.println("String: " + str1);
        System.out.println("Length: " + str1.length());
        System.out.println();
        
        generateSubstrings(str1);
        
        // Test 2
        System.out.println("\n\nString: HELLO");
        String str2 = "HELLO";
        
        List<String> substrings = generateSubstringsList(str2);
        System.out.println("All substrings:");
        for (String sub : substrings) {
            System.out.println(sub);
        }
        System.out.println("Total substrings: " + substrings.size());
        
        // Test 3: Substrings of specific length
        System.out.println("\n\nSubstrings of length 2:");
        String str3 = "HELLO";
        System.out.println("String: " + str3);
        for (int i = 0; i < str3.length() - 1; i++) {
            System.out.println(str3.substring(i, i + 2));
        }
    }
}
