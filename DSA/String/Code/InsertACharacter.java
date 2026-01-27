// Insert a Character in a String in Java
// Insert character at specific position

public class InsertACharacter {
    static String insertChar(String str, int position, char ch) {
        return str.substring(0, position) + ch + str.substring(position);
    }
    
    public static void main(String[] args) {
        String str = "Hello World";
        
        System.out.println("Original string: " + str);
        
        // Method 1: Using substring and concatenation
        System.out.println("\nUsing substring:");
        String result1 = str.substring(0, 0) + 'H' + str.substring(0);
        System.out.println("After inserting 'H' at position 0: " + result1);
        
        // Method 2: Insert at position 5
        String result2 = str.substring(0, 5) + '!' + str.substring(5);
        System.out.println("After inserting '!' at position 5: " + result2);
        
        // Method 3: Insert at end
        String result3 = str + '!';
        System.out.println("After inserting '!' at end: " + result3);
        
        // Method 4: Using StringBuilder
        System.out.println("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        sb.insert(0, 'H');
        System.out.println("After inserting 'H' at position 0: " + sb.toString());
        
        // Method 5: Insert at multiple positions
        StringBuilder sb2 = new StringBuilder(str);
        sb2.insert(0, '*');
        sb2.insert(sb2.length(), '*');
        System.out.println("After inserting '*' at both ends: " + sb2.toString());
        
        // Method 6: Insert string of characters
        StringBuilder sb3 = new StringBuilder(str);
        sb3.insert(5, "***");
        System.out.println("After inserting '***' at position 5: " + sb3.toString());
        
        // Method 7: Using function
        System.out.println("\nUsing function:");
        String result4 = insertChar(str, 6, '@');
        System.out.println("After inserting '@' at position 6: " + result4);
    }
}
