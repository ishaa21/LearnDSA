// Concatenating Two Strings in Java
// Join two strings together

public class ConcatenatingTwoStrings {
    public static void main(String[] args) {
        String str1 = "Hello";
        String str2 = "World";
        
        // Method 1: Using + operator
        System.out.println("Method 1: Using + operator");
        String result1 = str1 + " " + str2;
        System.out.println("Result: " + result1);
        
        // Method 2: Using concat() method
        System.out.println("\nMethod 2: Using concat()");
        String result2 = str1.concat(" ").concat(str2);
        System.out.println("Result: " + result2);
        
        // Method 3: Using String.format()
        System.out.println("\nMethod 3: Using String.format()");
        String result3 = String.format("%s %s", str1, str2);
        System.out.println("Result: " + result3);
        
        // Method 4: Using StringBuilder
        System.out.println("\nMethod 4: Using StringBuilder");
        StringBuilder sb = new StringBuilder();
        sb.append(str1);
        sb.append(" ");
        sb.append(str2);
        String result4 = sb.toString();
        System.out.println("Result: " + result4);
        
        // Method 5: Using String.join() - Java 8+
        System.out.println("\nMethod 5: Using String.join()");
        String result5 = String.join(" ", str1, str2);
        System.out.println("Result: " + result5);
        
        // Method 6: Multiple strings
        System.out.println("\nMethod 6: Multiple strings");
        String str3 = "from";
        String str4 = "Java";
        String result6 = String.join(" ", str1, str2, str3, str4);
        System.out.println("Result: " + result6);
        
        // Method 7: Using StringJoiner
        System.out.println("\nMethod 7: Using StringJoiner");
        java.util.StringJoiner joiner = new java.util.StringJoiner(" ");
        joiner.add(str1).add(str2).add(str3).add(str4);
        System.out.println("Result: " + joiner.toString());
    }
}
