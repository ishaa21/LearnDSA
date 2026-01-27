// Remove All Occurrences of a Character in Java
// Remove all instances of a specific character

public class RemoveAllOccurrences {
    static String removeAllChar(String str, char target) {
        StringBuilder result = new StringBuilder();
        for (char c : str.toCharArray()) {
            if (c != target) {
                result.append(c);
            }
        }
        return result.toString();
    }
    
    public static void main(String[] args) {
        String str = "Hello World";
        
        System.out.println("Original string: " + str);
        
        // Method 1: Using replace()
        System.out.println("\nUsing replace():");
        String result1 = str.replace("l", "");
        System.out.println("After removing all 'l': " + result1);
        
        String result2 = str.replace("o", "");
        System.out.println("After removing all 'o': " + result2);
        
        String result3 = str.replace(" ", "");
        System.out.println("After removing all spaces: " + result3);
        
        // Method 2: Using replaceAll() with regex
        System.out.println("\nUsing replaceAll():");
        String result4 = str.replaceAll("l", "");
        System.out.println("After removing all 'l': " + result4);
        
        // Method 3: Using custom function
        System.out.println("\nUsing custom function:");
        String result5 = removeAllChar(str, 'l');
        System.out.println("After removing all 'l': " + result5);
        
        // Method 4: Using StringBuilder
        System.out.println("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        for (int i = sb.length() - 1; i >= 0; i--) {
            if (sb.charAt(i) == 'l') {
                sb.deleteCharAt(i);
            }
        }
        System.out.println("After removing all 'l': " + sb.toString());
        
        // Method 5: Using stream()
        System.out.println("\nUsing stream():");
        String result6 = str.chars()
                           .filter(c -> c != 'l')
                           .collect(StringBuilder::new, 
                                   (sb2, c) -> sb2.append((char)c), 
                                   (sb2, sb3) -> sb2.append(sb3))
                           .toString();
        System.out.println("After removing all 'l': " + result6);
        
        // Method 6: Manual approach
        System.out.println("\nManual approach:");
        String original = "Programming Language";
        char target = 'a';
        String result7 = removeAllChar(original, target);
        System.out.println("Original: " + original);
        System.out.println("After removing all '" + target + "': " + result7);
    }
}
