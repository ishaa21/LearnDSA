// Length of a String in Java
// Different methods to find the length of a string

public class LengthOfAString {
    public static void main(String[] args) {
        String str = "Hello World";
        
        // Method 1: Using length() method
        int len1 = str.length();
        System.out.println("Using length(): " + len1);
        
        // Method 2: Manual counting with loop
        int len2 = 0;
        for (char c : str.toCharArray()) {
            len2++;
        }
        System.out.println("Using loop on char array: " + len2);
        
        // Method 3: Using stream count
        long len3 = str.chars().count();
        System.out.println("Using stream count: " + len3);
        
        // Method 4: Using toCharArray length
        int len4 = str.toCharArray().length;
        System.out.println("Using toCharArray length: " + len4);
        
        // Method 5: Empty string length
        System.out.println("Empty string length: " + "".length());
        
        // Method 6: Single character length
        System.out.println("Single character length: " + "A".length());
        
        // Method 7: String with spaces
        String spacedStr = "Hello   World";
        System.out.println("String with spaces length: " + spacedStr.length());
        
        // Method 8: Comparing lengths
        String str1 = "Java";
        String str2 = "Programming";
        System.out.println("Length of '" + str1 + "': " + str1.length());
        System.out.println("Length of '" + str2 + "': " + str2.length());
    }
}
