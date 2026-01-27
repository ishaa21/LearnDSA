// Remove a Character from a String in Java
// Remove character at specific position or by value

public class RemoveACharacter {
    public static void main(String[] args) {
        String str = "Hello World";
        
        System.out.println("Original string: " + str);
        
        // Method 1: Using substring()
        System.out.println("\nUsing substring():");
        int pos = 0;
        String result1 = str.substring(0, pos) + str.substring(pos + 1);
        System.out.println("After removing character at position 0: " + result1);
        
        // Method 2: Remove at position 5
        pos = 5;
        String result2 = str.substring(0, pos) + str.substring(pos + 1);
        System.out.println("After removing character at position 5: " + result2);
        
        // Method 3: Remove last character
        String result3 = str.substring(0, str.length() - 1);
        System.out.println("After removing last character: " + result3);
        
        // Method 4: Remove all occurrences of a character
        System.out.println("\nRemoving all 'l':");
        String result4 = str.replace("l", "");
        System.out.println("Using replace(): " + result4);
        
        // Method 5: Remove first occurrence only
        System.out.println("\nRemoving first 'l' only:");
        String result5 = str.replaceFirst("l", "");
        System.out.println("Using replaceFirst(): " + result5);
        
        // Method 6: Using StringBuilder
        System.out.println("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        sb.deleteCharAt(0);
        System.out.println("After removing character at position 0: " + sb.toString());
        
        // Method 7: Remove using StringBuilder and loop
        StringBuilder sb2 = new StringBuilder(str);
        for (int i = sb2.length() - 1; i >= 0; i--) {
            if (sb2.charAt(i) == 'l') {
                sb2.deleteCharAt(i);
            }
        }
        System.out.println("After removing all 'l' using StringBuilder: " + sb2.toString());
        
        // Method 8: Using filter with stream
        String result6 = str.chars()
                           .filter(c -> c != 'l')
                           .collect(StringBuilder::new, 
                                   (sb3, c) -> sb3.append((char)c), 
                                   (sb3, sb4) -> sb3.append(sb4))
                           .toString();
        System.out.println("Using stream filter: " + result6);
    }
}
